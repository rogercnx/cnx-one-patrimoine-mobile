// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dossier_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DossierInput _$DossierInputFromJson(Map<String, dynamic> json) {
  return _DossierInput.fromJson(json);
}

/// @nodoc
mixin _$DossierInput {
  @JsonKey(includeIfNull: false)
  GroupeId? get groupeId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get siteId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get objet => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get categorie => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  FamilleImmobilisation? get famille => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get departement => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get montant => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get budgetPrevu => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get compteComptable => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get fournisseur => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get bonCommandeRef => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get factureRef => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get alerte => throw _privateConstructorUsedError;

  /// Serializes this DossierInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DossierInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DossierInputCopyWith<DossierInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DossierInputCopyWith<$Res> {
  factory $DossierInputCopyWith(
    DossierInput value,
    $Res Function(DossierInput) then,
  ) = _$DossierInputCopyWithImpl<$Res, DossierInput>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) GroupeId? groupeId,
    @JsonKey(includeIfNull: false) String? siteId,
    @JsonKey(includeIfNull: false) String? objet,
    @JsonKey(includeIfNull: false) String? categorie,
    @JsonKey(includeIfNull: false) FamilleImmobilisation? famille,
    @JsonKey(includeIfNull: false) String? departement,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) double? budgetPrevu,
    @JsonKey(includeIfNull: false) String? compteComptable,
    @JsonKey(includeIfNull: false) String? fournisseur,
    @JsonKey(includeIfNull: false) String? bonCommandeRef,
    @JsonKey(includeIfNull: false) String? factureRef,
    @JsonKey(includeIfNull: false) String? alerte,
  });
}

/// @nodoc
class _$DossierInputCopyWithImpl<$Res, $Val extends DossierInput>
    implements $DossierInputCopyWith<$Res> {
  _$DossierInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DossierInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupeId = freezed,
    Object? siteId = freezed,
    Object? objet = freezed,
    Object? categorie = freezed,
    Object? famille = freezed,
    Object? departement = freezed,
    Object? montant = freezed,
    Object? budgetPrevu = freezed,
    Object? compteComptable = freezed,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? alerte = freezed,
  }) {
    return _then(
      _value.copyWith(
            groupeId: freezed == groupeId
                ? _value.groupeId
                : groupeId // ignore: cast_nullable_to_non_nullable
                      as GroupeId?,
            siteId: freezed == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            objet: freezed == objet
                ? _value.objet
                : objet // ignore: cast_nullable_to_non_nullable
                      as String?,
            categorie: freezed == categorie
                ? _value.categorie
                : categorie // ignore: cast_nullable_to_non_nullable
                      as String?,
            famille: freezed == famille
                ? _value.famille
                : famille // ignore: cast_nullable_to_non_nullable
                      as FamilleImmobilisation?,
            departement: freezed == departement
                ? _value.departement
                : departement // ignore: cast_nullable_to_non_nullable
                      as String?,
            montant: freezed == montant
                ? _value.montant
                : montant // ignore: cast_nullable_to_non_nullable
                      as double?,
            budgetPrevu: freezed == budgetPrevu
                ? _value.budgetPrevu
                : budgetPrevu // ignore: cast_nullable_to_non_nullable
                      as double?,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DossierInputImplCopyWith<$Res>
    implements $DossierInputCopyWith<$Res> {
  factory _$$DossierInputImplCopyWith(
    _$DossierInputImpl value,
    $Res Function(_$DossierInputImpl) then,
  ) = __$$DossierInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) GroupeId? groupeId,
    @JsonKey(includeIfNull: false) String? siteId,
    @JsonKey(includeIfNull: false) String? objet,
    @JsonKey(includeIfNull: false) String? categorie,
    @JsonKey(includeIfNull: false) FamilleImmobilisation? famille,
    @JsonKey(includeIfNull: false) String? departement,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) double? budgetPrevu,
    @JsonKey(includeIfNull: false) String? compteComptable,
    @JsonKey(includeIfNull: false) String? fournisseur,
    @JsonKey(includeIfNull: false) String? bonCommandeRef,
    @JsonKey(includeIfNull: false) String? factureRef,
    @JsonKey(includeIfNull: false) String? alerte,
  });
}

