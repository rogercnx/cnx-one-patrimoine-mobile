// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dossier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DossierModel _$DossierModelFromJson(Map<String, dynamic> json) {
  return _DossierModel.fromJson(json);
}

/// @nodoc
mixin _$DossierModel {
  String get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id')
  String? get siteId => throw _privateConstructorUsedError;
  String get objet => throw _privateConstructorUsedError;
  String? get categorie => throw _privateConstructorUsedError;
  FamilleImmobilisation get famille => throw _privateConstructorUsedError;
  String? get departement => throw _privateConstructorUsedError;
  @JsonKey(name: 'demandeur_id')
  String get demandeurId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_demande')
  DateTime get dateDemande => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseFlexibleDoubleNullable)
  double? get montant => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
  double? get budgetPrevu => throw _privateConstructorUsedError;
  @JsonKey(name: 'etape_courante_id')
  EtapeId get etapeCouranteId => throw _privateConstructorUsedError;
  Qualification? get qualification => throw _privateConstructorUsedError;
  @JsonKey(name: 'compte_comptable')
  String? get compteComptable => throw _privateConstructorUsedError;
  String? get fournisseur => throw _privateConstructorUsedError;
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'facture_ref')
  String? get factureRef => throw _privateConstructorUsedError;
  String? get alerte => throw _privateConstructorUsedError;
  @JsonKey(name: 'immobilisations_generees')
  String? get immobilisationsGenerees => throw _privateConstructorUsedError;
  @JsonKey(name: 'motif_sortie')
  MotifSortie? get motifSortie => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError; // Additives (chantier web organisation, même table partagée) — nullable.
  @JsonKey(name: 'etape_groupe_id')
  GroupeId? get etapeGroupeId => throw _privateConstructorUsedError;
  String? get statut => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejet_motif')
  String? get rejetMotif => throw _privateConstructorUsedError;
  @JsonKey(name: 'fournisseur_id')
  String? get fournisseurId => throw _privateConstructorUsedError;

  /// Serializes this DossierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DossierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DossierModelCopyWith<DossierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DossierModelCopyWith<$Res> {
  factory $DossierModelCopyWith(
    DossierModel value,
    $Res Function(DossierModel) then,
  ) = _$DossierModelCopyWithImpl<$Res, DossierModel>;
  @useResult
  $Res call({
    String id,
    String reference,
    @JsonKey(name: 'site_id') String? siteId,
    String objet,
    String? categorie,
    FamilleImmobilisation famille,
    String? departement,
    @JsonKey(name: 'demandeur_id') String demandeurId,
    @JsonKey(name: 'date_demande') DateTime dateDemande,
    @JsonKey(fromJson: parseFlexibleDoubleNullable) double? montant,
    @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
    double? budgetPrevu,
    @JsonKey(name: 'etape_courante_id') EtapeId etapeCouranteId,
    Qualification? qualification,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    String? alerte,
    @JsonKey(name: 'immobilisations_generees') String? immobilisationsGenerees,
    @JsonKey(name: 'motif_sortie') MotifSortie? motifSortie,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'etape_groupe_id') GroupeId? etapeGroupeId,
    String? statut,
    @JsonKey(name: 'rejet_motif') String? rejetMotif,
    @JsonKey(name: 'fournisseur_id') String? fournisseurId,
  });
}

