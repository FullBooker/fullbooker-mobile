// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  @JsonKey(name: 'id')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get emailAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_host')
  bool get isHost => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get profileURL => throw _privateConstructorUsedError;

  /// Serializes this UserState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? userID,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'email') String? emailAddress,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'is_active') bool active,
      @JsonKey(name: 'is_host') bool isHost,
      @JsonKey(name: 'image') String? profileURL});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? active = null,
    Object? isHost = null,
    Object? profileURL = freezed,
  }) {
    return _then(_value.copyWith(
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      profileURL: freezed == profileURL
          ? _value.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? userID,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'email') String? emailAddress,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'is_active') bool active,
      @JsonKey(name: 'is_host') bool isHost,
      @JsonKey(name: 'image') String? profileURL});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? active = null,
    Object? isHost = null,
    Object? profileURL = freezed,
  }) {
    return _then(_$UserStateImpl(
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      profileURL: freezed == profileURL
          ? _value.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserStateImpl with DiagnosticableTreeMixin implements _UserState {
  _$UserStateImpl(
      {@JsonKey(name: 'id') this.userID = UNKNOWN,
      @JsonKey(name: 'phone_number') this.phoneNumber = UNKNOWN,
      @JsonKey(name: 'email') this.emailAddress = UNKNOWN,
      @JsonKey(name: 'first_name') this.firstName = UNKNOWN,
      @JsonKey(name: 'last_name') this.lastName = UNKNOWN,
      @JsonKey(name: 'is_active') this.active = false,
      @JsonKey(name: 'is_host') this.isHost = false,
      @JsonKey(name: 'image') this.profileURL = UNKNOWN});

  factory _$UserStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStateImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? userID;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'email')
  final String? emailAddress;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'is_active')
  final bool active;
  @override
  @JsonKey(name: 'is_host')
  final bool isHost;
  @override
  @JsonKey(name: 'image')
  final String? profileURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState(userID: $userID, phoneNumber: $phoneNumber, emailAddress: $emailAddress, firstName: $firstName, lastName: $lastName, active: $active, isHost: $isHost, profileURL: $profileURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState'))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('emailAddress', emailAddress))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('isHost', isHost))
      ..add(DiagnosticsProperty('profileURL', profileURL));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.profileURL, profileURL) ||
                other.profileURL == profileURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userID, phoneNumber,
      emailAddress, firstName, lastName, active, isHost, profileURL);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateImplToJson(
      this,
    );
  }
}

abstract class _UserState implements UserState {
  factory _UserState(
      {@JsonKey(name: 'id') final String? userID,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'email') final String? emailAddress,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'is_active') final bool active,
      @JsonKey(name: 'is_host') final bool isHost,
      @JsonKey(name: 'image') final String? profileURL}) = _$UserStateImpl;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$UserStateImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get userID;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'email')
  String? get emailAddress;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'is_active')
  bool get active;
  @override
  @JsonKey(name: 'is_host')
  bool get isHost;
  @override
  @JsonKey(name: 'image')
  String? get profileURL;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
