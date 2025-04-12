// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_perms_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationPermsResult _$LocationPermsResultFromJson(Map<String, dynamic> json) {
  return _LocationPermsResult.fromJson(json);
}

/// @nodoc
mixin _$LocationPermsResult {
  bool? get denied => throw _privateConstructorUsedError;
  bool? get deniedForever => throw _privateConstructorUsedError;

  /// Serializes this LocationPermsResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationPermsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationPermsResultCopyWith<LocationPermsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPermsResultCopyWith<$Res> {
  factory $LocationPermsResultCopyWith(
          LocationPermsResult value, $Res Function(LocationPermsResult) then) =
      _$LocationPermsResultCopyWithImpl<$Res, LocationPermsResult>;
  @useResult
  $Res call({bool? denied, bool? deniedForever});
}

/// @nodoc
class _$LocationPermsResultCopyWithImpl<$Res, $Val extends LocationPermsResult>
    implements $LocationPermsResultCopyWith<$Res> {
  _$LocationPermsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationPermsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? denied = freezed,
    Object? deniedForever = freezed,
  }) {
    return _then(_value.copyWith(
      denied: freezed == denied
          ? _value.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as bool?,
      deniedForever: freezed == deniedForever
          ? _value.deniedForever
          : deniedForever // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationPermsResultImplCopyWith<$Res>
    implements $LocationPermsResultCopyWith<$Res> {
  factory _$$LocationPermsResultImplCopyWith(_$LocationPermsResultImpl value,
          $Res Function(_$LocationPermsResultImpl) then) =
      __$$LocationPermsResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? denied, bool? deniedForever});
}

/// @nodoc
class __$$LocationPermsResultImplCopyWithImpl<$Res>
    extends _$LocationPermsResultCopyWithImpl<$Res, _$LocationPermsResultImpl>
    implements _$$LocationPermsResultImplCopyWith<$Res> {
  __$$LocationPermsResultImplCopyWithImpl(_$LocationPermsResultImpl _value,
      $Res Function(_$LocationPermsResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationPermsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? denied = freezed,
    Object? deniedForever = freezed,
  }) {
    return _then(_$LocationPermsResultImpl(
      denied: freezed == denied
          ? _value.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as bool?,
      deniedForever: freezed == deniedForever
          ? _value.deniedForever
          : deniedForever // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationPermsResultImpl implements _LocationPermsResult {
  _$LocationPermsResultImpl({this.denied = false, this.deniedForever = false});

  factory _$LocationPermsResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationPermsResultImplFromJson(json);

  @override
  @JsonKey()
  final bool? denied;
  @override
  @JsonKey()
  final bool? deniedForever;

  @override
  String toString() {
    return 'LocationPermsResult(denied: $denied, deniedForever: $deniedForever)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermsResultImpl &&
            (identical(other.denied, denied) || other.denied == denied) &&
            (identical(other.deniedForever, deniedForever) ||
                other.deniedForever == deniedForever));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, denied, deniedForever);

  /// Create a copy of LocationPermsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermsResultImplCopyWith<_$LocationPermsResultImpl> get copyWith =>
      __$$LocationPermsResultImplCopyWithImpl<_$LocationPermsResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationPermsResultImplToJson(
      this,
    );
  }
}

abstract class _LocationPermsResult implements LocationPermsResult {
  factory _LocationPermsResult(
      {final bool? denied,
      final bool? deniedForever}) = _$LocationPermsResultImpl;

  factory _LocationPermsResult.fromJson(Map<String, dynamic> json) =
      _$LocationPermsResultImpl.fromJson;

  @override
  bool? get denied;
  @override
  bool? get deniedForever;

  /// Create a copy of LocationPermsResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationPermsResultImplCopyWith<_$LocationPermsResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
