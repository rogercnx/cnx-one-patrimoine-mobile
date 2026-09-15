import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../data/models/immobilisation_enums.dart';
import '../../data/models/patrimoine_enums.dart';

/// Carte de base (fond blanc, bord clair, ombre légère) — équivalent du
/// `PinvCard` du design de référence.
class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child, this.padding, this.onTap});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
    if (onTap == null) return content;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(borderRadius: BorderRadius.circular(16), onTap: onTap, child: content),
    );
  }
}

/// Pastille colorée (statut, état, résultat de comptage...).
class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.label, required this.bg, required this.fg, this.dot = false, this.small = false});

  final String label;
  final Color bg;
  final Color fg;
  final bool dot;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: small ? 8 : 10, vertical: small ? 3 : 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(width: 6, height: 6, decoration: BoxDecoration(color: fg, shape: BoxShape.circle)),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: TextStyle(fontSize: small ? 10.5 : 11.5, fontWeight: FontWeight.w700, color: fg),
          ),
        ],
      ),
    );
  }
}

extension EtatBienStyle on EtatBien {
  Color get color => switch (this) {
        EtatBien.neuf || EtatBien.bon => AppColors.good,
        EtatBien.moyen => AppColors.warn,
        EtatBien.degrade || EtatBien.horsService => AppColors.bad,
      };

  Color get background => switch (this) {
        EtatBien.neuf => AppColors.goodBg,
        EtatBien.bon => AppColors.goodBgSoft,
        EtatBien.moyen => AppColors.warnBg,
        EtatBien.degrade || EtatBien.horsService => AppColors.badBg,
      };
}

extension StatutBienStyle on StatutBien {
  Color get color => switch (this) {
        StatutBien.actif => AppColors.good,
        StatutBien.stock => AppColors.ink2,
        StatutBien.sortie => AppColors.warn,
        StatutBien.cede => AppColors.ink3,
      };

  Color get background => switch (this) {
        StatutBien.actif => AppColors.goodBg,
        StatutBien.stock => AppColors.neutralBg,
        StatutBien.sortie => AppColors.warnBg,
        StatutBien.cede => AppColors.neutralBgSoft,
      };
}

extension ResultatComptageStyle on ResultatComptage {
  Color get color => switch (this) {
        ResultatComptage.ok => AppColors.good,
        ResultatComptage.etat => AppColors.warn,
        ResultatComptage.lieu => AppColors.info,
        ResultatComptage.affect => AppColors.violet,
        ResultatComptage.introuvable => AppColors.bad,
      };

  Color get background => switch (this) {
        ResultatComptage.ok => AppColors.goodBg,
        ResultatComptage.etat => AppColors.warnBg,
        ResultatComptage.lieu => AppColors.infoBg,
        ResultatComptage.affect => AppColors.violetBg,
        ResultatComptage.introuvable => AppColors.badBg,
      };

  IconData get icon => switch (this) {
        ResultatComptage.ok => Icons.check_rounded,
        ResultatComptage.etat => Icons.edit_rounded,
        ResultatComptage.lieu => Icons.place_rounded,
        ResultatComptage.affect => Icons.group_rounded,
        ResultatComptage.introuvable => Icons.warning_amber_rounded,
      };
}

/// Résultat réel d'un comptage (`ok`/`ecart`/`introuvable`, vrai schéma
/// `inventaire_comptages`) — pendant de [ResultatComptageStyle] mais sans
/// les sous-cas UI-only (`etat`/`lieu`/`affect`, jamais envoyés au backend).
extension ResultatInventaireStyle on ResultatInventaire {
  Color get color => switch (this) {
        ResultatInventaire.ok => AppColors.good,
        ResultatInventaire.ecart => AppColors.warn,
        ResultatInventaire.introuvable => AppColors.bad,
      };

  Color get background => switch (this) {
        ResultatInventaire.ok => AppColors.goodBg,
        ResultatInventaire.ecart => AppColors.warnBg,
        ResultatInventaire.introuvable => AppColors.badBg,
      };

  IconData get icon => switch (this) {
        ResultatInventaire.ok => Icons.check_rounded,
        ResultatInventaire.ecart => Icons.edit_rounded,
        ResultatInventaire.introuvable => Icons.warning_amber_rounded,
      };

  String get label => switch (this) {
        ResultatInventaire.ok => 'Conforme',
        ResultatInventaire.ecart => 'Écart',
        ResultatInventaire.introuvable => 'Introuvable',
      };
}

