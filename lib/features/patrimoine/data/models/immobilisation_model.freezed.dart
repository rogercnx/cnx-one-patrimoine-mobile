// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'immobilisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImmobilisationModel _$ImmobilisationModelFromJson(Map<String, dynamic> json) {
  return _ImmobilisationModel.fromJson(json);
}

/// @nodoc
mixin _$ImmobilisationModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get categorie => throw _privateConstructorUsedError;
  @JsonKey(name: 'compte_comptable')
  String? get compteComptable => throw _privateConstructorUsedError;
  FamilleImmobilisation get famille => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id')
  String? get siteId => throw _privateConstructorUsedError;
  String? get local => throw _privateConstructorUsedError;
  String? get affectataire => throw _privateConstructorUsedError;
  StatutBien get statut => throw _privateConstructorUsedError;
  EtatBien get etat => throw _privateConstructorUsedError;
  String? get fournisseur => throw _privateConstructorUsedError;
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'facture_ref')
  String? get factureRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_acquisition')
  DateTime get dateAcquisition => throw _privateConstructorUsedError;
  @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
  double? get valeurAcquisition => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_mise_service')
  DateTime? get dateMiseService => throw _privateConstructorUsedError;
  @JsonKey(name: 'duree_amortissement')
  int get dureeAmortissement => throw _privateConstructorUsedError;
  @JsonKey(name: 'methode_amortissement')
  MethodeAmortissement get methodeAmortissement =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
  double get montantAmorti => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_dernier_inventaire')
  DateTime? get dateDernierInventaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortie_ref')
  String? get sortieRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError; // Additives (chantier web organisation, même table partagée) — nullable.
  String? get departement => throw _privateConstructorUsedError;
  @JsonKey(name: 'dossier_id')
  String? get dossierId => throw _privateConstructorUsedError; // Composition app, absents de la vraie réponse — voir doc de classe.
  List<EntretienModel> get entretiens => throw _privateConstructorUsedError;
  List<AttributionModel> get attributions => throw _privateConstructorUsedError;
  List<PhotoModel> get photos => throw _privateConstructorUsedError;

  /// Serializes this ImmobilisationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImmobilisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImmobilisationModelCopyWith<ImmobilisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImmobilisationModelCopyWith<$Res> {
  factory $ImmobilisationModelCopyWith(
    ImmobilisationModel value,
    $Res Function(ImmobilisationModel) then,
  ) = _$ImmobilisationModelCopyWithImpl<$Res, ImmobilisationModel>;
  @useResult
  $Res call({
    String id,
    String code,
    String designation,
    String categorie,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    FamilleImmobilisation famille,
    @JsonKey(name: 'site_id') String? siteId,
    String? local,
    String? affectataire,
    StatutBien statut,
    EtatBien etat,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'date_acquisition') DateTime dateAcquisition,
    @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
    double? valeurAcquisition,
    @JsonKey(name: 'date_mise_service') DateTime? dateMiseService,
    @JsonKey(name: 'duree_amortissement') int dureeAmortissement,
    @JsonKey(name: 'methode_amortissement')
    MethodeAmortissement methodeAmortissement,
    @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
    double montantAmorti,
    @JsonKey(name: 'date_dernier_inventaire') DateTime? dateDernierInventaire,
    @JsonKey(name: 'sortie_ref') String? sortieRef,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? departement,
    @JsonKey(name: 'dossier_id') String? dossierId,
    List<EntretienModel> entretiens,
    List<AttributionModel> attributions,
    List<PhotoModel> photos,
  });
}