/// @nodoc
class _$DossierModelCopyWithImpl<$Res, $Val extends DossierModel>
    implements $DossierModelCopyWith<$Res> {
  _$DossierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DossierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? siteId = freezed,
    Object? objet = null,
    Object? categorie = freezed,
    Object? famille = null,
    Object? departement = freezed,
    Object? demandeurId = null,
    Object? dateDemande = null,
    Object? montant = freezed,
    Object? budgetPrevu = freezed,
    Object? etapeCouranteId = null,
    Object? qualification = freezed,
    Object? compteComptable = freezed,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? alerte = freezed,
    Object? immobilisationsGenerees = freezed,
    Object? motifSortie = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? etapeGroupeId = freezed,
    Object? statut = freezed,
    Object? rejetMotif = freezed,
    Object? fournisseurId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            siteId: freezed == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            objet: null == objet
                ? _value.objet
                : objet // ignore: cast_nullable_to_non_nullable
                      as String,
            categorie: freezed == categorie
                ? _value.categorie
                : categorie // ignore: cast_nullable_to_non_nullable
                      as String?,
            famille: null == famille
                ? _value.famille
                : famille // ignore: cast_nullable_to_non_nullable
                      as FamilleImmobilisation,
            departement: freezed == departement
                ? _value.departement
                : departement // ignore: cast_nullable_to_non_nullable
                      as String?,
            demandeurId: null == demandeurId
                ? _value.demandeurId
                : demandeurId // ignore: cast_nullable_to_non_nullable
                      as String,
            dateDemande: null == dateDemande
                ? _value.dateDemande
                : dateDemande // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            montant: freezed == montant
                ? _value.montant
                : montant // ignore: cast_nullable_to_non_nullable
                      as double?,
            budgetPrevu: freezed == budgetPrevu
                ? _value.budgetPrevu
                : budgetPrevu // ignore: cast_nullable_to_non_nullable
                      as double?,
            etapeCouranteId: null == etapeCouranteId
                ? _value.etapeCouranteId
                : etapeCouranteId // ignore: cast_nullable_to_non_nullable
                      as EtapeId,
            qualification: freezed == qualification
                ? _value.qualification
                : qualification // ignore: cast_nullable_to_non_nullable
                      as Qualification?,
            compteComptable: freezed == compteComptable
                ? _value.compteComptable
                : compteComptable // ignore: cast_nullable_to_non_nullable
                      as String?,
            fournisseur: freezed == fournisseur
                ? _value.fournisseur
                : fournisseur // ignore: cast_nullable_to_non_nullable
                      as String?,
            bonCommandeRef: freezed == bonCommandeRef
                ? _value.bonCommandeRef
                : bonCommandeRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            factureRef: freezed == factureRef
                ? _value.factureRef
                : factureRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            alerte: freezed == alerte
                ? _value.alerte
                : alerte // ignore: cast_nullable_to_non_nullable
                      as String?,
            immobilisationsGenerees: freezed == immobilisationsGenerees
                ? _value.immobilisationsGenerees
                : immobilisationsGenerees // ignore: cast_nullable_to_non_nullable
                      as String?,
            motifSortie: freezed == motifSortie
                ? _value.motifSortie
                : motifSortie // ignore: cast_nullable_to_non_nullable
                      as MotifSortie?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            etapeGroupeId: freezed == etapeGroupeId
                ? _value.etapeGroupeId
                : etapeGroupeId // ignore: cast_nullable_to_non_nullable
                      as GroupeId?,
            statut: freezed == statut
                ? _value.statut
                : statut // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejetMotif: freezed == rejetMotif
                ? _value.rejetMotif
                : rejetMotif // ignore: cast_nullable_to_non_nullable
                      as String?,
            fournisseurId: freezed == fournisseurId
                ? _value.fournisseurId
                : fournisseurId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DossierModelImplCopyWith<$Res>
    implements $DossierModelCopyWith<$Res> {
  factory _$$DossierModelImplCopyWith(
    _$DossierModelImpl value,
    $Res Function(_$DossierModelImpl) then,
  ) = __$$DossierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String reference,
    @JsonKey(name: 'site_id') String? siteId,
    String objet,
    String? categorie,
    FamilleImmobilisation famille,
    String? departement,
    @JsonKey(name: 'demandeur_id') String demandeurId,
    @JsonKey(name: 'date_demande') DateTime dateDemande,
    @JsonKey(fromJson: parseFlexibleDoubleNullable) double? montant,
    @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
    double? budgetPrevu,
    @JsonKey(name: 'etape_courante_id') EtapeId etapeCouranteId,
    Qualification? qualification,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    String? alerte,
    @JsonKey(name: 'immobilisations_generees') String? immobilisationsGenerees,
    @JsonKey(name: 'motif_sortie') MotifSortie? motifSortie,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'etape_groupe_id') GroupeId? etapeGroupeId,
    String? statut,
    @JsonKey(name: 'rejet_motif') String? rejetMotif,
    @JsonKey(name: 'fournisseur_id') String? fournisseurId,
  });
}

