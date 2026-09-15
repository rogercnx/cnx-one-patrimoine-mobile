/// Convertisseurs JSON partagés par les modèles Patrimoine réels.
///
/// Confirmé par la doc Seven (2026-09-15) : les montants (`valeur_acquisition`,
/// `montant_amorti`, `montant`, `budget_prevu`) et les coordonnées de site
/// (`latitude`, `longitude`) arrivent en JSON comme des **chaînes**
/// (ex. `"1066666.67"`), pas des nombres — le backend délègue le stockage
/// précis à un type décimal SQL sérialisé en texte. [parseFlexibleDouble]
/// accepte aussi un nombre JSON brut par sécurité (si un champ non
/// explicitement testé par Seven s'avère numérique plutôt que string).
double parseFlexibleDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);
  throw FormatException('Valeur numérique (string ou num) attendue, reçu : $value');
}

double? parseFlexibleDoubleNullable(dynamic value) => value == null ? null : parseFlexibleDouble(value);