/// @nodoc
class _$ImmobilisationModelCopyWithImpl<$Res, $Val extends ImmobilisationModel>
    implements $ImmobilisationModelCopyWith<$Res> {
  _$ImmobilisationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImmobilisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? designation = null,
    Object? categorie = null,
    Object? compteComptable = freezed,
    Object? famille = null,
    Object? siteId = freezed,
    Object? local = freezed,
    Object? affectataire = freezed,
    Object? statut = null,
    Object? etat = null,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? dateAcquisition = null,
    Object? valeurAcquisition = freezed,
    Object? dateMiseService = freezed,
    Object? dureeAmortissement = null,
    Object? methodeAmortissement = null,
    Object? montantAmorti = null,
    Object? dateDernierInventaire = freezed,
    Object? sortieRef = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? departement = freezed,
    Object? dossierId = freezed,
    Object? entretiens = null,
    Object? attributions = null,
    Object? photos = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            designation: null == designation
                ? _value.designation
                : designation // ignore: cast_nullable_to_non_nullable
                      as String,
            categorie: null == categorie
                ? _value.categorie
                : categorie // ignore: cast_nullable_to_non_nullable
                      as String,
            compteComptable: freezed == compteComptable
                ? _value.compteComptable
                : compteComptable // ignore: cast_nullable_to_non_nullable
                      as String?,
            famille: null == famille
                ? _value.famille
                : famille // ignore: cast_nullable_to_non_nullable
                      as FamilleImmobilisation,
            siteId: freezed == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            local: freezed == local
                ? _value.local
                : local // ignore: cast_nullable_to_non_nullable
                      as String?,
            affectataire: freezed == affectataire
                ? _value.affectataire
                : affectataire // ignore: cast_nullable_to_non_nullable
                      as String?,
            statut: null == statut
                ? _value.statut
                : statut // ignore: cast_nullable_to_non_nullable
                      as StatutBien,
            etat: null == etat
                ? _value.etat
                : etat // ignore: cast_nullable_to_non_nullable
                      as EtatBien,
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
            dateAcquisition: null == dateAcquisition
                ? _value.dateAcquisition
                : dateAcquisition // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            valeurAcquisition: freezed == valeurAcquisition
                ? _value.valeurAcquisition
                : valeurAcquisition // ignore: cast_nullable_to_non_nullable
                      as double?,
            dateMiseService: freezed == dateMiseService
                ? _value.dateMiseService
                : dateMiseService // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            dureeAmortissement: null == dureeAmortissement
                ? _value.dureeAmortissement
                : dureeAmortissement // ignore: cast_nullable_to_non_nullable
                      as int,
            methodeAmortissement: null == methodeAmortissement
                ? _value.methodeAmortissement
                : methodeAmortissement // ignore: cast_nullable_to_non_nullable
                      as MethodeAmortissement,
            montantAmorti: null == montantAmorti
                ? _value.montantAmorti
                : montantAmorti // ignore: cast_nullable_to_non_nullable
                      as double,
            dateDernierInventaire: freezed == dateDernierInventaire
                ? _value.dateDernierInventaire
                : dateDernierInventaire // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sortieRef: freezed == sortieRef
                ? _value.sortieRef
                : sortieRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            departement: freezed == departement
                ? _value.departement
                : departement // ignore: cast_nullable_to_non_nullable
                      as String?,
            dossierId: freezed == dossierId
                ? _value.dossierId
                : dossierId // ignore: cast_nullable_to_non_nullable
                      as String?,
            entretiens: null == entretiens
                ? _value.entretiens
                : entretiens // ignore: cast_nullable_to_non_nullable
                      as List<EntretienModel>,
            attributions: null == attributions
                ? _value.attributions
                : attributions // ignore: cast_nullable_to_non_nullable
                      as List<AttributionModel>,
            photos: null == photos
                ? _value.photos
                : photos // ignore: cast_nullable_to_non_nullable
                      as List<PhotoModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImmobilisationModelImplCopyWith<$Res>
    implements $ImmobilisationModelCopyWith<$Res> {
  factory _$$ImmobilisationModelImplCopyWith(
    _$ImmobilisationModelImpl value,
    $Res Function(_$ImmobilisationModelImpl) then,
  ) = __$$ImmobilisationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String designation,
    String categorie,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    FamilleImmobilisation famille,
    @JsonKey(name: 'site_id') String? siteId,
    String? local,
    String? affectataire,
    StatutBien statut,
    EtatBien etat,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'date_acquisition') DateTime dateAcquisition,
    @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
    double? valeurAcquisition,
    @JsonKey(name: 'date_mise_service') DateTime? dateMiseService,
    @JsonKey(name: 'duree_amortissement') int dureeAmortissement,
    @JsonKey(name: 'methode_amortissement')
    MethodeAmortissement methodeAmortissement,
    @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
    double montantAmorti,
    @JsonKey(name: 'date_dernier_inventaire') DateTime? dateDernierInventaire,
    @JsonKey(name: 'sortie_ref') String? sortieRef,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? departement,
    @JsonKey(name: 'dossier_id') String? dossierId,
    List<EntretienModel> entretiens,
    List<AttributionModel> attributions,
    List<PhotoModel> photos,
  });
}