/// @nodoc
class __$$DossierModelImplCopyWithImpl<$Res>
    extends _$DossierModelCopyWithImpl<$Res, _$DossierModelImpl>
    implements _$$DossierModelImplCopyWith<$Res> {
  __$$DossierModelImplCopyWithImpl(
    _$DossierModelImpl _value,
    $Res Function(_$DossierModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DossierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? siteId = freezed,
    Object? objet = null,
    Object? categorie = freezed,
    Object? famille = null,
    Object? departement = freezed,
    Object? demandeurId = null,
    Object? dateDemande = null,
    Object? montant = freezed,
    Object? budgetPrevu = freezed,
    Object? etapeCouranteId = null,
    Object? qualification = freezed,
    Object? compteComptable = freezed,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? alerte = freezed,
    Object? immobilisationsGenerees = freezed,
    Object? motifSortie = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? etapeGroupeId = freezed,
    Object? statut = freezed,
    Object? rejetMotif = freezed,
    Object? fournisseurId = freezed,
  }) {
    return _then(
      _$DossierModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        siteId: freezed == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        objet: null == objet
            ? _value.objet
            : objet // ignore: cast_nullable_to_non_nullable
                  as String,
        categorie: freezed == categorie
            ? _value.categorie
            : categorie // ignore: cast_nullable_to_non_nullable
                  as String?,
        famille: null == famille
            ? _value.famille
            : famille // ignore: cast_nullable_to_non_nullable
                  as FamilleImmobilisation,
        departement: freezed == departement
            ? _value.departement
            : departement // ignore: cast_nullable_to_non_nullable
                  as String?,
        demandeurId: null == demandeurId
            ? _value.demandeurId
            : demandeurId // ignore: cast_nullable_to_non_nullable
                  as String,
        dateDemande: null == dateDemande
            ? _value.dateDemande
            : dateDemande // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        montant: freezed == montant
            ? _value.montant
            : montant // ignore: cast_nullable_to_non_nullable
                  as double?,
        budgetPrevu: freezed == budgetPrevu
            ? _value.budgetPrevu
            : budgetPrevu // ignore: cast_nullable_to_non_nullable
                  as double?,
        etapeCouranteId: null == etapeCouranteId
            ? _value.etapeCouranteId
            : etapeCouranteId // ignore: cast_nullable_to_non_nullable
                  as EtapeId,
        qualification: freezed == qualification
            ? _value.qualification
            : qualification // ignore: cast_nullable_to_non_nullable
                  as Qualification?,
        compteComptable: freezed == compteComptable
            ? _value.compteComptable
            : compteComptable // ignore: cast_nullable_to_non_nullable
                  as String?,
        fournisseur: freezed == fournisseur
            ? _value.fournisseur
            : fournisseur // ignore: cast_nullable_to_non_nullable
                  as String?,
        bonCommandeRef: freezed == bonCommandeRef
            ? _value.bonCommandeRef
            : bonCommandeRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        factureRef: freezed == factureRef
            ? _value.factureRef
            : factureRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        alerte: freezed == alerte
            ? _value.alerte
            : alerte // ignore: cast_nullable_to_non_nullable
                  as String?,
        immobilisationsGenerees: freezed == immobilisationsGenerees
            ? _value.immobilisationsGenerees
            : immobilisationsGenerees // ignore: cast_nullable_to_non_nullable
                  as String?,
        motifSortie: freezed == motifSortie
            ? _value.motifSortie
            : motifSortie // ignore: cast_nullable_to_non_nullable
                  as MotifSortie?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        etapeGroupeId: freezed == etapeGroupeId
            ? _value.etapeGroupeId
            : etapeGroupeId // ignore: cast_nullable_to_non_nullable
                  as GroupeId?,
        statut: freezed == statut
            ? _value.statut
            : statut // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejetMotif: freezed == rejetMotif
            ? _value.rejetMotif
            : rejetMotif // ignore: cast_nullable_to_non_nullable
                  as String?,
        fournisseurId: freezed == fournisseurId
            ? _value.fournisseurId
            : fournisseurId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DossierModelImpl implements _DossierModel {
  const _$DossierModelImpl({
    required this.id,
    required this.reference,
    @JsonKey(name: 'site_id') this.siteId,
    required this.objet,
    this.categorie,
    required this.famille,
    this.departement,
    @JsonKey(name: 'demandeur_id') required this.demandeurId,
    @JsonKey(name: 'date_demande') required this.dateDemande,
    @JsonKey(fromJson: parseFlexibleDoubleNullable) this.montant,
    @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
    this.budgetPrevu,
    @JsonKey(name: 'etape_courante_id') required this.etapeCouranteId,
    this.qualification,
    @JsonKey(name: 'compte_comptable') this.compteComptable,
    this.fournisseur,
    @JsonKey(name: 'bon_commande_ref') this.bonCommandeRef,
    @JsonKey(name: 'facture_ref') this.factureRef,
    this.alerte,
    @JsonKey(name: 'immobilisations_generees') this.immobilisationsGenerees,
    @JsonKey(name: 'motif_sortie') this.motifSortie,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'etape_groupe_id') this.etapeGroupeId,
    this.statut,
    @JsonKey(name: 'rejet_motif') this.rejetMotif,
    @JsonKey(name: 'fournisseur_id') this.fournisseurId,
  });

  factory _$DossierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DossierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String reference;
  @override
  @JsonKey(name: 'site_id')
  final String? siteId;
  @override
  final String objet;
  @override
  final String? categorie;
  @override
  final FamilleImmobilisation famille;
  @override
  final String? departement;
  @override
  @JsonKey(name: 'demandeur_id')
  final String demandeurId;
  @override
  @JsonKey(name: 'date_demande')
  final DateTime dateDemande;
  @override
  @JsonKey(fromJson: parseFlexibleDoubleNullable)
  final double? montant;
  @override
  @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
  final double? budgetPrevu;
  @override
  @JsonKey(name: 'etape_courante_id')
  final EtapeId etapeCouranteId;
  @override
  final Qualification? qualification;
  @override
  @JsonKey(name: 'compte_comptable')
  final String? compteComptable;
  @override
  final String? fournisseur;
  @override
  @JsonKey(name: 'bon_commande_ref')
  final String? bonCommandeRef;
  @override
  @JsonKey(name: 'facture_ref')
  final String? factureRef;
  @override
  final String? alerte;
  @override
  @JsonKey(name: 'immobilisations_generees')
  final String? immobilisationsGenerees;
  @override
  @JsonKey(name: 'motif_sortie')
  final MotifSortie? motifSortie;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  // Additives (chantier web organisation, même table partagée) — nullable.
  @override
  @JsonKey(name: 'etape_groupe_id')
  final GroupeId? etapeGroupeId;
  @override
  final String? statut;
  @override
  @JsonKey(name: 'rejet_motif')
  final String? rejetMotif;
  @override
  @JsonKey(name: 'fournisseur_id')
  final String? fournisseurId;

  @override
  String toString() {
    return 'DossierModel(id: $id, reference: $reference, siteId: $siteId, objet: $objet, categorie: $categorie, famille: $famille, departement: $departement, demandeurId: $demandeurId, dateDemande: $dateDemande, montant: $montant, budgetPrevu: $budgetPrevu, etapeCouranteId: $etapeCouranteId, qualification: $qualification, compteComptable: $compteComptable, fournisseur: $fournisseur, bonCommandeRef: $bonCommandeRef, factureRef: $factureRef, alerte: $alerte, immobilisationsGenerees: $immobilisationsGenerees, motifSortie: $motifSortie, createdAt: $createdAt, updatedAt: $updatedAt, etapeGroupeId: $etapeGroupeId, statut: $statut, rejetMotif: $rejetMotif, fournisseurId: $fournisseurId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DossierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.objet, objet) || other.objet == objet) &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.famille, famille) || other.famille == famille) &&
            (identical(other.departement, departement) ||
                other.departement == departement) &&
            (identical(other.demandeurId, demandeurId) ||
                other.demandeurId == demandeurId) &&
            (identical(other.dateDemande, dateDemande) ||
                other.dateDemande == dateDemande) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.budgetPrevu, budgetPrevu) ||
                other.budgetPrevu == budgetPrevu) &&
            (identical(other.etapeCouranteId, etapeCouranteId) ||
                other.etapeCouranteId == etapeCouranteId) &&
            (identical(other.qualification, qualification) ||
                other.qualification == qualification) &&
            (identical(other.compteComptable, compteComptable) ||
                other.compteComptable == compteComptable) &&
            (identical(other.fournisseur, fournisseur) ||
                other.fournisseur == fournisseur) &&
            (identical(other.bonCommandeRef, bonCommandeRef) ||
                other.bonCommandeRef == bonCommandeRef) &&
            (identical(other.factureRef, factureRef) ||
                other.factureRef == factureRef) &&
            (identical(other.alerte, alerte) || other.alerte == alerte) &&
            (identical(
                  other.immobilisationsGenerees,
                  immobilisationsGenerees,
                ) ||
                other.immobilisationsGenerees == immobilisationsGenerees) &&
            (identical(other.motifSortie, motifSortie) ||
                other.motifSortie == motifSortie) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.etapeGroupeId, etapeGroupeId) ||
                other.etapeGroupeId == etapeGroupeId) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.rejetMotif, rejetMotif) ||
                other.rejetMotif == rejetMotif) &&
            (identical(other.fournisseurId, fournisseurId) ||
                other.fournisseurId == fournisseurId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    reference,
    siteId,
    objet,
    categorie,
    famille,
    departement,
    demandeurId,
    dateDemande,
    montant,
    budgetPrevu,
    etapeCouranteId,
    qualification,
    compteComptable,
    fournisseur,
    bonCommandeRef,
    factureRef,
    alerte,
    immobilisationsGenerees,
    motifSortie,
    createdAt,
    updatedAt,
    etapeGroupeId,
    statut,
    rejetMotif,
    fournisseurId,
  ]);

  /// Create a copy of DossierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DossierModelImplCopyWith<_$DossierModelImpl> get copyWith =>
      __$$DossierModelImplCopyWithImpl<_$DossierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DossierModelImplToJson(this);
  }
}

