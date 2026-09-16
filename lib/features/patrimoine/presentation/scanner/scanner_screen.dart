import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/error/result.dart';
import '../../../../theme/app_breakpoints.dart';
import '../../../../theme/app_colors.dart';
import '../../data/models/comptage_model.dart';
import '../../data/models/immobilisation_model.dart';
import '../fiche/fiche_detail_screen.dart';
import '../patrimoine_providers.dart';
import '../shared/async_state_views.dart';
import '../shared/patrimoine_widgets.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  final _controller = MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
  final _codeController = TextEditingController();
  String? _erreurSaisie;
  bool _busy = false;
  bool _cameraIndisponible = false;

  // Tablette uniquement — bien affiché dans le panneau de droite (pas de
  // navigation/push, juste un changement d'état). Mis à jour à chaque build
  // depuis la largeur disponible (point de décision responsive local).
  bool _tablette = false;
  String? _selectionId;

  @override
  void dispose() {
    _controller.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _ouvrirFiche(String id) async {
    if (_busy) return;
    setState(() => _busy = true);
    await _controller.stop();
    if (!mounted) return;
    setState(() => _busy = false);
    if (_tablette) {
      setState(() => _selectionId = id);
      await _controller.start();
      return;
    }
    context.push('/fiche/$id').then((_) {
      if (mounted) _controller.start();
    });
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    final value = capture.barcodes.firstOrNull?.rawValue;
    if (value == null || value.isEmpty) return;
    final resultat = await ref.read(patrimoineRepositoryProvider).resoudreCode(value);
    final immo = resultat.unwrap();
    if (immo != null) {
      _ouvrirFiche(immo.id);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('QR non reconnu : $value')));
    }
  }

  Future<void> _validerSaisieManuelle() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) return;
    final resultat = await ref.read(patrimoineRepositoryProvider).resoudreCode(code);
    final immo = resultat.unwrap();
    if (immo == null) {
      setState(() => _erreurSaisie = 'Aucun bien ne correspond à ce code.');
      return;
    }
    setState(() => _erreurSaisie = null);
    _codeController.clear();
    _ouvrirFiche(immo.id);
  }

  @override
  Widget build(BuildContext context) {
    _tablette = isTabletWidth(MediaQuery.sizeOf(context).width);
    final registryAsync = ref.watch(patrimoineRegistryProvider);
    final sessionAsync = ref.watch(comptagesSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const _Title(eyebrow: 'LECTURE DES ÉTIQUETTES QR', title: 'Scanner'),
      ),
      body: registryAsync.when(
        loading: () => const LoadingView(),
        error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(patrimoineRegistryProvider)),
        data: (registry) => sessionAsync.when(
          loading: () => const LoadingView(),
          error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(comptagesSessionProvider)),
          data: (session) {
            final master = _master(registry, session);
            if (!_tablette) return master;

            // Tablette : panneau maître (scanner + liste) à gauche, fiche
            // détail du bien sélectionné à droite — pas de navigation/push.
            return Row(
              children: [
                SizedBox(width: 380, child: master),
                const VerticalDivider(width: 1, thickness: 1, color: AppColors.line),
                Expanded(
                  child: _selectionId == null
                      ? const _AucuneSelection()
                      : FicheDetailContent(
                          key: ValueKey(_selectionId),
                          immobilisationId: _selectionId!,
                          onFerme: () => setState(() => _selectionId = null),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _master(PatrimoineRegistry registry, List<ComptageModel> session) {
    final restants = registry.immobilisations.where((m) => !session.any((s) => s.immobilisationId == m.id)).toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 26),
      children: [
        _Viseur(
          controller: _controller,
          busy: _busy,
          campagneRef: registry.campagne.reference,
          onIndisponible: () => setState(() => _cameraIndisponible = true),
          onDetect: _onDetect,
        ),
        if (_cameraIndisponible) ...[
          const SizedBox(height: 10),
          const Text(
            "Caméra indisponible sur cet appareil — utilisez la saisie manuelle ou la liste ci-dessous.",
            style: TextStyle(fontSize: 11.5, color: AppColors.warn, fontWeight: FontWeight.w600),
          ),
        ],
        const SizedBox(height: 18),
        const SectionTitle(title: 'Saisie manuelle du code'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _codeController,
                textCapitalization: TextCapitalization.characters,
                onSubmitted: (_) => _validerSaisieManuelle(),
                decoration: InputDecoration(
                  hintText: 'IMMO-2026-0813',
                  filled: true,
                  fillColor: AppColors.card,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 52,
              height: 46,
              child: ElevatedButton(
                onPressed: _validerSaisieManuelle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.ink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.zero,
                ),
                child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
        if (_erreurSaisie != null) ...[
          const SizedBox(height: 6),
          Text(_erreurSaisie!, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.bad)),
        ],
        const SizedBox(height: 18),
        SectionTitle(title: 'Reste à compter · ${restants.length}'),
        AppCard(
          child: restants.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                  child: Column(
                    children: [
                      Icon(Icons.check_rounded, size: 22, color: AppColors.good),
                      SizedBox(height: 8),
                      Text('Périmètre entièrement compté', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
                      SizedBox(height: 4),
                      Text('Vous pouvez transmettre votre session au responsable.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: AppColors.ink3)),
                    ],
                  ),
                )
              : Column(
                  children: [
                    for (final (i, m) in restants.take(6).toList().indexed)
                      _RestantRow(
                        immo: m,
                        site: registry.sites.where((s) => s.id == m.siteId).firstOrNull?.nom ?? m.siteId ?? '—',
                        showDivider: i != restants.take(6).length - 1,
                        selected: _tablette && _selectionId == m.id,
                        onTap: () => _ouvrirFiche(m.id),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

/// État vide du panneau de droite (tablette, aucun bien sélectionné).
class _AucuneSelection extends StatelessWidget {
  const _AucuneSelection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.qr_code_scanner_rounded, size: 26, color: AppColors.ink3),
            ),
            const SizedBox(height: 14),
            const Text('Scannez un bien pour voir ses détails', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.ink2)),
            const SizedBox(height: 4),
            const Text(
              'Ou sélectionnez-en un dans la liste "Reste à compter".',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.ink3, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.eyebrow, required this.title});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(eyebrow, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1, color: AppColors.ink4)),
        Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.6, color: AppColors.ink)),
      ],
    );
  }
}

class _Viseur extends StatelessWidget {
  const _Viseur({required this.controller, required this.busy, required this.campagneRef, required this.onIndisponible, required this.onDetect});

  final MobileScannerController controller;
  final bool busy;
  final String campagneRef;
  final VoidCallback onIndisponible;
  final void Function(BarcodeCapture) onDetect;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: SizedBox(
        height: 320,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: const Color(0xFF16120F)),
            MobileScanner(
              controller: controller,
              onDetect: onDetect,
              errorBuilder: (context, error, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) => onIndisponible());
                return const SizedBox.shrink();
              },
            ),
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.4),
                    radius: 1.1,
                    colors: [Colors.black.withValues(alpha: 0.05), Colors.black.withValues(alpha: 0.55)],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 196,
                height: 196,
                child: CustomPaint(painter: _CornersPainter(active: busy)),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 18,
              child: Column(
                children: [
                  Text(
                    busy ? 'Lecture du QR code…' : "Placez l'étiquette QR dans le cadre",
                    style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  if (!busy) ...[
                    const SizedBox(height: 4),
                    Text("Douchez le cadre pour tester l'appareil photo", style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.55))),
                  ],
                ],
              ),
            ),
            Positioned(
              left: 14,
              top: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(999)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF7FD4A4), shape: BoxShape.circle)),
                    const SizedBox(width: 7),
                    Text(campagneRef, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CornersPainter extends CustomPainter {
  _CornersPainter({required this.active});

  final bool active;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = active ? const Color(0xFF7FD4A4) : Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    const len = 24.0;
    final w = size.width, h = size.height;
    final path = Path()
      ..moveTo(0, len)..lineTo(0, 0)..lineTo(len, 0)
      ..moveTo(w - len, 0)..lineTo(w, 0)..lineTo(w, len)
      ..moveTo(w, h - len)..lineTo(w, h)..lineTo(w - len, h)
      ..moveTo(len, h)..lineTo(0, h)..lineTo(0, h - len);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CornersPainter oldDelegate) => oldDelegate.active != active;
}

class _RestantRow extends StatelessWidget {
  const _RestantRow({required this.immo, required this.site, required this.showDivider, this.selected = false, required this.onTap});

  final ImmobilisationModel immo;
  final String site;
  final bool showDivider;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.soft : null,
          border: showDivider ? const Border(bottom: BorderSide(color: AppColors.lineSoft)) : null,
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.qr_code_rounded, size: 16, color: AppColors.ink3),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(immo.designation, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                  Text('${immo.id} · $site', style: const TextStyle(fontSize: 11, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.ink4),
          ],
        ),
      ),
    );
  }
}
