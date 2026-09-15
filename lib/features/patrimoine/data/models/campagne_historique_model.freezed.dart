// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campagne_historique_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContributionAgentModel _$ContributionAgentModelFromJson(
  Map<String, dynamic> json,
) {
  return _ContributionAgentModel.fromJson(json);
}

/// @nodoc
mixin _$ContributionAgentModel {
  String get nom => throw _privateConstructorUsedError;
  int get biensComptes => throw _privateConstructorUsedError;
  int get ecarts => throw _privateConstructorUsedError;

  /// Serializes this ContributionAgentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContributionAgentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContributionAgentModelCopyWith<ContributionAgentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionAgentModelCopyWith<$Res> {
  factory $ContributionAgentModelCopyWith(
    ContributionAgentModel value,
    $Res Function(ContributionAgentModel) then,
  ) = _$ContributionAgentModelCopyWithImpl<$Res, ContributionAgentModel>;
  @useResult
  $Res call({String nom, int biensComptes, int ecarts});
}

/// @nodoc
class _$ContributionAgentModelCopyWithImpl<
  $Res,
  $Val extends ContributionAgentModel
>
    implements $ContributionAgentModelCopyWith<$Res> {
  _$ContributionAgentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContributionAgentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? biensComptes = null,
    Object? ecarts = null,
  }) {
    return _then(
      _value.copyWith(
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            biensComptes: null == biensComptes
                ? _value.biensComptes
                : biensComptes // ignore: cast_nullable_to_non_nullable
                      as int,
            ecarts: null == ecarts
                ? _value.ecarts
                : ecarts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContributionAgentModelImplCopyWith<$Res>
    implements $ContributionAgentModelCopyWith<$Res> {
  factory _$$ContributionAgentModelImplCopyWith(
    _$ContributionAgentModelImpl value,
    $Res Function(_$ContributionAgentModelImpl) then,
  ) = __$$ContributionAgentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nom, int biensComptes, int ecarts});
}

/// @nodoc
class __$$ContributionAgentModelImplCopyWithImpl<$Res>
    extends
        _$ContributionAgentModelCopyWithImpl<$Res, _$ContributionAgentModelImpl>
    implements _$$ContributionAgentModelImplCopyWith<$Res> {
  __$$ContributionAgentModelImplCopyWithImpl(
    _$ContributionAgentModelImpl _value,
    $Res Function(_$ContributionAgentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContributionAgentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? biensComptes = null,
    Object? ecarts = null,
  }) {
    return _then(
      _$ContributionAgentModelImpl(
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        biensComptes: null == biensComptes
            ? _value.biensComptes
            : biensComptes // ignore: cast_nullable_to_non_nullable
                  as int,
        ecarts: null == ecarts
            ? _value.ecarts
            : ecarts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionAgentModelImpl implements _ContributionAgentModel {
  const _$ContributionAgentModelImpl({
    required this.nom,
    required this.biensComptes,
    required this.ecarts,
  });

  factory _$ContributionAgentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionAgentModelImplFromJson(json);

  @override
  final String nom;
  @override
  final int biensComptes;
  @override
  final int ecarts;

  @override
  String toString() {
    return 'ContributionAgentModel(nom: $nom, biensComptes: $biensComptes, ecarts: $ecarts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionAgentModelImpl &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.biensComptes, biensComptes) ||
                other.biensComptes == biensComptes) &&
            (identical(other.ecarts, ecarts) || other.ecarts == ecarts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nom, biensComptes, ecarts);

  /// Create a copy of ContributionAgentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionAgentModelImplCopyWith<_$ContributionAgentModelImpl>
  get copyWith =>
      __$$ContributionAgentModelImplCopyWithImpl<_$ContributionAgentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionAgentModelImplToJson(this);
  }
}

abstract class _ContributionAgentModel implements ContributionAgentModel {
  const factory _ContributionAgentModel({
    required final String nom,
    required final int biensComptes,
    required final int ecarts,
  }) = _$ContributionAgentModelImpl;

  factory _ContributionAgentModel.fromJson(Map<String, dynamic> json) =
      _$ContributionAgentModelImpl.fromJson;

  @override
  String get nom;
  @override
  int get biensComptes;
  @override
  int get ecarts;

  /// Create a copy of ContributionAgentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContributionAgentModelImplCopyWith<_$ContributionAgentModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CampagneHistoriqueModel _$CampagneHistoriqueModelFromJson(
  Map<String, dynamic> json,
) {
  return _CampagneHistoriqueModel.fromJson(json);
}

/// @nodoc
mixin _$CampagneHistoriqueModel {
  String get reference => throw _privateConstructorUsedError;
  String get libelle => throw _privateConstructorUsedError;
  String get periodeLabel => throw _privateConstructorUsedError;
  int get totalBiens => throw _privateConstructorUsedError;
  int get biensComptes => throw _privateConstructorUsedError;
  int get ecarts => throw _privateConstructorUsedError;
  int get introuvables => throw _privateConstructorUsedError;
  List<ContributionAgentModel> get contributions =>
      throw _privateConstructorUsedError;
  List<ComptageModel> get mouvements => throw _privateConstructorUsedError;

  /// Serializes this CampagneHistoriqueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CampagneHistoriqueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampagneHistoriqueModelCopyWith<CampagneHistoriqueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampagneHistoriqueModelCopyWith<$Res> {
  factory $CampagneHistoriqueModelCopyWith(
    CampagneHistoriqueModel value,
    $Res Function(CampagneHistoriqueModel) then,
  ) = _$CampagneHistoriqueModelCopyWithImpl<$Res, CampagneHistoriqueModel>;
  @useResult
  $Res call({
    String reference,
    String libelle,
    String periodeLabel,
    int totalBiens,
    int biensComptes,
    int ecarts,
    int introuvables,
    List<ContributionAgentModel> contributions,
    List<ComptageModel> mouvements,
  });
}

/// @nodoc
class _$CampagneHistoriqueModelCopyWithImpl<
  $Res,
  $Val extends CampagneHistoriqueModel
>
    implements $CampagneHistoriqueModelCopyWith<$Res> {
  _$CampagneHistoriqueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CampagneHistoriqueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? libelle = null,
    Object? periodeLabel = null,
    Object? totalBiens = null,
    Object? biensComptes = null,
    Object? ecarts = null,
    Object? introuvables = null,
    Object? contributions = null,
    Object? mouvements = null,
  }) {
    return _then(
      _value.copyWith(
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            libelle: null == libelle
                ? _value.libelle
                : libelle // ignore: cast_nullable_to_non_nullable
                      as String,
            periodeLabel: null == periodeLabel
                ? _value.periodeLabel
                : periodeLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            totalBiens: null == totalBiens
                ? _value.totalBiens
                : totalBiens // ignore: cast_nullable_to_non_nullable
                      as int,
            biensComptes: null == biensComptes
                ? _value.biensComptes
                : biensComptes // ignore: cast_nullable_to_non_nullable
                      as int,
            ecarts: null == ecarts
                ? _value.ecarts
                : ecarts // ignore: cast_nullable_to_non_nullable
                      as int,
            introuvables: null == introuvables
                ? _value.introuvables
                : introuvables // ignore: cast_nullable_to_non_nullable
                      as int,
            contributions: null == contributions
                ? _value.contributions
                : contributions // ignore: cast_nullable_to_non_nullable
                      as List<ContributionAgentModel>,
            mouvements: null == mouvements
                ? _value.mouvements
                : mouvements // ignore: cast_nullable_to_non_nullable
                      as List<ComptageModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CampagneHistoriqueModelImplCopyWith<$Res>
    implements $CampagneHistoriqueModelCopyWith<$Res> {
  factory _$$CampagneHistoriqueModelImplCopyWith(
    _$CampagneHistoriqueModelImpl value,
    $Res Function(_$CampagneHistoriqueModelImpl) then,
  ) = __$$CampagneHistoriqueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reference,
    String libelle,
    String periodeLabel,
    int totalBiens,
    int biensComptes,
    int ecarts,
    int introuvables,
    List<ContributionAgentModel> contributions,
    List<ComptageModel> mouvements,
  });
}

/// @nodoc
class __$$CampagneHistoriqueModelImplCopyWithImpl<$Res>
    extends
        _$CampagneHistoriqueModelCopyWithImpl<
          $Res,
          _$CampagneHistoriqueModelImpl
        >
    implements _$$CampagneHistoriqueModelImplCopyWith<$Res> {
  __$$CampagneHistoriqueModelImplCopyWithImpl(
    _$CampagneHistoriqueModelImpl _value,
    $Res Function(_$CampagneHistoriqueModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CampagneHistoriqueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? libelle = null,
    Object? periodeLabel = null,
    Object? totalBiens = null,
    Object? biensComptes = null,
    Object? ecarts = null,
    Object? introuvables = null,
    Object? contributions = null,
    Object? mouvements = null,
  }) {
    return _then(
      _$CampagneHistoriqueModelImpl(
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        libelle: null == libelle
            ? _value.libelle
            : libelle // ignore: cast_nullable_to_non_nullable
                  as String,
        periodeLabel: null == periodeLabel
            ? _value.periodeLabel
            : periodeLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        totalBiens: null == totalBiens
            ? _value.totalBiens
            : totalBiens // ignore: cast_nullable_to_non_nullable
                  as int,
        biensComptes: null == biensComptes
            ? _value.biensComptes
            : biensComptes // ignore: cast_nullable_to_non_nullable
                  as int,
        ecarts: null == ecarts
            ? _value.ecarts
            : ecarts // ignore: cast_nullable_to_non_nullable
                  as int,
        introuvables: null == introuvables
            ? _value.introuvables
            : introuvables // ignore: cast_nullable_to_non_nullable
                  as int,
        contributions: null == contributions
            ? _value._contributions
            : contributions // ignore: cast_nullable_to_non_nullable
                  as List<ContributionAgentModel>,
        mouvements: null == mouvements
            ? _value._mouvements
            : mouvements // ignore: cast_nullable_to_non_nullable
                  as List<ComptageModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CampagneHistoriqueModelImpl implements _CampagneHistoriqueModel {
  const _$CampagneHistoriqueModelImpl({
    required this.reference,
    required this.libelle,
    required this.periodeLabel,
    required this.totalBiens,
    required this.biensComptes,
    required this.ecarts,
    required this.introuvables,
    final List<ContributionAgentModel> contributions = const [],
    final List<ComptageModel> mouvements = const [],
  }) : _contributions = contributions,
       _mouvements = mouvements;

  factory _$CampagneHistoriqueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampagneHistoriqueModelImplFromJson(json);

  @override
  final String reference;
  @override
  final String libelle;
  @override
  final String periodeLabel;
  @override
  final int totalBiens;
  @override
  final int biensComptes;
  @override
  final int ecarts;
  @override
  final int introuvables;
  final List<ContributionAgentModel> _contributions;
  @override
  @JsonKey()
  List<ContributionAgentModel> get contributions {
    if (_contributions is EqualUnmodifiableListView) return _contributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributions);
  }

  final List<ComptageModel> _mouvements;
  @override
  @JsonKey()
  List<ComptageModel> get mouvements {
    if (_mouvements is EqualUnmodifiableListView) return _mouvements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mouvements);
  }

  @override
  String toString() {
    return 'CampagneHistoriqueModel(reference: $reference, libelle: $libelle, periodeLabel: $periodeLabel, totalBiens: $totalBiens, biensComptes: $biensComptes, ecarts: $ecarts, introuvables: $introuvables, contributions: $contributions, mouvements: $mouvements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampagneHistoriqueModelImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.libelle, libelle) || other.libelle == libelle) &&
            (identical(other.periodeLabel, periodeLabel) ||
                other.periodeLabel == periodeLabel) &&
            (identical(other.totalBiens, totalBiens) ||
                other.totalBiens == totalBiens) &&
            (identical(other.biensComptes, biensComptes) ||
                other.biensComptes == biensComptes) &&
            (identical(other.ecarts, ecarts) || other.ecarts == ecarts) &&
            (identical(other.introuvables, introuvables) ||
                other.introuvables == introuvables) &&
            const DeepCollectionEquality().equals(
              other._contributions,
              _contributions,
            ) &&
            const DeepCollectionEquality().equals(
              other._mouvements,
              _mouvements,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reference,
    libelle,
    periodeLabel,
    totalBiens,
    biensComptes,
    ecarts,
    introuvables,
    const DeepCollectionEquality().hash(_contributions),
    const DeepCollectionEquality().hash(_mouvements),
  );

  /// Create a copy of CampagneHistoriqueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampagneHistoriqueModelImplCopyWith<_$CampagneHistoriqueModelImpl>
  get copyWith =>
      __$$CampagneHistoriqueModelImplCopyWithImpl<
        _$CampagneHistoriqueModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampagneHistoriqueModelImplToJson(this);
  }
}

abstract class _CampagneHistoriqueModel implements CampagneHistoriqueModel {
  const factory _CampagneHistoriqueModel({
    required final String reference,
    required final String libelle,
    required final String periodeLabel,
    required final int totalBiens,
    required final int biensComptes,
    required final int ecarts,
    required final int introuvables,
    final List<ContributionAgentModel> contributions,
    final List<ComptageModel> mouvements,
  }) = _$CampagneHistoriqueModelImpl;

  factory _CampagneHistoriqueModel.fromJson(Map<String, dynamic> json) =
      _$CampagneHistoriqueModelImpl.fromJson;

  @override
  String get reference;
  @override
  String get libelle;
  @override
  String get periodeLabel;
  @override
  int get totalBiens;
  @override
  int get biensComptes;
  @override
  int get ecarts;
  @override
  int get introuvables;
  @override
  List<ContributionAgentModel> get contributions;
  @override
  List<ComptageModel> get mouvements;

  /// Create a copy of CampagneHistoriqueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampagneHistoriqueModelImplCopyWith<_$CampagneHistoriqueModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
