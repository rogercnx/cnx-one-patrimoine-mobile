import '../../../core/error/result.dart';
import '../domain/patrimoine_repository.dart';
import 'mock/patrimoine_mock_data.dart';
import 'models/agent_model.dart';
import 'models/campagne_historique_model.dart';
import 'models/campagne_model.dart';
import 'models/comptage_model.dart';
import 'models/immobilisation_model.dart';
import 'models/site_model.dart';

/// Implémentation mock de [PatrimoineRepository] — utilisée tant que le
/// backend Zira24 n'expose pas les routes `/patrimoine/...` (CLAUDE.md 2.6).
/// Simule une latence réseau réaliste pour que le loading state des écrans
/// soit visible et testable comme avec une vraie API.
class PatrimoineRepositoryMock implements PatrimoineRepository {
  final List<ComptageModel> _session = List.of(PatrimoineMockData.comptagesSession);

  Future<void> _latence() => Future.delayed(const Duration(milliseconds: 400));

  @override
  Future<Result<AgentModel>> getAgentConnecte() async {
    await _latence();
    return Success(PatrimoineMockData.agentConnecte);
  }

  @override
  Future<Result<CampagneModel>> getCampagneEnCours() async {
    await _latence();
    return Success(PatrimoineMockData.campagneEnCours);
  }

  @override
  Future<Result<List<SiteModel>>> getSites() async {
    await _latence();
    return Success(PatrimoineMockData.sites);
  }

  @override
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId}) async {
    await _latence();
    final all = PatrimoineMockData.immobilisations;
    return Success(siteId == null ? all : all.where((m) => m.siteId == siteId).toList());
  }

  @override
  Future<Result<ImmobilisationModel>> getImmobilisation(String id) async {
    await _latence();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == id);
    if (match.isEmpty) return Failure(NotFoundException('Bien introuvable : $id'));
    return Success(match.first);
  }

  @override
  Future<Result<ImmobilisationModel?>> resoudreCode(String code) async {
    await _latence();
    final v = code.trim().toUpperCase();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == v || m.id.endsWith(v));
    return Success(match.isEmpty ? null : match.first);
  }

  @override
  Future<Result<List<ComptageModel>>> getComptagesSession() async {
    await _latence();
    return Success(List.unmodifiable(_session));
  }

  @override
  Future<Result<void>> validerComptage(ComptageModel comptage) async {
    await _latence();
    _session.removeWhere((c) => c.immobilisationId == comptage.immobilisationId);
    _session.add(comptage);
    return const Success(null);
  }

  @override
  Future<Result<List<CampagneHistoriqueModel>>> getCampagnesCloturees() async {
    await _latence();
    return Success(PatrimoineMockData.campagnesCloturees);
  }

  @override
  Future<Result<List<String>>> getAffectatairesPossibles() async {
    await _latence();
    return Success(PatrimoineMockData.affectatairesPossibles);
  }

  @override
  Future<Result<List<String>>> getLocauxDuSite(String siteId) async {
    await _latence();
    return Success(PatrimoineMockData.locauxParSite[siteId] ?? const []);
  }
}
