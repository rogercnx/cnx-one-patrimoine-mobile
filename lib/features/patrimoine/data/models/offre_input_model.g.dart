// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offre_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OffreInputImpl _$$OffreInputImplFromJson(Map<String, dynamic> json) =>
    _$OffreInputImpl(
      fournisseur: json['fournisseur'] as String,
      montant: (json['montant'] as num?)?.toDouble(),
      delai: json['delai'] as String?,
      observation: json['observation'] as String?,
    );

Map<String, dynamic> _$$OffreInputImplToJson(_$OffreInputImpl instance) =>
    <String, dynamic>{
      'fournisseur': instance.fournisseur,
      if (instance.montant case final value?) 'montant': value,
      if (instance.delai case final value?) 'delai': value,
      if (instance.observation case final value?) 'observation': value,
    };
