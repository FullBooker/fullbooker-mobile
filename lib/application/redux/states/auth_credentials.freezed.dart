// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) {
  return _AuthCredentials.fromJson(json);
}

/// @nodoc
mixin _$AuthCredentials {
  @JsonKey(name: 'access')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  String get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this AuthCredentials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthCredentialsCopyWith<AuthCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCredentialsCopyWith<$Res> {
  factory $AuthCredentialsCopyWith(
          AuthCredentials value, $Res Function(AuthCredentials) then) =
      _$AuthCredentialsCopyWithImpl<$Res, AuthCredentials>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access') String accessToken,
      @JsonKey(name: 'refresh') String refreshToken,
      @JsonKey(name: 'expires_at') String expiresAt,
      @JsonKey(name: 'expires_in') String expiresIn});
}

/// @nodoc
class _$AuthCredentialsCopyWithImpl<$Res, $Val extends AuthCredentials>
    implements $AuthCredentialsCopyWith<$Res> {
  _$AuthCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthCredentialsImplCopyWith<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  factory _$$AuthCredentialsImplCopyWith(_$AuthCredentialsImpl value,
          $Res Function(_$AuthCredentialsImpl) then) =
      __$$AuthCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access') String accessToken,
      @JsonKey(name: 'refresh') String refreshToken,
      @JsonKey(name: 'expires_at') String expiresAt,
      @JsonKey(name: 'expires_in') String expiresIn});
}

/// @nodoc
class __$$AuthCredentialsImplCopyWithImpl<$Res>
    extends _$AuthCredentialsCopyWithImpl<$Res, _$AuthCredentialsImpl>
    implements _$$AuthCredentialsImplCopyWith<$Res> {
  __$$AuthCredentialsImplCopyWithImpl(
      _$AuthCredentialsImpl _value, $Res Function(_$AuthCredentialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
    Object? expiresIn = null,
  }) {
    return _then(_$AuthCredentialsImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AuthCredentialsImpl implements _AuthCredentials {
  _$AuthCredentialsImpl(
      {@JsonKey(name: 'access') this.accessToken = UNKNOWN,
      @JsonKey(name: 'refresh') this.refreshToken = UNKNOWN,
      @JsonKey(name: 'expires_at') this.expiresAt = UNKNOWN,
      @JsonKey(name: 'expires_in') this.expiresIn = kDefaultTokenExpiry});

  factory _$AuthCredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthCredentialsImplFromJson(json);

  @override
  @JsonKey(name: 'access')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_at')
  final String expiresAt;
  @override
  @JsonKey(name: 'expires_in')
  final String expiresIn;

  @override
  String toString() {
    return 'AuthCredentials(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCredentialsImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt, expiresIn);

  /// Create a copy of AuthCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCredentialsImplCopyWith<_$AuthCredentialsImpl> get copyWith =>
      __$$AuthCredentialsImplCopyWithImpl<_$AuthCredentialsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthCredentialsImplToJson(
      this,
    );
  }
}

abstract class _AuthCredentials implements AuthCredentials {
  factory _AuthCredentials(
          {@JsonKey(name: 'access') final String accessToken,
          @JsonKey(name: 'refresh') final String refreshToken,
          @JsonKey(name: 'expires_at') final String expiresAt,
          @JsonKey(name: 'expires_in') final String expiresIn}) =
      _$AuthCredentialsImpl;

  factory _AuthCredentials.fromJson(Map<String, dynamic> json) =
      _$AuthCredentialsImpl.fromJson;

  @override
  @JsonKey(name: 'access')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_at')
  String get expiresAt;
  @override
  @JsonKey(name: 'expires_in')
  String get expiresIn;

  /// Create a copy of AuthCredentials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthCredentialsImplCopyWith<_$AuthCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
