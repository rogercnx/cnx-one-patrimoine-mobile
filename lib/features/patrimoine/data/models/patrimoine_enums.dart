import 'package:json_annotation/json_annotation.dart';

/// Enums confirmés par la doc Seven (2026-09-15, schémas Patrimoine) pour
/// le circuit Dossiers (workflow complet) et le résultat réel d'un comptage
/// — distincts des enums UI-only de `immobilisation_enums.dart`
/// ([ResultatComptage]) qui portent des sous-cas propres à l'écran Fiche
/// détail, jamais envoyés au backend tels quels.

/// Résultat réel d'un comptage (`inventaire_comptages.resultat`), confirmé
/// par l'exemple JSON de Seven et par le corps de `POST .../comptages`.
enum ResultatInventaire {
  @JsonValue('ok')
  ok,
  @JsonValue('ecart')
  ecart,
  @JsonValue('introuvable')
  introuvable,
}

/// `workflow_groupes.id` — confirmé par CLAUDE.md section 3.1 (Partie 2,
/// non re-détaillé par Seven mais non contredit ; les valeurs `cmd`/`sortie`
/// apparaissent explicitement dans ses exemples de requête).
enum GroupeId {
  @JsonValue('cmd')
  cmd,
  @JsonValue('ach')
  ach,
  @JsonValue('cpta')
  cpta,
  @JsonValue('sortie')
  sortie,
}

/// `workflow_etapes.id` — confirmé par CLAUDE.md section 3.1 (Partie 2) ;
/// les valeurs `immo`/`cpta`/`fact`/`consult`/`bc`/`bl`/`qualif`/`sortie`
/// apparaissent explicitement dans les exemples de Seven.
enum EtapeId {
  @JsonValue('besoin')
  besoin,
  @JsonValue('verif')
  verif,
  @JsonValue('autor')
  autor,
  @JsonValue('consult')
  consult,
  @JsonValue('bc')
  bc,
  @JsonValue('bl')
  bl,
  @JsonValue('fact')
  fact,
  @JsonValue('qualif')
  qualif,
  @JsonValue('immo')
  immo,
  @JsonValue('sortie')
  sortie,
}

/// Rôle dans le circuit "3 mains" — confirmé par Seven (`POST
/// /dossiers/:id/validations`).
enum RoleValidation {
  @JsonValue('maker')
  maker,
  @JsonValue('controleur')
  controleur,
  @JsonValue('autorisation')
  autorisation,
}

/// Statut d'une validation côté mobile — confirmé par Seven : **pas** de
/// `ko` sur cet espace (spécifique à l'espace web organisation).
enum StatutValidation {
  @JsonValue('ok')
  ok,
  @JsonValue('attente')
  attente,
}

/// `dossiers.qualification` — confirmé par Seven (`POST
/// /dossiers/:id/qualification`) et CLAUDE.md section 3.1.
enum Qualification {
  @JsonValue('immo')
  immo,
  @JsonValue('charge')
  charge,
  @JsonValue('arbitrage')
  arbitrage,
}

/// `dossiers.motif_sortie` — confirmé par Seven (`POST /dossiers/:id/sortie`).
enum MotifSortie {
  @JsonValue('vol')
  vol,
  @JsonValue('perte')
  perte,
  @JsonValue('accident')
  accident,
  @JsonValue('vente')
  vente,
  @JsonValue('rebut')
  rebut,
}

/// `dossier_justificatifs.statut` — confirmé par Seven.
enum StatutJustificatif {
  @JsonValue('fourni')
  fourni,
  @JsonValue('manquant')
  manquant,
}
