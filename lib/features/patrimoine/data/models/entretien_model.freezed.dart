// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entretien_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EntretienModel _$EntretienModelFromJson(Map<String, dynamic> json) {
  return _EntretienModel.fromJson(json);
}

/// @nodoc
mixin _$EntretienModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'immobilisation_id')
  String? get immobilisationId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get titre => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseFlexibleDouble)
  double get cout => throw _privateConstructorUsedError;
  String get prestataire => throw _privateConstructorUsedError;
  String? get observation => throw _privateConstructorUsedError;
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'bon_livraison_ref')
  String? get bonLivraisonRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'facture_ref')
  String? get factureRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'dossier_ref')
  String? get dossierRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'duree_intervention')
  String? get dureeIntervention => throw _privateConstructorUsedError;
  String? get technicien => throw _privateConstructorUsedError;

  /// Serializes this EntretienModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntretienModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntretienModelCopyWith<EntretienModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntretienModelCopyWith<$Res> {
  factory $EntretienModelCopyWith(
    EntretienModel value,
    $Res Function(EntretienModel) then,
  ) = _$EntretienModelCopyWithImpl<$Res, EntretienModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    DateTime date,
    String titre,
    @JsonKey(fromJson: parseFlexibleDouble) double cout,
    String prestataire,
    String? observation,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'bon_livraison_ref') String? bonLivraisonRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'dossier_ref') String? dossierRef,
    @JsonKey(name: 'duree_intervention') String? dureeIntervention,
    String? technicien,
  });
}

/// @nodoc
class _$EntretienModelCopyWithImpl<$Res, $Val extends EntretienModel>
    implements $EntretienModelCopyWith<$Res> {
  _$EntretienModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntretienModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? immobilisationId = freezed,
    Object? date = null,
    Object? titre = null,
    Object? cout = null,
    Object? prestataire = null,
    Object? observation = freezed,
    Object? bonCommandeRef = freezed,
    Object? bonLivraisonRef = freezed,
    Object? factureRef = freezed,
    Object? dossierRef = freezed,
    Object? dureeIntervention = freezed,
    Object? technicien = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            immobilisationId: freezed == immobilisationId
                ? _value.immobilisationId
                : immobilisationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            titre: null == titre
                ? _value.titre
                : titre // ignore: cast_nullable_to_non_nullable
                      as String,
            cout: null == cout
                ? _value.cout
                : cout // ignore: cast_nullable_to_non_nullable
                      as double,
            prestataire: null == prestataire
                ? _value.prestataire
                : prestataire // ignore: cast_nullable_to_non_nullable
                      as String,
            observation: freezed == observation
                ? _value.observation
                : observation // ignore: cast_nullable_to_non_nullable
                      as String?,
            bonCommandeRef: freezed == bonCommandeRef
                ? _value.bonCommandeRef
                : bonCommandeRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            bonLivraisonRef: freezed == bonLivraisonRef
                ? _value.bonLivraisonRef
                : bonLivraisonRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            factureRef: freezed == factureRef
                ? _value.factureRef
                : factureRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            dossierRef: freezed == dossierRef
                ? _value.dossierRef
                : dossierRef // ignore: cast_nullable_to_non_nullable
                      as String?,
            dureeIntervention: freezed == dureeIntervention
                ? _value.dureeIntervention
                : dureeIntervention // ignore: cast_nullable_to_non_nullable
                      as String?,
            technicien: freezed == technicien
                ? _value.technicien
                : technicien // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EntretienModelImplCopyWith<$Res>
    implements $EntretienModelCopyWith<$Res> {
  factory _$$EntretienModelImplCopyWith(
    _$EntretienModelImpl value,
    $Res Function(_$EntretienModelImpl) then,
  ) = __$$EntretienModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    DateTime date,
    String titre,
    @JsonKey(fromJson: parseFlexibleDouble) double cout,
    String prestataire,
    String? observation,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'bon_livraison_ref') String? bonLivraisonRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'dossier_ref') String? dossierRef,
    @JsonKey(name: 'duree_intervention') String? dureeIntervention,
    String? technicien,
  });
}

