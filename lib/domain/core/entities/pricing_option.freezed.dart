// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingOption _$PricingOptionFromJson(Map<String, dynamic> json) {
  return _PricingOption.fromJson(json);
}

/// @nodoc
mixin _$PricingOption {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get pricingOptionType => throw _privateConstructorUsedError;

  /// Serializes this PricingOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingOptionCopyWith<PricingOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingOptionCopyWith<$Res> {
  factory $PricingOptionCopyWith(
          PricingOption value, $Res Function(PricingOption) then) =
      _$PricingOptionCopyWithImpl<$Res, PricingOption>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? name,
      String? description,
      @JsonKey(name: 'type') String? pricingOptionType});
}

/// @nodoc
class _$PricingOptionCopyWithImpl<$Res, $Val extends PricingOption>
    implements $PricingOptionCopyWith<$Res> {
  _$PricingOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pricingOptionType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionType: freezed == pricingOptionType
          ? _value.pricingOptionType
          : pricingOptionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingOptionImplCopyWith<$Res>
    implements $PricingOptionCopyWith<$Res> {
  factory _$$PricingOptionImplCopyWith(
          _$PricingOptionImpl value, $Res Function(_$PricingOptionImpl) then) =
      __$$PricingOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      String? name,
      String? description,
      @JsonKey(name: 'type') String? pricingOptionType});
}

/// @nodoc
class __$$PricingOptionImplCopyWithImpl<$Res>
    extends _$PricingOptionCopyWithImpl<$Res, _$PricingOptionImpl>
    implements _$$PricingOptionImplCopyWith<$Res> {
  __$$PricingOptionImplCopyWithImpl(
      _$PricingOptionImpl _value, $Res Function(_$PricingOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pricingOptionType = freezed,
  }) {
    return _then(_$PricingOptionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingOptionType: freezed == pricingOptionType
          ? _value.pricingOptionType
          : pricingOptionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PricingOptionImpl implements _PricingOption {
  _$PricingOptionImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      this.name = UNKNOWN,
      this.description = UNKNOWN,
      @JsonKey(name: 'type') this.pricingOptionType = UNKNOWN});

  factory _$PricingOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingOptionImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey()
  final bool? active;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey(name: 'type')
  final String? pricingOptionType;

  @override
  String toString() {
    return 'PricingOption(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, name: $name, description: $description, pricingOptionType: $pricingOptionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pricingOptionType, pricingOptionType) ||
                other.pricingOptionType == pricingOptionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, active,
      name, description, pricingOptionType);

  /// Create a copy of PricingOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingOptionImplCopyWith<_$PricingOptionImpl> get copyWith =>
      __$$PricingOptionImplCopyWithImpl<_$PricingOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingOptionImplToJson(
      this,
    );
  }
}

abstract class _PricingOption implements PricingOption {
  factory _PricingOption(
          {final String? id,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt,
          final bool? active,
          final String? name,
          final String? description,
          @JsonKey(name: 'type') final String? pricingOptionType}) =
      _$PricingOptionImpl;

  factory _PricingOption.fromJson(Map<String, dynamic> json) =
      _$PricingOptionImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  bool? get active;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'type')
  String? get pricingOptionType;

  /// Create a copy of PricingOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingOptionImplCopyWith<_$PricingOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
