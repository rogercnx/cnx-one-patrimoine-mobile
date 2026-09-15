// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sortie_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JustificatifInputImpl _$$JustificatifInputImplFromJson(
  Map<String, dynamic> json,
) => _$JustificatifInputImpl(
  libelle: json['libelle'] as String,
  statut: $enumDecode(_$StatutJustificatifEnumMap, json['statut']),
);

Map<String, dynamic> _$$JustificatifInputImplToJson(
  _$JustificatifInputImpl instance,
) => <String, dynamic>{
  'libelle': instance.libelle,
  'statut': _$StatutJustificatifEnumMap[instance.statut]!,
};

const _$StatutJustificatifEnumMap = {
  StatutJustificatif.fourni: 'fourni',
  StatutJustificatif.manquant: 'manquant',
};

_$SortieInputImpl _$$SortieInputImplFromJson(Map<String, dynamic> json) =>
    _$SortieInputImpl(
      motif: $enumDecode(_$MotifSortieEnumMap, json['motif']),
      justificatifs: (json['justificatifs'] as List<dynamic>?)
          ?.map((e) => JustificatifInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SortieInputImplToJson(_$SortieInputImpl instance) =>
    <String, dynamic>{
      'motif': _$MotifSortieEnumMap[instance.motif]!,
      if (instance.justificatifs case final value?) 'justificatifs': value,
    };

const _$MotifSortieEnumMap = {
  MotifSortie.vol: 'vol',
  MotifSortie.perte: 'perte',
  MotifSortie.accident: 'accident',
  MotifSortie.vente: 'vente',
  MotifSortie.rebut: 'rebut',
};