abstract class _DossierModel implements DossierModel {
  const factory _DossierModel({
    required final String id,
    required final String reference,
    @JsonKey(name: 'site_id') final String? siteId,
    required final String objet,
    final String? categorie,
    required final FamilleImmobilisation famille,
    final String? departement,
    @JsonKey(name: 'demandeur_id') required final String demandeurId,
    @JsonKey(name: 'date_demande') required final DateTime dateDemande,
    @JsonKey(fromJson: parseFlexibleDoubleNullable) final double? montant,
    @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
    final double? budgetPrevu,
    @JsonKey(name: 'etape_courante_id') required final EtapeId etapeCouranteId,
    final Qualification? qualification,
    @JsonKey(name: 'compte_comptable') final String? compteComptable,
    final String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') final String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') final String? factureRef,
    final String? alerte,
    @JsonKey(name: 'immobilisations_generees')
    final String? immobilisationsGenerees,
    @JsonKey(name: 'motif_sortie') final MotifSortie? motifSortie,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'etape_groupe_id') final GroupeId? etapeGroupeId,
    final String? statut,
    @JsonKey(name: 'rejet_motif') final String? rejetMotif,
    @JsonKey(name: 'fournisseur_id') final String? fournisseurId,
  }) = _$DossierModelImpl;

  factory _DossierModel.fromJson(Map<String, dynamic> json) =
      _$DossierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get reference;
  @override
  @JsonKey(name: 'site_id')
  String? get siteId;
  @override
  String get objet;
  @override
  String? get categorie;
  @override
  FamilleImmobilisation get famille;
  @override
  String? get departement;
  @override
  @JsonKey(name: 'demandeur_id')
  String get demandeurId;
  @override
  @JsonKey(name: 'date_demande')
  DateTime get dateDemande;
  @override
  @JsonKey(fromJson: parseFlexibleDoubleNullable)
  double? get montant;
  @override
  @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable)
  double? get budgetPrevu;
  @override
  @JsonKey(name: 'etape_courante_id')
  EtapeId get etapeCouranteId;
  @override
  Qualification? get qualification;
  @override
  @JsonKey(name: 'compte_comptable')
  String? get compteComptable;
  @override
  String? get fournisseur;
  @override
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef;
  @override
  @JsonKey(name: 'facture_ref')
  String? get factureRef;
  @override
  String? get alerte;
  @override
  @JsonKey(name: 'immobilisations_generees')
  String? get immobilisationsGenerees;
  @override
  @JsonKey(name: 'motif_sortie')
  MotifSortie? get motifSortie;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // Additives (chantier web organisation, même table partagée) — nullable.
  @override
  @JsonKey(name: 'etape_groupe_id')
  GroupeId? get etapeGroupeId;
  @override
  String? get statut;
  @override
  @JsonKey(name: 'rejet_motif')
  String? get rejetMotif;
  @override
  @JsonKey(name: 'fournisseur_id')
  String? get fournisseurId;

  /// Create a copy of DossierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DossierModelImplCopyWith<_$DossierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