/// @nodoc
class __$$DossierInputImplCopyWithImpl<$Res>
    extends _$DossierInputCopyWithImpl<$Res, _$DossierInputImpl>
    implements _$$DossierInputImplCopyWith<$Res> {
  __$$DossierInputImplCopyWithImpl(
    _$DossierInputImpl _value,
    $Res Function(_$DossierInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DossierInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupeId = freezed,
    Object? siteId = freezed,
    Object? objet = freezed,
    Object? categorie = freezed,
    Object? famille = freezed,
    Object? departement = freezed,
    Object? montant = freezed,
    Object? budgetPrevu = freezed,
    Object? compteComptable = freezed,
    Object? fournisseur = freezed,
    Object? bonCommandeRef = freezed,
    Object? factureRef = freezed,
    Object? alerte = freezed,
  }) {
    return _then(
      _$DossierInputImpl(
        groupeId: freezed == groupeId
            ? _value.groupeId
            : groupeId // ignore: cast_nullable_to_non_nullable
                  as GroupeId?,
        siteId: freezed == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        objet: freezed == objet
            ? _value.objet
            : objet // ignore: cast_nullable_to_non_nullable
                  as String?,
        categorie: freezed == categorie
            ? _value.categorie
            : categorie // ignore: cast_nullable_to_non_nullable
                  as String?,
        famille: freezed == famille
            ? _value.famille
            : famille // ignore: cast_nullable_to_non_nullable
                  as FamilleImmobilisation?,
        departement: freezed == departement
            ? _value.departement
            : departement // ignore: cast_nullable_to_non_nullable
                  as String?,
        montant: freezed == montant
            ? _value.montant
            : montant // ignore: cast_nullable_to_non_nullable
                  as double?,
        budgetPrevu: freezed == budgetPrevu
            ? _value.budgetPrevu
            : budgetPrevu // ignore: cast_nullable_to_non_nullable
                  as double?,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DossierInputImpl implements _DossierInput {
  const _$DossierInputImpl({
    @JsonKey(includeIfNull: false) this.groupeId,
    @JsonKey(includeIfNull: false) this.siteId,
    @JsonKey(includeIfNull: false) this.objet,
    @JsonKey(includeIfNull: false) this.categorie,
    @JsonKey(includeIfNull: false) this.famille,
    @JsonKey(includeIfNull: false) this.departement,
    @JsonKey(includeIfNull: false) this.montant,
    @JsonKey(includeIfNull: false) this.budgetPrevu,
    @JsonKey(includeIfNull: false) this.compteComptable,
    @JsonKey(includeIfNull: false) this.fournisseur,
    @JsonKey(includeIfNull: false) this.bonCommandeRef,
    @JsonKey(includeIfNull: false) this.factureRef,
    @JsonKey(includeIfNull: false) this.alerte,
  });

  factory _$DossierInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$DossierInputImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final GroupeId? groupeId;
  @override
  @JsonKey(includeIfNull: false)
  final String? siteId;
  @override
  @JsonKey(includeIfNull: false)
  final String? objet;
  @override
  @JsonKey(includeIfNull: false)
  final String? categorie;
  @override
  @JsonKey(includeIfNull: false)
  final FamilleImmobilisation? famille;
  @override
  @JsonKey(includeIfNull: false)
  final String? departement;
  @override
  @JsonKey(includeIfNull: false)
  final double? montant;
  @override
  @JsonKey(includeIfNull: false)
  final double? budgetPrevu;
  @override
  @JsonKey(includeIfNull: false)
  final String? compteComptable;
  @override
  @JsonKey(includeIfNull: false)
  final String? fournisseur;
  @override
  @JsonKey(includeIfNull: false)
  final String? bonCommandeRef;
  @override
  @JsonKey(includeIfNull: false)
  final String? factureRef;
  @override
  @JsonKey(includeIfNull: false)
  final String? alerte;

  @override
  String toString() {
    return 'DossierInput(groupeId: $groupeId, siteId: $siteId, objet: $objet, categorie: $categorie, famille: $famille, departement: $departement, montant: $montant, budgetPrevu: $budgetPrevu, compteComptable: $compteComptable, fournisseur: $fournisseur, bonCommandeRef: $bonCommandeRef, factureRef: $factureRef, alerte: $alerte)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DossierInputImpl &&
            (identical(other.groupeId, groupeId) ||
                other.groupeId == groupeId) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.objet, objet) || other.objet == objet) &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.famille, famille) || other.famille == famille) &&
            (identical(other.departement, departement) ||
                other.departement == departement) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.budgetPrevu, budgetPrevu) ||
                other.budgetPrevu == budgetPrevu) &&
            (identical(other.compteComptable, compteComptable) ||
                other.compteComptable == compteComptable) &&
            (identical(other.fournisseur, fournisseur) ||
                other.fournisseur == fournisseur) &&
            (identical(other.bonCommandeRef, bonCommandeRef) ||
                other.bonCommandeRef == bonCommandeRef) &&
            (identical(other.factureRef, factureRef) ||
                other.factureRef == factureRef) &&
            (identical(other.alerte, alerte) || other.alerte == alerte));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    groupeId,
    siteId,
    objet,
    categorie,
    famille,
    departement,
    montant,
    budgetPrevu,
    compteComptable,
    fournisseur,
    bonCommandeRef,
    factureRef,
    alerte,
  );

  /// Create a copy of DossierInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DossierInputImplCopyWith<_$DossierInputImpl> get copyWith =>
      __$$DossierInputImplCopyWithImpl<_$DossierInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DossierInputImplToJson(this);
  }
}