/// @nodoc
class __$$ImmobilisationModelImplCopyWithImpl<$Res>
    extends _$ImmobilisationModelCopyWithImpl<$Res, _$ImmobilisationModelImpl>
    implements _$$ImmobilisationModelImplCopyWith<$Res> {
  __$$ImmobilisationModelImplCopyWithImpl(
    _$ImmobilisationModelImpl _value,
    $Res Function(_$ImmobilisationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImmobilisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? designation = null,
    Object? categorie = null,
    Object? compteComptable = freezed,
    Object? famille = null,
    Object? siteId = freezed,
    Object? local = freezed,
    Object? affectataire = freezed,
    Object? statut = null,
    Object? etat = null,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? dateAcquisition = null,
    Object? valeurAcquisition = freezed,
    Object? dateMiseService = freezed,
    Object? dureeAmortissement = null,
    Object? methodeAmortissement = null,
    Object? montantAmorti = null,
    Object? dateDernierInventaire = freezed,
    Object? sortieRef = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? departement = freezed,
    Object? dossierId = freezed,
    Object? entretiens = null,
    Object? attributions = null,
    Object? photos = null,
  }) {
    return _then(
      _$ImmobilisationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        designation: null == designation
            ? _value.designation
            : designation // ignore: cast_nullable_to_non_nullable
                  as String,
        categorie: null == categorie
            ? _value.categorie
            : categorie // ignore: cast_nullable_to_non_nullable
                  as String,
        compteComptable: freezed == compteComptable
            ? _value.compteComptable
            : compteComptable // ignore: cast_nullable_to_non_nullable
                  as String?,
        famille: null == famille
            ? _value.famille
            : famille // ignore: cast_nullable_to_non_nullable
                  as FamilleImmobilisation,
        siteId: freezed == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        local: freezed == local
            ? _value.local
            : local // ignore: cast_nullable_to_non_nullable
                  as String?,
        affectataire: freezed == affectataire
            ? _value.affectataire
            : affectataire // ignore: cast_nullable_to_non_nullable
                  as String?,
        statut: null == statut
            ? _value.statut
            : statut // ignore: cast_nullable_to_non_nullable
                  as StatutBien,
        etat: null == etat
            ? _value.etat
            : etat // ignore: cast_nullable_to_non_nullable
                  as EtatBien,
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
        dateAcquisition: null == dateAcquisition
            ? _value.dateAcquisition
            : dateAcquisition // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        valeurAcquisition: freezed == valeurAcquisition
            ? _value.valeurAcquisition
            : valeurAcquisition // ignore: cast_nullable_to_non_nullable
                  as double?,
        dateMiseService: freezed == dateMiseService
            ? _value.dateMiseService
            : dateMiseService // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dureeAmortissement: null == dureeAmortissement
            ? _value.dureeAmortissement
            : dureeAmortissement // ignore: cast_nullable_to_non_nullable
                  as int,
        methodeAmortissement: null == methodeAmortissement
            ? _value.methodeAmortissement
            : methodeAmortissement // ignore: cast_nullable_to_non_nullable
                  as MethodeAmortissement,
        montantAmorti: null == montantAmorti
            ? _value.montantAmorti
            : montantAmorti // ignore: cast_nullable_to_non_nullable
                  as double,
        dateDernierInventaire: freezed == dateDernierInventaire
            ? _value.dateDernierInventaire
            : dateDernierInventaire // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sortieRef: freezed == sortieRef
            ? _value.sortieRef
            : sortieRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        departement: freezed == departement
            ? _value.departement
            : departement // ignore: cast_nullable_to_non_nullable
                  as String?,
        dossierId: freezed == dossierId
            ? _value.dossierId
            : dossierId // ignore: cast_nullable_to_non_nullable
                  as String?,
        entretiens: null == entretiens
            ? _value._entretiens
            : entretiens // ignore: cast_nullable_to_non_nullable
                  as List<EntretienModel>,
        attributions: null == attributions
            ? _value._attributions
            : attributions // ignore: cast_nullable_to_non_nullable
                  as List<AttributionModel>,
        photos: null == photos
            ? _value._photos
            : photos // ignore: cast_nullable_to_non_nullable
                  as List<PhotoModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImmobilisationModelImpl extends _ImmobilisationModel {
  const _$ImmobilisationModelImpl({
    required this.id,
    required this.code,
    required this.designation,
    required this.categorie,
    @JsonKey(name: 'compte_comptable') this.compteComptable,
    required this.famille,
    @JsonKey(name: 'site_id') this.siteId,
    this.local,
    this.affectataire,
    required this.statut,
    required this.etat,
    this.fournisseur,
    @JsonKey(name: 'bon_commande_ref') this.bonCommandeRef,
    @JsonKey(name: 'facture_ref') this.factureRef,
    @JsonKey(name: 'date_acquisition') required this.dateAcquisition,
    @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
    this.valeurAcquisition,
    @JsonKey(name: 'date_mise_service') this.dateMiseService,
    @JsonKey(name: 'duree_amortissement') required this.dureeAmortissement,
    @JsonKey(name: 'methode_amortissement') required this.methodeAmortissement,
    @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
    required this.montantAmorti,
    @JsonKey(name: 'date_dernier_inventaire') this.dateDernierInventaire,
    @JsonKey(name: 'sortie_ref') this.sortieRef,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.departement,
    @JsonKey(name: 'dossier_id') this.dossierId,
    final List<EntretienModel> entretiens = const [],
    final List<AttributionModel> attributions = const [],
    final List<PhotoModel> photos = const [],
  }) : _entretiens = entretiens,
       _attributions = attributions,
       _photos = photos,
       super._();

  factory _$ImmobilisationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImmobilisationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String designation;
  @override
  final String categorie;
  @override
  @JsonKey(name: 'compte_comptable')
  final String? compteComptable;
  @override
  final FamilleImmobilisation famille;
  @override
  @JsonKey(name: 'site_id')
  final String? siteId;
  @override
  final String? local;
  @override
  final String? affectataire;
  @override
  final StatutBien statut;
  @override
  final EtatBien etat;
  @override
  final String? fournisseur;
  @override
  @JsonKey(name: 'bon_commande_ref')
  final String? bonCommandeRef;
  @override
  @JsonKey(name: 'facture_ref')
  final String? factureRef;
  @override
  @JsonKey(name: 'date_acquisition')
  final DateTime dateAcquisition;
  @override
  @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
  final double? valeurAcquisition;
  @override
  @JsonKey(name: 'date_mise_service')
  final DateTime? dateMiseService;
  @override
  @JsonKey(name: 'duree_amortissement')
  final int dureeAmortissement;
  @override
  @JsonKey(name: 'methode_amortissement')
  final MethodeAmortissement methodeAmortissement;
  @override
  @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
  final double montantAmorti;
  @override
  @JsonKey(name: 'date_dernier_inventaire')
  final DateTime? dateDernierInventaire;
  @override
  @JsonKey(name: 'sortie_ref')
  final String? sortieRef;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  // Additives (chantier web organisation, même table partagée) — nullable.
  @override
  final String? departement;
  @override
  @JsonKey(name: 'dossier_id')
  final String? dossierId;
  // Composition app, absents de la vraie réponse — voir doc de classe.
  final List<EntretienModel> _entretiens;
  // Composition app, absents de la vraie réponse — voir doc de classe.
  @override
  @JsonKey()
  List<EntretienModel> get entretiens {
    if (_entretiens is EqualUnmodifiableListView) return _entretiens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entretiens);
  }

  final List<AttributionModel> _attributions;
  @override
  @JsonKey()
  List<AttributionModel> get attributions {
    if (_attributions is EqualUnmodifiableListView) return _attributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributions);
  }

  final List<PhotoModel> _photos;
  @override
  @JsonKey()
  List<PhotoModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'ImmobilisationModel(id: $id, code: $code, designation: $designation, categorie: $categorie, compteComptable: $compteComptable, famille: $famille, siteId: $siteId, local: $local, affectataire: $affectataire, statut: $statut, etat: $etat, fournisseur: $fournisseur, bonCommandeRef: $bonCommandeRef, factureRef: $factureRef, dateAcquisition: $dateAcquisition, valeurAcquisition: $valeurAcquisition, dateMiseService: $dateMiseService, dureeAmortissement: $dureeAmortissement, methodeAmortissement: $methodeAmortissement, montantAmorti: $montantAmorti, dateDernierInventaire: $dateDernierInventaire, sortieRef: $sortieRef, createdAt: $createdAt, updatedAt: $updatedAt, departement: $departement, dossierId: $dossierId, entretiens: $entretiens, attributions: $attributions, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmobilisationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.compteComptable, compteComptable) ||
                other.compteComptable == compteComptable) &&
            (identical(other.famille, famille) || other.famille == famille) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.affectataire, affectataire) ||
                other.affectataire == affectataire) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.etat, etat) || other.etat == etat) &&
            (identical(other.fournisseur, fournisseur) ||
                other.fournisseur == fournisseur) &&
            (identical(other.bonCommandeRef, bonCommandeRef) ||
                other.bonCommandeRef == bonCommandeRef) &&
            (identical(other.factureRef, factureRef) ||
                other.factureRef == factureRef) &&
            (identical(other.dateAcquisition, dateAcquisition) ||
                other.dateAcquisition == dateAcquisition) &&
            (identical(other.valeurAcquisition, valeurAcquisition) ||
                other.valeurAcquisition == valeurAcquisition) &&
            (identical(other.dateMiseService, dateMiseService) ||
                other.dateMiseService == dateMiseService) &&
            (identical(other.dureeAmortissement, dureeAmortissement) ||
                other.dureeAmortissement == dureeAmortissement) &&
            (identical(other.methodeAmortissement, methodeAmortissement) ||
                other.methodeAmortissement == methodeAmortissement) &&
            (identical(other.montantAmorti, montantAmorti) ||
                other.montantAmorti == montantAmorti) &&
            (identical(other.dateDernierInventaire, dateDernierInventaire) ||
                other.dateDernierInventaire == dateDernierInventaire) &&
            (identical(other.sortieRef, sortieRef) ||
                other.sortieRef == sortieRef) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.departement, departement) ||
                other.departement == departement) &&
            (identical(other.dossierId, dossierId) ||
                other.dossierId == dossierId) &&
            const DeepCollectionEquality().equals(
              other._entretiens,
              _entretiens,
            ) &&
            const DeepCollectionEquality().equals(
              other._attributions,
              _attributions,
            ) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    code,
    designation,
    categorie,
    compteComptable,
    famille,
    siteId,
    local,
    affectataire,
    statut,
    etat,
    fournisseur,
    bonCommandeRef,
    factureRef,
    dateAcquisition,
    valeurAcquisition,
    dateMiseService,
    dureeAmortissement,
    methodeAmortissement,
    montantAmorti,
    dateDernierInventaire,
    sortieRef,
    createdAt,
    updatedAt,
    departement,
    dossierId,
    const DeepCollectionEquality().hash(_entretiens),
    const DeepCollectionEquality().hash(_attributions),
    const DeepCollectionEquality().hash(_photos),
  ]);

  /// Create a copy of ImmobilisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmobilisationModelImplCopyWith<_$ImmobilisationModelImpl> get copyWith =>
      __$$ImmobilisationModelImplCopyWithImpl<_$ImmobilisationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImmobilisationModelImplToJson(this);
  }
}

