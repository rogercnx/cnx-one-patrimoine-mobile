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
  compteComptable: json['compte_comptable'] as String?,
  famille: $enumDecode(_$FamilleImmobilisationEnumMap, json['famille']),
  siteId: json['site_id'] as String?,
  local: json['local'] as String?,
  affectataire: json['affectataire'] as String?,
  statut: $enumDecode(_$StatutBienEnumMap, json['statut']),
  etat: $enumDecode(_$EtatBienEnumMap, json['etat']),
  fournisseur: json['fournisseur'] as String?,
  bonCommandeRef: json['bon_commande_ref'] as String?,
  factureRef: json['facture_ref'] as String?,
  dateAcquisition: DateTime.parse(json['date_acquisition'] as String),
  valeurAcquisition: parseFlexibleDoubleNullable(json['valeur_acquisition']),
  dateMiseService: json['date_mise_service'] == null
      ? null
      : DateTime.parse(json['date_mise_service'] as String),
  dureeAmortissement: (json['duree_amortissement'] as num).toInt(),
  methodeAmortissement: $enumDecode(
    _$MethodeAmortissementEnumMap,
    json['methode_amortissement'],
  ),
  montantAmorti: parseFlexibleDouble(json['montant_amorti']),
  dateDernierInventaire: json['date_dernier_inventaire'] == null
      ? null
      : DateTime.parse(json['date_dernier_inventaire'] as String),
  sortieRef: json['sortie_ref'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  departement: json['departement'] as String?,
  dossierId: json['dossier_id'] as String?,
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
  'compte_comptable': instance.compteComptable,
  'famille': _$FamilleImmobilisationEnumMap[instance.famille]!,
  'site_id': instance.siteId,
  'local': instance.local,
  'affectataire': instance.affectataire,
  'statut': _$StatutBienEnumMap[instance.statut]!,
  'etat': _$EtatBienEnumMap[instance.etat]!,
  'fournisseur': instance.fournisseur,
  'bon_commande_ref': instance.bonCommandeRef,
  'facture_ref': instance.factureRef,
  'date_acquisition': instance.dateAcquisition.toIso8601String(),
  'valeur_acquisition': instance.valeurAcquisition,
  'date_mise_service': instance.dateMiseService?.toIso8601String(),
  'duree_amortissement': instance.dureeAmortissement,
  'methode_amortissement':
      _$MethodeAmortissementEnumMap[instance.methodeAmortissement]!,
  'montant_amorti': instance.montantAmorti,
  'date_dernier_inventaire': instance.dateDernierInventaire?.toIso8601String(),
  'sortie_ref': instance.sortieRef,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'departement': instance.departement,
  'dossier_id': instance.dossierId,
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
