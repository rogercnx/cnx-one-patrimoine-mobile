// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immobilisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImmobilisationModelImpl _$$ImmobilisationModelImplFromJson(
  Map<String, dynamic> json,
) => _$ImmobilisationModelImpl(
  id: json['id'] as String,
  code: json['code'] as String,
  designation: json['designation'] as String,
  categorie: json['categorie'] as String,
  compteComptable: json['compteComptable'] as String,
  famille: $enumDecode(_$FamilleImmobilisationEnumMap, json['famille']),
  siteId: json['siteId'] as String,
  local: json['local'] as String,
  affectataire: json['affectataire'] as String,
  statut: $enumDecode(_$StatutBienEnumMap, json['statut']),
  etat: $enumDecode(_$EtatBienEnumMap, json['etat']),
  fournisseur: json['fournisseur'] as String,
  bonCommandeRef: json['bonCommandeRef'] as String,
  factureRef: json['factureRef'] as String?,
  dateAcquisition: DateTime.parse(json['dateAcquisition'] as String),
  valeurAcquisition: (json['valeurAcquisition'] as num).toDouble(),
  dateMiseService: json['dateMiseService'] == null
      ? null
      : DateTime.parse(json['dateMiseService'] as String),
  dureeAmortissement: (json['dureeAmortissement'] as num).toInt(),
  methodeAmortissement: $enumDecode(
    _$MethodeAmortissementEnumMap,
    json['methodeAmortissement'],
  ),
  montantAmorti: (json['montantAmorti'] as num).toDouble(),
  dateDernierInventaire: json['dateDernierInventaire'] == null
      ? null
      : DateTime.parse(json['dateDernierInventaire'] as String),
  sortieRef: json['sortieRef'] as String?,
  entretiens:
      (json['entretiens'] as List<dynamic>?)
          ?.map((e) => EntretienModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  attributions:
      (json['attributions'] as List<dynamic>?)
          ?.map((e) => AttributionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ImmobilisationModelImplToJson(
  _$ImmobilisationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'designation': instance.designation,
  'categorie': instance.categorie,
  'compteComptable': instance.compteComptable,
  'famille': _$FamilleImmobilisationEnumMap[instance.famille]!,
  'siteId': instance.siteId,
  'local': instance.local,
  'affectataire': instance.affectataire,
  'statut': _$StatutBienEnumMap[instance.statut]!,
  'etat': _$EtatBienEnumMap[instance.etat]!,
  'fournisseur': instance.fournisseur,
  'bonCommandeRef': instance.bonCommandeRef,
  'factureRef': instance.factureRef,
  'dateAcquisition': instance.dateAcquisition.toIso8601String(),
  'valeurAcquisition': instance.valeurAcquisition,
  'dateMiseService': instance.dateMiseService?.toIso8601String(),
  'dureeAmortissement': instance.dureeAmortissement,
  'methodeAmortissement':
      _$MethodeAmortissementEnumMap[instance.methodeAmortissement]!,
  'montantAmorti': instance.montantAmorti,
  'dateDernierInventaire': instance.dateDernierInventaire?.toIso8601String(),
  'sortieRef': instance.sortieRef,
  'entretiens': instance.entretiens,
  'attributions': instance.attributions,
  'photos': instance.photos,
};

const _$FamilleImmobilisationEnumMap = {
  FamilleImmobilisation.immobilier: 'immobilier',
  FamilleImmobilisation.mobilier: 'mobilier',
};

const _$StatutBienEnumMap = {
  StatutBien.actif: 'actif',
  StatutBien.stock: 'stock',
  StatutBien.sortie: 'sortie',
  StatutBien.cede: 'cede',
};

const _$EtatBienEnumMap = {
  EtatBien.neuf: 'neuf',
  EtatBien.bon: 'bon',
  EtatBien.moyen: 'moyen',
  EtatBien.degrade: 'degrade',
  EtatBien.horsService: 'horsservice',
};

const _$MethodeAmortissementEnumMap = {
  MethodeAmortissement.lineaire: 'lineaire',
  MethodeAmortissement.degressif: 'degressif',
  MethodeAmortissement.nonAmortissable: 'non_amortissable',
};
