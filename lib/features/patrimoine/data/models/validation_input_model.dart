import 'package:freezed_annotation/freezed_annotation.dart';

import 'patrimoine_enums.dart';

part 'validation_input_model.freezed.dart';
part 'validation_input_model.g.dart';

/// Corps de `POST /dossiers/:id/validations` — confirmé par la doc Seven
/// (2026-09-15). Les 3 champs sont requis. Requête en camelCase.
///
/// ⚠️ Pas de garde anti-double-validation côté backend (revalider le même
/// rôle avance l'étape à nouveau) — Seven le signale explicitement. Éviter
/// tout double appel (double-tap réseau) ; un debounce/lock côté UI est
/// laissé pour une tâche ultérieure (hors périmètre ici).
@freezed
class ValidationInput with _$ValidationInput {
  const factory ValidationInput({
    required GroupeId groupeId,
    required RoleValidation role,
    required StatutValidation statut,
  }) = _ValidationInput;

  factory ValidationInput.fromJson(Map<String, dynamic> json) => _$ValidationInputFromJson(json);
}
