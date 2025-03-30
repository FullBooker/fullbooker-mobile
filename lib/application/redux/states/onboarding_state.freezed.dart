// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
mixin _$OnboardingState {
  SignInMethod get signInMethod => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// LOGIN VALUES
  bool get invalidCredentials => throw _privateConstructorUsedError;
  bool get hidePassword => throw _privateConstructorUsedError;

  /// CREATE ACCOUNT VALUES
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get newEmailAddress => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  bool get hideNewPassword => throw _privateConstructorUsedError;
  String get newConfirmPassword => throw _privateConstructorUsedError;
  bool get hideNewConfirmPassword => throw _privateConstructorUsedError;

  /// RESET PASSWORD VALUES
  bool get invalidOTP => throw _privateConstructorUsedError;
  String get resetEmailAddress => throw _privateConstructorUsedError;
  String get resetPasswordOTP => throw _privateConstructorUsedError;
  String get resetPasswordDebugOTP => throw _privateConstructorUsedError;
  String get resetPassword => throw _privateConstructorUsedError;
  String get resetPasswordConfirm => throw _privateConstructorUsedError;
  bool get hideResetPassword => throw _privateConstructorUsedError;
  bool get hideResetConfirmPassword => throw _privateConstructorUsedError;

  /// Serializes this OnboardingState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {SignInMethod signInMethod,
      String emailAddress,
      String password,
      bool invalidCredentials,
      bool hidePassword,
      String firstName,
      String lastName,
      String newEmailAddress,
      String phoneNumber,
      String newPassword,
      bool hideNewPassword,
      String newConfirmPassword,
      bool hideNewConfirmPassword,
      bool invalidOTP,
      String resetEmailAddress,
      String resetPasswordOTP,
      String resetPasswordDebugOTP,
      String resetPassword,
      String resetPasswordConfirm,
      bool hideResetPassword,
      bool hideResetConfirmPassword});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInMethod = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? invalidCredentials = null,
    Object? hidePassword = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? newEmailAddress = null,
    Object? phoneNumber = null,
    Object? newPassword = null,
    Object? hideNewPassword = null,
    Object? newConfirmPassword = null,
    Object? hideNewConfirmPassword = null,
    Object? invalidOTP = null,
    Object? resetEmailAddress = null,
    Object? resetPasswordOTP = null,
    Object? resetPasswordDebugOTP = null,
    Object? resetPassword = null,
    Object? resetPasswordConfirm = null,
    Object? hideResetPassword = null,
    Object? hideResetConfirmPassword = null,
  }) {
    return _then(_value.copyWith(
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as SignInMethod,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      invalidCredentials: null == invalidCredentials
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePassword: null == hidePassword
          ? _value.hidePassword
          : hidePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      newEmailAddress: null == newEmailAddress
          ? _value.newEmailAddress
          : newEmailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hideNewPassword: null == hideNewPassword
          ? _value.hideNewPassword
          : hideNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      newConfirmPassword: null == newConfirmPassword
          ? _value.newConfirmPassword
          : newConfirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hideNewConfirmPassword: null == hideNewConfirmPassword
          ? _value.hideNewConfirmPassword
          : hideNewConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidOTP: null == invalidOTP
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      resetEmailAddress: null == resetEmailAddress
          ? _value.resetEmailAddress
          : resetEmailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordOTP: null == resetPasswordOTP
          ? _value.resetPasswordOTP
          : resetPasswordOTP // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordDebugOTP: null == resetPasswordDebugOTP
          ? _value.resetPasswordDebugOTP
          : resetPasswordDebugOTP // ignore: cast_nullable_to_non_nullable
              as String,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordConfirm: null == resetPasswordConfirm
          ? _value.resetPasswordConfirm
          : resetPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      hideResetPassword: null == hideResetPassword
          ? _value.hideResetPassword
          : hideResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hideResetConfirmPassword: null == hideResetConfirmPassword
          ? _value.hideResetConfirmPassword
          : hideResetConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignInMethod signInMethod,
      String emailAddress,
      String password,
      bool invalidCredentials,
      bool hidePassword,
      String firstName,
      String lastName,
      String newEmailAddress,
      String phoneNumber,
      String newPassword,
      bool hideNewPassword,
      String newConfirmPassword,
      bool hideNewConfirmPassword,
      bool invalidOTP,
      String resetEmailAddress,
      String resetPasswordOTP,
      String resetPasswordDebugOTP,
      String resetPassword,
      String resetPasswordConfirm,
      bool hideResetPassword,
      bool hideResetConfirmPassword});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInMethod = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? invalidCredentials = null,
    Object? hidePassword = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? newEmailAddress = null,
    Object? phoneNumber = null,
    Object? newPassword = null,
    Object? hideNewPassword = null,
    Object? newConfirmPassword = null,
    Object? hideNewConfirmPassword = null,
    Object? invalidOTP = null,
    Object? resetEmailAddress = null,
    Object? resetPasswordOTP = null,
    Object? resetPasswordDebugOTP = null,
    Object? resetPassword = null,
    Object? resetPasswordConfirm = null,
    Object? hideResetPassword = null,
    Object? hideResetConfirmPassword = null,
  }) {
    return _then(_$OnboardingStateImpl(
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as SignInMethod,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      invalidCredentials: null == invalidCredentials
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePassword: null == hidePassword
          ? _value.hidePassword
          : hidePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      newEmailAddress: null == newEmailAddress
          ? _value.newEmailAddress
          : newEmailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hideNewPassword: null == hideNewPassword
          ? _value.hideNewPassword
          : hideNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      newConfirmPassword: null == newConfirmPassword
          ? _value.newConfirmPassword
          : newConfirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hideNewConfirmPassword: null == hideNewConfirmPassword
          ? _value.hideNewConfirmPassword
          : hideNewConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidOTP: null == invalidOTP
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      resetEmailAddress: null == resetEmailAddress
          ? _value.resetEmailAddress
          : resetEmailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordOTP: null == resetPasswordOTP
          ? _value.resetPasswordOTP
          : resetPasswordOTP // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordDebugOTP: null == resetPasswordDebugOTP
          ? _value.resetPasswordDebugOTP
          : resetPasswordDebugOTP // ignore: cast_nullable_to_non_nullable
              as String,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as String,
      resetPasswordConfirm: null == resetPasswordConfirm
          ? _value.resetPasswordConfirm
          : resetPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      hideResetPassword: null == hideResetPassword
          ? _value.hideResetPassword
          : hideResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      hideResetConfirmPassword: null == hideResetConfirmPassword
          ? _value.hideResetConfirmPassword
          : hideResetConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl(
      {this.signInMethod = SignInMethod.EMAIL,
      this.emailAddress = UNKNOWN,
      this.password = UNKNOWN,
      this.invalidCredentials = false,
      this.hidePassword = true,
      this.firstName = UNKNOWN,
      this.lastName = UNKNOWN,
      this.newEmailAddress = UNKNOWN,
      this.phoneNumber = UNKNOWN,
      this.newPassword = UNKNOWN,
      this.hideNewPassword = true,
      this.newConfirmPassword = UNKNOWN,
      this.hideNewConfirmPassword = true,
      this.invalidOTP = false,
      this.resetEmailAddress = UNKNOWN,
      this.resetPasswordOTP = UNKNOWN,
      this.resetPasswordDebugOTP = UNKNOWN,
      this.resetPassword = UNKNOWN,
      this.resetPasswordConfirm = UNKNOWN,
      this.hideResetPassword = true,
      this.hideResetConfirmPassword = true});

  factory _$OnboardingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingStateImplFromJson(json);

  @override
  @JsonKey()
  final SignInMethod signInMethod;
  @override
  @JsonKey()
  final String emailAddress;
  @override
  @JsonKey()
  final String password;

  /// LOGIN VALUES
  @override
  @JsonKey()
  final bool invalidCredentials;
  @override
  @JsonKey()
  final bool hidePassword;

  /// CREATE ACCOUNT VALUES
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String newEmailAddress;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final bool hideNewPassword;
  @override
  @JsonKey()
  final String newConfirmPassword;
  @override
  @JsonKey()
  final bool hideNewConfirmPassword;

  /// RESET PASSWORD VALUES
  @override
  @JsonKey()
  final bool invalidOTP;
  @override
  @JsonKey()
  final String resetEmailAddress;
  @override
  @JsonKey()
  final String resetPasswordOTP;
  @override
  @JsonKey()
  final String resetPasswordDebugOTP;
  @override
  @JsonKey()
  final String resetPassword;
  @override
  @JsonKey()
  final String resetPasswordConfirm;
  @override
  @JsonKey()
  final bool hideResetPassword;
  @override
  @JsonKey()
  final bool hideResetConfirmPassword;

  @override
  String toString() {
    return 'OnboardingState(signInMethod: $signInMethod, emailAddress: $emailAddress, password: $password, invalidCredentials: $invalidCredentials, hidePassword: $hidePassword, firstName: $firstName, lastName: $lastName, newEmailAddress: $newEmailAddress, phoneNumber: $phoneNumber, newPassword: $newPassword, hideNewPassword: $hideNewPassword, newConfirmPassword: $newConfirmPassword, hideNewConfirmPassword: $hideNewConfirmPassword, invalidOTP: $invalidOTP, resetEmailAddress: $resetEmailAddress, resetPasswordOTP: $resetPasswordOTP, resetPasswordDebugOTP: $resetPasswordDebugOTP, resetPassword: $resetPassword, resetPasswordConfirm: $resetPasswordConfirm, hideResetPassword: $hideResetPassword, hideResetConfirmPassword: $hideResetConfirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.signInMethod, signInMethod) ||
                other.signInMethod == signInMethod) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.invalidCredentials, invalidCredentials) ||
                other.invalidCredentials == invalidCredentials) &&
            (identical(other.hidePassword, hidePassword) ||
                other.hidePassword == hidePassword) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.newEmailAddress, newEmailAddress) ||
                other.newEmailAddress == newEmailAddress) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.hideNewPassword, hideNewPassword) ||
                other.hideNewPassword == hideNewPassword) &&
            (identical(other.newConfirmPassword, newConfirmPassword) ||
                other.newConfirmPassword == newConfirmPassword) &&
            (identical(other.hideNewConfirmPassword, hideNewConfirmPassword) ||
                other.hideNewConfirmPassword == hideNewConfirmPassword) &&
            (identical(other.invalidOTP, invalidOTP) ||
                other.invalidOTP == invalidOTP) &&
            (identical(other.resetEmailAddress, resetEmailAddress) ||
                other.resetEmailAddress == resetEmailAddress) &&
            (identical(other.resetPasswordOTP, resetPasswordOTP) ||
                other.resetPasswordOTP == resetPasswordOTP) &&
            (identical(other.resetPasswordDebugOTP, resetPasswordDebugOTP) ||
                other.resetPasswordDebugOTP == resetPasswordDebugOTP) &&
            (identical(other.resetPassword, resetPassword) ||
                other.resetPassword == resetPassword) &&
            (identical(other.resetPasswordConfirm, resetPasswordConfirm) ||
                other.resetPasswordConfirm == resetPasswordConfirm) &&
            (identical(other.hideResetPassword, hideResetPassword) ||
                other.hideResetPassword == hideResetPassword) &&
            (identical(
                    other.hideResetConfirmPassword, hideResetConfirmPassword) ||
                other.hideResetConfirmPassword == hideResetConfirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        signInMethod,
        emailAddress,
        password,
        invalidCredentials,
        hidePassword,
        firstName,
        lastName,
        newEmailAddress,
        phoneNumber,
        newPassword,
        hideNewPassword,
        newConfirmPassword,
        hideNewConfirmPassword,
        invalidOTP,
        resetEmailAddress,
        resetPasswordOTP,
        resetPasswordDebugOTP,
        resetPassword,
        resetPasswordConfirm,
        hideResetPassword,
        hideResetConfirmPassword
      ]);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingStateImplToJson(
      this,
    );
  }
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {final SignInMethod signInMethod,
      final String emailAddress,
      final String password,
      final bool invalidCredentials,
      final bool hidePassword,
      final String firstName,
      final String lastName,
      final String newEmailAddress,
      final String phoneNumber,
      final String newPassword,
      final bool hideNewPassword,
      final String newConfirmPassword,
      final bool hideNewConfirmPassword,
      final bool invalidOTP,
      final String resetEmailAddress,
      final String resetPasswordOTP,
      final String resetPasswordDebugOTP,
      final String resetPassword,
      final String resetPasswordConfirm,
      final bool hideResetPassword,
      final bool hideResetConfirmPassword}) = _$OnboardingStateImpl;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$OnboardingStateImpl.fromJson;

  @override
  SignInMethod get signInMethod;
  @override
  String get emailAddress;
  @override
  String get password;

  /// LOGIN VALUES
  @override
  bool get invalidCredentials;
  @override
  bool get hidePassword;

  /// CREATE ACCOUNT VALUES
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get newEmailAddress;
  @override
  String get phoneNumber;
  @override
  String get newPassword;
  @override
  bool get hideNewPassword;
  @override
  String get newConfirmPassword;
  @override
  bool get hideNewConfirmPassword;

  /// RESET PASSWORD VALUES
  @override
  bool get invalidOTP;
  @override
  String get resetEmailAddress;
  @override
  String get resetPasswordOTP;
  @override
  String get resetPasswordDebugOTP;
  @override
  String get resetPassword;
  @override
  String get resetPasswordConfirm;
  @override
  bool get hideResetPassword;
  @override
  bool get hideResetConfirmPassword;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
