// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livraison_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LivraisonInputImpl _$$LivraisonInputImplFromJson(Map<String, dynamic> json) =>
    _$LivraisonInputImpl(
      reference: json['reference'] as String,
      quantiteRecue: (json['quantiteRecue'] as num).toInt(),
      commentaire: json['commentaire'] as String?,
    );

Map<String, dynamic> _$$LivraisonInputImplToJson(
  _$LivraisonInputImpl instance,
) => <String, dynamic>{
  'reference': instance.reference,
  'quantiteRecue': instance.quantiteRecue,
  if (instance.commentaire case final value?) 'commentaire': value,
};
