// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_etape_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkflowEtapeModel _$WorkflowEtapeModelFromJson(Map<String, dynamic> json) {
  return _WorkflowEtapeModel.fromJson(json);
}

/// @nodoc
mixin _$WorkflowEtapeModel {
  EtapeId get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupe_id')
  GroupeId get groupeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'label_court')
  String? get labelCourt => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get icone => throw _privateConstructorUsedError;
  int? get ordre => throw _privateConstructorUsedError;

  /// Serializes this WorkflowEtapeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowEtapeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowEtapeModelCopyWith<WorkflowEtapeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowEtapeModelCopyWith<$Res> {
  factory $WorkflowEtapeModelCopyWith(
    WorkflowEtapeModel value,
    $Res Function(WorkflowEtapeModel) then,
  ) = _$WorkflowEtapeModelCopyWithImpl<$Res, WorkflowEtapeModel>;
  @useResult
  $Res call({
    EtapeId id,
    @JsonKey(name: 'groupe_id') GroupeId groupeId,
    @JsonKey(name: 'label_court') String? labelCourt,
    String label,
    String? icone,
    int? ordre,
  });
}

/// @nodoc
class _$WorkflowEtapeModelCopyWithImpl<$Res, $Val extends WorkflowEtapeModel>
    implements $WorkflowEtapeModelCopyWith<$Res> {
  _$WorkflowEtapeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowEtapeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupeId = null,
    Object? labelCourt = freezed,
    Object? label = null,
    Object? icone = freezed,
    Object? ordre = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as EtapeId,
            groupeId: null == groupeId
                ? _value.groupeId
                : groupeId // ignore: cast_nullable_to_non_nullable
                      as GroupeId,
            labelCourt: freezed == labelCourt
                ? _value.labelCourt
                : labelCourt // ignore: cast_nullable_to_non_nullable
                      as String?,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            icone: freezed == icone
                ? _value.icone
                : icone // ignore: cast_nullable_to_non_nullable
                      as String?,
            ordre: freezed == ordre
                ? _value.ordre
                : ordre // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkflowEtapeModelImplCopyWith<$Res>
    implements $WorkflowEtapeModelCopyWith<$Res> {
  factory _$$WorkflowEtapeModelImplCopyWith(
    _$WorkflowEtapeModelImpl value,
    $Res Function(_$WorkflowEtapeModelImpl) then,
  ) = __$$WorkflowEtapeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EtapeId id,
    @JsonKey(name: 'groupe_id') GroupeId groupeId,
    @JsonKey(name: 'label_court') String? labelCourt,
    String label,
    String? icone,
    int? ordre,
  });
}

/// @nodoc
class __$$WorkflowEtapeModelImplCopyWithImpl<$Res>
    extends _$WorkflowEtapeModelCopyWithImpl<$Res, _$WorkflowEtapeModelImpl>
    implements _$$WorkflowEtapeModelImplCopyWith<$Res> {
  __$$WorkflowEtapeModelImplCopyWithImpl(
    _$WorkflowEtapeModelImpl _value,
    $Res Function(_$WorkflowEtapeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowEtapeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupeId = null,
    Object? labelCourt = freezed,
    Object? label = null,
    Object? icone = freezed,
    Object? ordre = freezed,
  }) {
    return _then(
      _$WorkflowEtapeModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as EtapeId,
        groupeId: null == groupeId
            ? _value.groupeId
            : groupeId // ignore: cast_nullable_to_non_nullable
                  as GroupeId,
        labelCourt: freezed == labelCourt
            ? _value.labelCourt
            : labelCourt // ignore: cast_nullable_to_non_nullable
                  as String?,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        icone: freezed == icone
            ? _value.icone
            : icone // ignore: cast_nullable_to_non_nullable
                  as String?,
        ordre: freezed == ordre
            ? _value.ordre
            : ordre // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowEtapeModelImpl implements _WorkflowEtapeModel {
  const _$WorkflowEtapeModelImpl({
    required this.id,
    @JsonKey(name: 'groupe_id') required this.groupeId,
    @JsonKey(name: 'label_court') this.labelCourt,
    required this.label,
    this.icone,
    this.ordre,
  });

  factory _$WorkflowEtapeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowEtapeModelImplFromJson(json);

  @override
  final EtapeId id;
  @override
  @JsonKey(name: 'groupe_id')
  final GroupeId groupeId;
  @override
  @JsonKey(name: 'label_court')
  final String? labelCourt;
  @override
  final String label;
  @override
  final String? icone;
  @override
  final int? ordre;

  @override
  String toString() {
    return 'WorkflowEtapeModel(id: $id, groupeId: $groupeId, labelCourt: $labelCourt, label: $label, icone: $icone, ordre: $ordre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowEtapeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupeId, groupeId) ||
                other.groupeId == groupeId) &&
            (identical(other.labelCourt, labelCourt) ||
                other.labelCourt == labelCourt) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icone, icone) || other.icone == icone) &&
            (identical(other.ordre, ordre) || other.ordre == ordre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, groupeId, labelCourt, label, icone, ordre);

  /// Create a copy of WorkflowEtapeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowEtapeModelImplCopyWith<_$WorkflowEtapeModelImpl> get copyWith =>
      __$$WorkflowEtapeModelImplCopyWithImpl<_$WorkflowEtapeModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowEtapeModelImplToJson(this);
  }
}

abstract class _WorkflowEtapeModel implements WorkflowEtapeModel {
  const factory _WorkflowEtapeModel({
    required final EtapeId id,
    @JsonKey(name: 'groupe_id') required final GroupeId groupeId,
    @JsonKey(name: 'label_court') final String? labelCourt,
    required final String label,
    final String? icone,
    final int? ordre,
  }) = _$WorkflowEtapeModelImpl;

  factory _WorkflowEtapeModel.fromJson(Map<String, dynamic> json) =
      _$WorkflowEtapeModelImpl.fromJson;

  @override
  EtapeId get id;
  @override
  @JsonKey(name: 'groupe_id')
  GroupeId get groupeId;
  @override
  @JsonKey(name: 'label_court')
  String? get labelCourt;
  @override
  String get label;
  @override
  String? get icone;
  @override
  int? get ordre;

  /// Create a copy of WorkflowEtapeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowEtapeModelImplCopyWith<_$WorkflowEtapeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
