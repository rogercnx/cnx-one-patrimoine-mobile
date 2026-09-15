import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribution_model.dart';
import 'entretien_model.dart';
import 'immobilisation_enums.dart';
import 'photo_model.dart';

part 'immobilisation_model.freezed.dart';
part 'immobilisation_model.g.dart';

/// `immobilisations` — fiche complète d'un bien du registre patrimonial.
@freezed
class ImmobilisationModel with _$ImmobilisationModel {
  const ImmobilisationModel._();

  const factory ImmobilisationModel({
    required String id,
    required String code,
    required String designation,
    required String categorie,
    required String compteComptable,
    required FamilleImmobilisation famille,
    required String siteId,
    required String local,
    required String affectataire,
    required StatutBien statut,
    required EtatBien etat,
    required String fournisseur,
    required String bonCommandeRef,
    String? factureRef,
    required DateTime dateAcquisition,
    required double valeurAcquisition,
    DateTime? dateMiseService,
    required int dureeAmortissement,
    required MethodeAmortissement methodeAmortissement,
    required double montantAmorti,
    DateTime? dateDernierInventaire,
    String? sortieRef,
    @Default([]) List<EntretienModel> entretiens,
    @Default([]) List<AttributionModel> attributions,
    @Default([]) List<PhotoModel> photos,
  }) = _ImmobilisationModel;

  factory ImmobilisationModel.fromJson(Map<String, dynamic> json) => _$ImmobilisationModelFromJson(json);

  /// Valeur nette comptable = valeur d'acquisition − amortissement cumulé.
  double get valeurNetteComptable => valeurAcquisition - montantAmorti;
}
