import 'package:json_annotation/json_annotation.dart';

/// État physique constaté du bien. Valeurs alignées sur `immobilisations.etat`
/// (CLAUDE.md — spécifications backend).
enum EtatBien {
  @JsonValue('neuf')
  neuf('Neuf'),
  @JsonValue('bon')
  bon('Bon état'),
  @JsonValue('moyen')
  moyen('État moyen'),
  @JsonValue('degrade')
  degrade('Dégradé'),
  @JsonValue('horsservice')
  horsService('Hors service');

  const EtatBien(this.label);

  final String label;
}

/// Statut administratif du bien (`immobilisations.statut`).
enum StatutBien {
  @JsonValue('actif')
  actif('En service'),
  @JsonValue('stock')
  stock('En réserve'),
  @JsonValue('sortie')
  sortie('Sortie en cours'),
  @JsonValue('cede')
  cede('Cédé');

  const StatutBien(this.label);

  final String label;
}

/// Famille comptable du bien (`immobilisations.famille`).
enum FamilleImmobilisation {
  @JsonValue('immobilier')
  immobilier,
  @JsonValue('mobilier')
  mobilier,
}

/// Méthode d'amortissement (`immobilisations.methode_amortissement`).
enum MethodeAmortissement {
  @JsonValue('lineaire')
  lineaire('Linéaire'),
  @JsonValue('degressif')
  degressif('Dégressif'),
  @JsonValue('non_amortissable')
  nonAmortissable('Non amortissable');

  const MethodeAmortissement(this.label);

  final String label;
}

/// Résultat d'un comptage d'inventaire (`inventaire_comptages.resultat`),
/// étendu ici aux sous-cas d'écart utilisés par l'écran Fiche détail
/// (état modifié / déplacé / réaffecté) pour piloter le badge affiché.
enum ResultatComptage {
  @JsonValue('ok')
  ok('Conforme'),
  @JsonValue('etat')
  etat('État modifié'),
  @JsonValue('lieu')
  lieu('Déplacé'),
  @JsonValue('affect')
  affect('Réaffecté'),
  @JsonValue('introuvable')
  introuvable('Introuvable');

  const ResultatComptage(this.label);

  final String label;
}
