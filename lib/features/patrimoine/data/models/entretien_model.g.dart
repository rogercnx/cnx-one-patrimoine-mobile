// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entretien_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntretienModelImpl _$$EntretienModelImplFromJson(Map<String, dynamic> json) =>
    _$EntretienModelImpl(
      id: json['id'] as String,
      immobilisationId: json['immobilisation_id'] as String?,
      date: DateTime.parse(json['date'] as String),
      titre: json['titre'] as String,
      cout: parseFlexibleDouble(json['cout']),
      prestataire: json['prestataire'] as String,
      observation: json['observation'] as String?,
      bonCommandeRef: json['bon_commande_ref'] as String?,
      bonLivraisonRef: json['bon_livraison_ref'] as String?,
      factureRef: json['facture_ref'] as String?,
      dossierRef: json['dossier_ref'] as String?,
      dureeIntervention: json['duree_intervention'] as String?,
      technicien: json['technicien'] as String?,
    );

Map<String, dynamic> _$$EntretienModelImplToJson(
  _$EntretienModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'immobilisation_id': instance.immobilisationId,
  'date': instance.date.toIso8601String(),
  'titre': instance.titre,
  'cout': instance.cout,
  'prestataire': instance.prestataire,
  'observation': instance.observation,
  'bon_commande_ref': instance.bonCommandeRef,
  'bon_livraison_ref': instance.bonLivraisonRef,
  'facture_ref': instance.factureRef,
  'dossier_ref': instance.dossierRef,
  'duree_intervention': instance.dureeIntervention,
  'technicien': instance.technicien,
};
