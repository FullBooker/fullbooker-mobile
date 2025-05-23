// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  AuthState? get authState => throw _privateConstructorUsedError;
  UserState? get userState => throw _privateConstructorUsedError;
  BottomNavState? get bottomNavState => throw _privateConstructorUsedError;
  OnboardingState? get onboardingState => throw _privateConstructorUsedError;
  HostState? get hostState => throw _privateConstructorUsedError;

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AuthState? authState,
      UserState? userState,
      BottomNavState? bottomNavState,
      OnboardingState? onboardingState,
      HostState? hostState});

  $AuthStateCopyWith<$Res>? get authState;
  $UserStateCopyWith<$Res>? get userState;
  $BottomNavStateCopyWith<$Res>? get bottomNavState;
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  $HostStateCopyWith<$Res>? get hostState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = freezed,
    Object? userState = freezed,
    Object? bottomNavState = freezed,
    Object? onboardingState = freezed,
    Object? hostState = freezed,
  }) {
    return _then(_value.copyWith(
      authState: freezed == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavState: freezed == bottomNavState
          ? _value.bottomNavState
          : bottomNavState // ignore: cast_nullable_to_non_nullable
              as BottomNavState?,
      onboardingState: freezed == onboardingState
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      hostState: freezed == hostState
          ? _value.hostState
          : hostState // ignore: cast_nullable_to_non_nullable
              as HostState?,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<$Res>? get authState {
    if (_value.authState == null) {
      return null;
    }

    return $AuthStateCopyWith<$Res>(_value.authState!, (value) {
      return _then(_value.copyWith(authState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BottomNavStateCopyWith<$Res>? get bottomNavState {
    if (_value.bottomNavState == null) {
      return null;
    }

    return $BottomNavStateCopyWith<$Res>(_value.bottomNavState!, (value) {
      return _then(_value.copyWith(bottomNavState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnboardingStateCopyWith<$Res>? get onboardingState {
    if (_value.onboardingState == null) {
      return null;
    }

    return $OnboardingStateCopyWith<$Res>(_value.onboardingState!, (value) {
      return _then(_value.copyWith(onboardingState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostStateCopyWith<$Res>? get hostState {
    if (_value.hostState == null) {
      return null;
    }

    return $HostStateCopyWith<$Res>(_value.hostState!, (value) {
      return _then(_value.copyWith(hostState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthState? authState,
      UserState? userState,
      BottomNavState? bottomNavState,
      OnboardingState? onboardingState,
      HostState? hostState});

  @override
  $AuthStateCopyWith<$Res>? get authState;
  @override
  $UserStateCopyWith<$Res>? get userState;
  @override
  $BottomNavStateCopyWith<$Res>? get bottomNavState;
  @override
  $OnboardingStateCopyWith<$Res>? get onboardingState;
  @override
  $HostStateCopyWith<$Res>? get hostState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = freezed,
    Object? userState = freezed,
    Object? bottomNavState = freezed,
    Object? onboardingState = freezed,
    Object? hostState = freezed,
  }) {
    return _then(_$AppStateImpl(
      authState: freezed == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
      bottomNavState: freezed == bottomNavState
          ? _value.bottomNavState
          : bottomNavState // ignore: cast_nullable_to_non_nullable
              as BottomNavState?,
      onboardingState: freezed == onboardingState
          ? _value.onboardingState
          : onboardingState // ignore: cast_nullable_to_non_nullable
              as OnboardingState?,
      hostState: freezed == hostState
          ? _value.hostState
          : hostState // ignore: cast_nullable_to_non_nullable
              as HostState?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.authState,
      this.userState,
      this.bottomNavState,
      this.onboardingState,
      this.hostState});

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  final AuthState? authState;
  @override
  final UserState? userState;
  @override
  final BottomNavState? bottomNavState;
  @override
  final OnboardingState? onboardingState;
  @override
  final HostState? hostState;

  @override
  String toString() {
    return 'AppState(authState: $authState, userState: $userState, bottomNavState: $bottomNavState, onboardingState: $onboardingState, hostState: $hostState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.bottomNavState, bottomNavState) ||
                other.bottomNavState == bottomNavState) &&
            (identical(other.onboardingState, onboardingState) ||
                other.onboardingState == onboardingState) &&
            (identical(other.hostState, hostState) ||
                other.hostState == hostState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, authState, userState,
      bottomNavState, onboardingState, hostState);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final AuthState? authState,
      final UserState? userState,
      final BottomNavState? bottomNavState,
      final OnboardingState? onboardingState,
      final HostState? hostState}) = _$AppStateImpl;

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  AuthState? get authState;
  @override
  UserState? get userState;
  @override
  BottomNavState? get bottomNavState;
  @override
  OnboardingState? get onboardingState;
  @override
  HostState? get hostState;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
