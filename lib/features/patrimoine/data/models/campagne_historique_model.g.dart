// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campagne_historique_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContributionAgentModelImpl _$$ContributionAgentModelImplFromJson(
  Map<String, dynamic> json,
) => _$ContributionAgentModelImpl(
  nom: json['nom'] as String,
  biensComptes: (json['biensComptes'] as num).toInt(),
  ecarts: (json['ecarts'] as num).toInt(),
);

Map<String, dynamic> _$$ContributionAgentModelImplToJson(
  _$ContributionAgentModelImpl instance,
) => <String, dynamic>{
  'nom': instance.nom,
  'biensComptes': instance.biensComptes,
  'ecarts': instance.ecarts,
};

_$CampagneHistoriqueModelImpl _$$CampagneHistoriqueModelImplFromJson(
  Map<String, dynamic> json,
) => _$CampagneHistoriqueModelImpl(
  reference: json['reference'] as String,
  libelle: json['libelle'] as String,
  periodeLabel: json['periodeLabel'] as String,
  totalBiens: (json['totalBiens'] as num).toInt(),
  biensComptes: (json['biensComptes'] as num).toInt(),
  ecarts: (json['ecarts'] as num).toInt(),
  introuvables: (json['introuvables'] as num).toInt(),
  contributions:
      (json['contributions'] as List<dynamic>?)
          ?.map(
            (e) => ContributionAgentModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  mouvements:
      (json['mouvements'] as List<dynamic>?)
          ?.map((e) => ComptageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CampagneHistoriqueModelImplToJson(
  _$CampagneHistoriqueModelImpl instance,
) => <String, dynamic>{
  'reference': instance.reference,
  'libelle': instance.libelle,
  'periodeLabel': instance.periodeLabel,
  'totalBiens': instance.totalBiens,
  'biensComptes': instance.biensComptes,
  'ecarts': instance.ecarts,
  'introuvables': instance.introuvables,
  'contributions': instance.contributions,
  'mouvements': instance.mouvements,
};
