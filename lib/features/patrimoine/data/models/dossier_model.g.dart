// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dossier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DossierModelImpl _$$DossierModelImplFromJson(Map<String, dynamic> json) =>
    _$DossierModelImpl(
      id: json['id'] as String,
      reference: json['reference'] as String,
      siteId: json['site_id'] as String?,
      objet: json['objet'] as String,
      categorie: json['categorie'] as String?,
      famille: $enumDecode(_$FamilleImmobilisationEnumMap, json['famille']),
      departement: json['departement'] as String?,
      demandeurId: json['demandeur_id'] as String,
      dateDemande: DateTime.parse(json['date_demande'] as String),
      montant: parseFlexibleDoubleNullable(json['montant']),
      budgetPrevu: parseFlexibleDoubleNullable(json['budget_prevu']),
      etapeCouranteId: $enumDecode(_$EtapeIdEnumMap, json['etape_courante_id']),
      qualification: $enumDecodeNullable(
        _$QualificationEnumMap,
        json['qualification'],
      ),
      compteComptable: json['compte_comptable'] as String?,
      fournisseur: json['fournisseur'] as String?,
      bonCommandeRef: json['bon_commande_ref'] as String?,
      factureRef: json['facture_ref'] as String?,
      alerte: json['alerte'] as String?,
      immobilisationsGenerees: json['immobilisations_generees'] as String?,
      motifSortie: $enumDecodeNullable(
        _$MotifSortieEnumMap,
        json['motif_sortie'],
      ),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      etapeGroupeId: $enumDecodeNullable(
        _$GroupeIdEnumMap,
        json['etape_groupe_id'],
      ),
      statut: json['statut'] as String?,
      rejetMotif: json['rejet_motif'] as String?,
      fournisseurId: json['fournisseur_id'] as String?,
    );

Map<String, dynamic> _$$DossierModelImplToJson(_$DossierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'site_id': instance.siteId,
      'objet': instance.objet,
      'categorie': instance.categorie,
      'famille': _$FamilleImmobilisationEnumMap[instance.famille]!,
      'departement': instance.departement,
      'demandeur_id': instance.demandeurId,
      'date_demande': instance.dateDemande.toIso8601String(),
      'montant': instance.montant,
      'budget_prevu': instance.budgetPrevu,
      'etape_courante_id': _$EtapeIdEnumMap[instance.etapeCouranteId]!,
      'qualification': _$QualificationEnumMap[instance.qualification],
      'compte_comptable': instance.compteComptable,
      'fournisseur': instance.fournisseur,
      'bon_commande_ref': instance.bonCommandeRef,
      'facture_ref': instance.factureRef,
      'alerte': instance.alerte,
      'immobilisations_generees': instance.immobilisationsGenerees,
      'motif_sortie': _$MotifSortieEnumMap[instance.motifSortie],
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'etape_groupe_id': _$GroupeIdEnumMap[instance.etapeGroupeId],
      'statut': instance.statut,
      'rejet_motif': instance.rejetMotif,
      'fournisseur_id': instance.fournisseurId,
    };

const _$FamilleImmobilisationEnumMap = {
  FamilleImmobilisation.immobilier: 'immobilier',
  FamilleImmobilisation.mobilier: 'mobilier',
};

const _$EtapeIdEnumMap = {
  EtapeId.besoin: 'besoin',
  EtapeId.verif: 'verif',
  EtapeId.autor: 'autor',
  EtapeId.consult: 'consult',
  EtapeId.bc: 'bc',
  EtapeId.bl: 'bl',
  EtapeId.fact: 'fact',
  EtapeId.qualif: 'qualif',
  EtapeId.immo: 'immo',
  EtapeId.sortie: 'sortie',
};

const _$QualificationEnumMap = {
  Qualification.immo: 'immo',
  Qualification.charge: 'charge',
  Qualification.arbitrage: 'arbitrage',
};

const _$MotifSortieEnumMap = {
  MotifSortie.vol: 'vol',
  MotifSortie.perte: 'perte',
  MotifSortie.accident: 'accident',
  MotifSortie.vente: 'vente',
  MotifSortie.rebut: 'rebut',
};

const _$GroupeIdEnumMap = {
  GroupeId.cmd: 'cmd',
  GroupeId.ach: 'ach',
  GroupeId.cpta: 'cpta',
  GroupeId.sortie: 'sortie',
};