/// Titre de section en petites majuscules, avec action optionnelle à droite.
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.action, this.onAction});

  final String title;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1, color: AppColors.ink4),
          ),
          if (action != null)
            GestureDetector(
              onTap: onAction,
              child: Text(action!, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.brand)),
            ),
        ],
      ),
    );
  }
}

/// Anneau de progression circulaire avec contenu centré (% comptés à l'Accueil).
class ProgressRing extends StatelessWidget {
  const ProgressRing({super.key, required this.value, required this.child, this.size = 92, this.strokeWidth = 9});

  final double value;
  final Widget child;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(value: value.clamp(0, 1), strokeWidth: strokeWidth),
          ),
          child,
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.value, required this.strokeWidth});

  final double value;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final track = Paint()
      ..color = AppColors.sunken
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, track);

    final progress = Paint()
      ..color = AppColors.brand
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      progress,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) => oldDelegate.value != value;
}

/// Tuile KPI (valeur chiffrée + libellé) de la grille d'Accueil.
class KpiTile extends StatelessWidget {
  const KpiTile({super.key, required this.label, required this.value, this.sub, this.tone});

  final String label;
  final String value;
  final String? sub;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: AppColors.ink3, height: 1.2)),
          const SizedBox(height: 3),
          Text(value, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, letterSpacing: -0.5, color: tone ?? AppColors.ink, height: 1.05)),
          if (sub != null) ...[
            const SizedBox(height: 2),
            Text(sub!, style: const TextStyle(fontSize: 10, color: AppColors.ink4, fontWeight: FontWeight.w600)),
          ],
        ],
      ),
    );
  }
}

/// Ligne libellé/valeur cliquable (fiche détail — état, emplacement, affectation).
class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.sub,
    this.icon,
    this.onTap,
    this.showDivider = true,
  });

  final String label;
  final String value;
  final String? sub;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: showDivider ? const Border(bottom: BorderSide(color: AppColors.lineSoft)) : null,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(9)),
                child: Icon(icon, size: 15, color: AppColors.ink2),
              ),
              const SizedBox(width: 11),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.ink3)),
                  const SizedBox(height: 2),
                  Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.ink)),
                  if (sub != null) ...[
                    const SizedBox(height: 2),
                    Text(sub!, style: const TextStyle(fontSize: 11, color: AppColors.ink4)),
                  ],
                ],
              ),
            ),
            if (onTap != null) const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.ink4),
          ],
        ),
      ),
    );
  }
}

/// Bouton principal pleine largeur (fond `tone`, texte blanc) — `PinvBtn`.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPressed, this.icon, this.tone, this.foreground});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? tone;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon, size: 17) : const SizedBox.shrink(),
        label: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        style: ElevatedButton.styleFrom(
          backgroundColor: tone ?? AppColors.brand,
          foregroundColor: foreground ?? Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}

/// Bouton secondaire (contour, fond blanc) — `PinvBtn ghost`.
class GhostButton extends StatelessWidget {
  const GhostButton({super.key, required this.label, required this.onPressed, this.icon, this.foreground});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon, size: 16) : const SizedBox.shrink(),
        label: Text(label, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
        style: OutlinedButton.styleFrom(
          foregroundColor: foreground ?? AppColors.ink2,
          side: const BorderSide(color: AppColors.line),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}

/// Ouvre une feuille modale bas d'écran stylée comme le reste de l'app.
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required String title,
  String? subtitle,
  required Widget child,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 9),
            Container(width: 40, height: 5, decoration: BoxDecoration(color: AppColors.line, borderRadius: BorderRadius.circular(999))),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w800, letterSpacing: -0.4)),
                        if (subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                        ],
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, size: 18),
                    style: IconButton.styleFrom(backgroundColor: AppColors.sunken, foregroundColor: AppColors.ink2),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: child),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Liste de choix radio en feuille modale (état / affectataire).
class OptionPicker extends StatelessWidget {
  const OptionPicker({super.key, required this.options, required this.value, required this.onChanged});

  final List<({String id, String label, String? sub, Widget? tag})> options;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (i, o) in options.indexed)
            InkWell(
              onTap: () => onChanged(o.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                decoration: BoxDecoration(
                  color: o.id == value ? AppColors.soft : Colors.transparent,
                  border: i == options.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: o.id == value ? AppColors.card : Colors.transparent,
                        border: Border.all(color: o.id == value ? AppColors.brand : AppColors.line, width: o.id == value ? 6 : 1.8),
                      ),
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(o.label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.ink)),
                          if (o.sub != null)
                            Text(o.sub!, style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    if (o.tag != null) o.tag!,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