abstract class _DossierInput implements DossierInput {
  const factory _DossierInput({
    @JsonKey(includeIfNull: false) final GroupeId? groupeId,
    @JsonKey(includeIfNull: false) final String? siteId,
    @JsonKey(includeIfNull: false) final String? objet,
    @JsonKey(includeIfNull: false) final String? categorie,
    @JsonKey(includeIfNull: false) final FamilleImmobilisation? famille,
    @JsonKey(includeIfNull: false) final String? departement,
    @JsonKey(includeIfNull: false) final double? montant,
    @JsonKey(includeIfNull: false) final double? budgetPrevu,
    @JsonKey(includeIfNull: false) final String? compteComptable,
    @JsonKey(includeIfNull: false) final String? fournisseur,
    @JsonKey(includeIfNull: false) final String? bonCommandeRef,
    @JsonKey(includeIfNull: false) final String? factureRef,
    @JsonKey(includeIfNull: false) final String? alerte,
  }) = _$DossierInputImpl;

  factory _DossierInput.fromJson(Map<String, dynamic> json) =
      _$DossierInputImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  GroupeId? get groupeId;
  @override
  @JsonKey(includeIfNull: false)
  String? get siteId;
  @override
  @JsonKey(includeIfNull: false)
  String? get objet;
  @override
  @JsonKey(includeIfNull: false)
  String? get categorie;
  @override
  @JsonKey(includeIfNull: false)
  FamilleImmobilisation? get famille;
  @override
  @JsonKey(includeIfNull: false)
  String? get departement;
  @override
  @JsonKey(includeIfNull: false)
  double? get montant;
  @override
  @JsonKey(includeIfNull: false)
  double? get budgetPrevu;
  @override
  @JsonKey(includeIfNull: false)
  String? get compteComptable;
  @override
  @JsonKey(includeIfNull: false)
  String? get fournisseur;
  @override
  @JsonKey(includeIfNull: false)
  String? get bonCommandeRef;
  @override
  @JsonKey(includeIfNull: false)
  String? get factureRef;
  @override
  @JsonKey(includeIfNull: false)
  String? get alerte;

  /// Create a copy of DossierInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DossierInputImplCopyWith<_$DossierInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