/// @nodoc
class __$$EntretienModelImplCopyWithImpl<$Res>
    extends _$EntretienModelCopyWithImpl<$Res, _$EntretienModelImpl>
    implements _$$EntretienModelImplCopyWith<$Res> {
  __$$EntretienModelImplCopyWithImpl(
    _$EntretienModelImpl _value,
    $Res Function(_$EntretienModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntretienModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? immobilisationId = freezed,
    Object? date = null,
    Object? titre = null,
    Object? cout = null,
    Object? prestataire = null,
    Object? observation = freezed,
    Object? bonCommandeRef = freezed,
    Object? bonLivraisonRef = freezed,
    Object? factureRef = freezed,
    Object? dossierRef = freezed,
    Object? dureeIntervention = freezed,
    Object? technicien = freezed,
  }) {
    return _then(
      _$EntretienModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        immobilisationId: freezed == immobilisationId
            ? _value.immobilisationId
            : immobilisationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        titre: null == titre
            ? _value.titre
            : titre // ignore: cast_nullable_to_non_nullable
                  as String,
        cout: null == cout
            ? _value.cout
            : cout // ignore: cast_nullable_to_non_nullable
                  as double,
        prestataire: null == prestataire
            ? _value.prestataire
            : prestataire // ignore: cast_nullable_to_non_nullable
                  as String,
        observation: freezed == observation
            ? _value.observation
            : observation // ignore: cast_nullable_to_non_nullable
                  as String?,
        bonCommandeRef: freezed == bonCommandeRef
            ? _value.bonCommandeRef
            : bonCommandeRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        bonLivraisonRef: freezed == bonLivraisonRef
            ? _value.bonLivraisonRef
            : bonLivraisonRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        factureRef: freezed == factureRef
            ? _value.factureRef
            : factureRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        dossierRef: freezed == dossierRef
            ? _value.dossierRef
            : dossierRef // ignore: cast_nullable_to_non_nullable
                  as String?,
        dureeIntervention: freezed == dureeIntervention
            ? _value.dureeIntervention
            : dureeIntervention // ignore: cast_nullable_to_non_nullable
                  as String?,
        technicien: freezed == technicien
            ? _value.technicien
            : technicien // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EntretienModelImpl implements _EntretienModel {
  const _$EntretienModelImpl({
    required this.id,
    @JsonKey(name: 'immobilisation_id') this.immobilisationId,
    required this.date,
    required this.titre,
    @JsonKey(fromJson: parseFlexibleDouble) required this.cout,
    required this.prestataire,
    this.observation,
    @JsonKey(name: 'bon_commande_ref') this.bonCommandeRef,
    @JsonKey(name: 'bon_livraison_ref') this.bonLivraisonRef,
    @JsonKey(name: 'facture_ref') this.factureRef,
    @JsonKey(name: 'dossier_ref') this.dossierRef,
    @JsonKey(name: 'duree_intervention') this.dureeIntervention,
    this.technicien,
  });

  factory _$EntretienModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntretienModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'immobilisation_id')
  final String? immobilisationId;
  @override
  final DateTime date;
  @override
  final String titre;
  @override
  @JsonKey(fromJson: parseFlexibleDouble)
  final double cout;
  @override
  final String prestataire;
  @override
  final String? observation;
  @override
  @JsonKey(name: 'bon_commande_ref')
  final String? bonCommandeRef;
  @override
  @JsonKey(name: 'bon_livraison_ref')
  final String? bonLivraisonRef;
  @override
  @JsonKey(name: 'facture_ref')
  final String? factureRef;
  @override
  @JsonKey(name: 'dossier_ref')
  final String? dossierRef;
  @override
  @JsonKey(name: 'duree_intervention')
  final String? dureeIntervention;
  @override
  final String? technicien;

  @override
  String toString() {
    return 'EntretienModel(id: $id, immobilisationId: $immobilisationId, date: $date, titre: $titre, cout: $cout, prestataire: $prestataire, observation: $observation, bonCommandeRef: $bonCommandeRef, bonLivraisonRef: $bonLivraisonRef, factureRef: $factureRef, dossierRef: $dossierRef, dureeIntervention: $dureeIntervention, technicien: $technicien)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntretienModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.immobilisationId, immobilisationId) ||
                other.immobilisationId == immobilisationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.cout, cout) || other.cout == cout) &&
            (identical(other.prestataire, prestataire) ||
                other.prestataire == prestataire) &&
            (identical(other.observation, observation) ||
                other.observation == observation) &&
            (identical(other.bonCommandeRef, bonCommandeRef) ||
                other.bonCommandeRef == bonCommandeRef) &&
            (identical(other.bonLivraisonRef, bonLivraisonRef) ||
                other.bonLivraisonRef == bonLivraisonRef) &&
            (identical(other.factureRef, factureRef) ||
                other.factureRef == factureRef) &&
            (identical(other.dossierRef, dossierRef) ||
                other.dossierRef == dossierRef) &&
            (identical(other.dureeIntervention, dureeIntervention) ||
                other.dureeIntervention == dureeIntervention) &&
            (identical(other.technicien, technicien) ||
                other.technicien == technicien));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    immobilisationId,
    date,
    titre,
    cout,
    prestataire,
    observation,
    bonCommandeRef,
    bonLivraisonRef,
    factureRef,
    dossierRef,
    dureeIntervention,
    technicien,
  );

  /// Create a copy of EntretienModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntretienModelImplCopyWith<_$EntretienModelImpl> get copyWith =>
      __$$EntretienModelImplCopyWithImpl<_$EntretienModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EntretienModelImplToJson(this);
  }
}

abstract class _EntretienModel implements EntretienModel {
  const factory _EntretienModel({
    required final String id,
    @JsonKey(name: 'immobilisation_id') final String? immobilisationId,
    required final DateTime date,
    required final String titre,
    @JsonKey(fromJson: parseFlexibleDouble) required final double cout,
    required final String prestataire,
    final String? observation,
    @JsonKey(name: 'bon_commande_ref') final String? bonCommandeRef,
    @JsonKey(name: 'bon_livraison_ref') final String? bonLivraisonRef,
    @JsonKey(name: 'facture_ref') final String? factureRef,
    @JsonKey(name: 'dossier_ref') final String? dossierRef,
    @JsonKey(name: 'duree_intervention') final String? dureeIntervention,
    final String? technicien,
  }) = _$EntretienModelImpl;

  factory _EntretienModel.fromJson(Map<String, dynamic> json) =
      _$EntretienModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'immobilisation_id')
  String? get immobilisationId;
  @override
  DateTime get date;
  @override
  String get titre;
  @override
  @JsonKey(fromJson: parseFlexibleDouble)
  double get cout;
  @override
  String get prestataire;
  @override
  String? get observation;
  @override
  @JsonKey(name: 'bon_commande_ref')
  String? get bonCommandeRef;
  @override
  @JsonKey(name: 'bon_livraison_ref')
  String? get bonLivraisonRef;
  @override
  @JsonKey(name: 'facture_ref')
  String? get factureRef;
  @override
  @JsonKey(name: 'dossier_ref')
  String? get dossierRef;
  @override
  @JsonKey(name: 'duree_intervention')
  String? get dureeIntervention;
  @override
  String? get technicien;

  /// Create a copy of EntretienModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntretienModelImplCopyWith<_$EntretienModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