abstract class _ImmobilisationModel extends ImmobilisationModel {
  const factory _ImmobilisationModel({
    required final String id,
    required final String code,
    required final String designation,
    required final String categorie,
    @JsonKey(name: 'compte_comptable') final String? compteComptable,
    required final FamilleImmobilisation famille,
    @JsonKey(name: 'site_id') final String? siteId,
    final String? local,
    final String? affectataire,
    required final StatutBien statut,
    required final EtatBien etat,
    final String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') final String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') final String? factureRef,
    @JsonKey(name: 'date_acquisition') required final DateTime dateAcquisition,
    @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
    final double? valeurAcquisition,
    @JsonKey(name: 'date_mise_service') final DateTime? dateMiseService,
    @JsonKey(name: 'duree_amortissement') required final int dureeAmortissement,
    @JsonKey(name: 'methode_amortissement')
    required final MethodeAmortissement methodeAmortissement,
    @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
    required final double montantAmorti,
    @JsonKey(name: 'date_dernier_inventaire')
    final DateTime? dateDernierInventaire,
    @JsonKey(name: 'sortie_ref') final String? sortieRef,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final String? departement,
    @JsonKey(name: 'dossier_id') final String? dossierId,
    final List<EntretienModel> entretiens,
    final List<AttributionModel> attributions,
    final List<PhotoModel> photos,
  }) = _$ImmobilisationModelImpl;
  const _ImmobilisationModel._() : super._();

  factory _ImmobilisationModel.fromJson(Map<String, dynamic> json) =
      _$ImmobilisationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get designation;
  @override
  String get categorie;
  @override
  @JsonKey(name: 'compte_comptable')
  String? get compteComptable;
  @override
  FamilleImmobilisation get famille;
  @override
  @JsonKey(name: 'site_id')
  String? get siteId;
  @override
  String? get local;
  @override
  String? get affectataire;
  @override
  StatutBien get statut;
  @override
  EtatBien get etat;
  @override
  String? get fournisseur;
  @override
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef;
  @override
  @JsonKey(name: 'facture_ref')
  String? get factureRef;
  @override
  @JsonKey(name: 'date_acquisition')
  DateTime get dateAcquisition;
  @override
  @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable)
  double? get valeurAcquisition;
  @override
  @JsonKey(name: 'date_mise_service')
  DateTime? get dateMiseService;
  @override
  @JsonKey(name: 'duree_amortissement')
  int get dureeAmortissement;
  @override
  @JsonKey(name: 'methode_amortissement')
  MethodeAmortissement get methodeAmortissement;
  @override
  @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble)
  double get montantAmorti;
  @override
  @JsonKey(name: 'date_dernier_inventaire')
  DateTime? get dateDernierInventaire;
  @override
  @JsonKey(name: 'sortie_ref')
  String? get sortieRef;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // Additives (chantier web organisation, même table partagée) — nullable.
  @override
  String? get departement;
  @override
  @JsonKey(name: 'dossier_id')
  String? get dossierId; // Composition app, absents de la vraie réponse — voir doc de classe.
  @override
  List<EntretienModel> get entretiens;
  @override
  List<AttributionModel> get attributions;
  @override
  List<PhotoModel> get photos;

  /// Create a copy of ImmobilisationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImmobilisationModelImplCopyWith<_$ImmobilisationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
