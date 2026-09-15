// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dossier_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DossierInputImpl _$$DossierInputImplFromJson(Map<String, dynamic> json) =>
    _$DossierInputImpl(
      groupeId: $enumDecodeNullable(_$GroupeIdEnumMap, json['groupeId']),
      siteId: json['siteId'] as String?,
      objet: json['objet'] as String?,
      categorie: json['categorie'] as String?,
      famille: $enumDecodeNullable(
        _$FamilleImmobilisationEnumMap,
        json['famille'],
      ),
      departement: json['departement'] as String?,
      montant: (json['montant'] as num?)?.toDouble(),
      budgetPrevu: (json['budgetPrevu'] as num?)?.toDouble(),
      compteComptable: json['compteComptable'] as String?,
      fournisseur: json['fournisseur'] as String?,
      bonCommandeRef: json['bonCommandeRef'] as String?,
      factureRef: json['factureRef'] as String?,
      alerte: json['alerte'] as String?,
    );

Map<String, dynamic> _$$DossierInputImplToJson(
  _$DossierInputImpl instance,
) => <String, dynamic>{
  if (_$GroupeIdEnumMap[instance.groupeId] case final value?) 'groupeId': value,
  if (instance.siteId case final value?) 'siteId': value,
  if (instance.objet case final value?) 'objet': value,
  if (instance.categorie case final value?) 'categorie': value,
  if (_$FamilleImmobilisationEnumMap[instance.famille] case final value?)
    'famille': value,
  if (instance.departement case final value?) 'departement': value,
  if (instance.montant case final value?) 'montant': value,
  if (instance.budgetPrevu case final value?) 'budgetPrevu': value,
  if (instance.compteComptable case final value?) 'compteComptable': value,
  if (instance.fournisseur case final value?) 'fournisseur': value,
  if (instance.bonCommandeRef case final value?) 'bonCommandeRef': value,
  if (instance.factureRef case final value?) 'factureRef': value,
  if (instance.alerte case final value?) 'alerte': value,
};

const _$GroupeIdEnumMap = {
  GroupeId.cmd: 'cmd',
  GroupeId.ach: 'ach',
  GroupeId.cpta: 'cpta',
  GroupeId.sortie: 'sortie',
};

const _$FamilleImmobilisationEnumMap = {
  FamilleImmobilisation.immobilier: 'immobilier',
  FamilleImmobilisation.mobilier: 'mobilier',
};
