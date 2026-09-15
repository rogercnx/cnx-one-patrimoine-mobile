// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entretien_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntretienModelImpl _$$EntretienModelImplFromJson(Map<String, dynamic> json) =>
    _$EntretienModelImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      titre: json['titre'] as String,
      cout: (json['cout'] as num).toDouble(),
      prestataire: json['prestataire'] as String,
      observation: json['observation'] as String?,
      bonCommandeRef: json['bonCommandeRef'] as String?,
      bonLivraisonRef: json['bonLivraisonRef'] as String?,
      factureRef: json['factureRef'] as String?,
      dossierRef: json['dossierRef'] as String?,
      dureeIntervention: json['dureeIntervention'] as String?,
      technicien: json['technicien'] as String?,
    );

Map<String, dynamic> _$$EntretienModelImplToJson(
  _$EntretienModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'titre': instance.titre,
  'cout': instance.cout,
  'prestataire': instance.prestataire,
  'observation': instance.observation,
  'bonCommandeRef': instance.bonCommandeRef,
  'bonLivraisonRef': instance.bonLivraisonRef,
  'factureRef': instance.factureRef,
  'dossierRef': instance.dossierRef,
  'dureeIntervention': instance.dureeIntervention,
  'technicien': instance.technicien,
};
