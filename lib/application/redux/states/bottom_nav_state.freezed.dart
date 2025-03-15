// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BottomNavState _$BottomNavStateFromJson(Map<String, dynamic> json) {
  return _BottomNavState.fromJson(json);
}

/// @nodoc
mixin _$BottomNavState {
  @JsonKey(name: 'currentNavIndex')
  int? get currentNavIndex => throw _privateConstructorUsedError;

  /// Serializes this BottomNavState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavStateCopyWith<BottomNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavStateCopyWith<$Res> {
  factory $BottomNavStateCopyWith(
          BottomNavState value, $Res Function(BottomNavState) then) =
      _$BottomNavStateCopyWithImpl<$Res, BottomNavState>;
  @useResult
  $Res call({@JsonKey(name: 'currentNavIndex') int? currentNavIndex});
}

/// @nodoc
class _$BottomNavStateCopyWithImpl<$Res, $Val extends BottomNavState>
    implements $BottomNavStateCopyWith<$Res> {
  _$BottomNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNavIndex = freezed,
  }) {
    return _then(_value.copyWith(
      currentNavIndex: freezed == currentNavIndex
          ? _value.currentNavIndex
          : currentNavIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomNavStateImplCopyWith<$Res>
    implements $BottomNavStateCopyWith<$Res> {
  factory _$$BottomNavStateImplCopyWith(_$BottomNavStateImpl value,
          $Res Function(_$BottomNavStateImpl) then) =
      __$$BottomNavStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'currentNavIndex') int? currentNavIndex});
}

/// @nodoc
class __$$BottomNavStateImplCopyWithImpl<$Res>
    extends _$BottomNavStateCopyWithImpl<$Res, _$BottomNavStateImpl>
    implements _$$BottomNavStateImplCopyWith<$Res> {
  __$$BottomNavStateImplCopyWithImpl(
      _$BottomNavStateImpl _value, $Res Function(_$BottomNavStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNavIndex = freezed,
  }) {
    return _then(_$BottomNavStateImpl(
      currentNavIndex: freezed == currentNavIndex
          ? _value.currentNavIndex
          : currentNavIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BottomNavStateImpl
    with DiagnosticableTreeMixin
    implements _BottomNavState {
  const _$BottomNavStateImpl(
      {@JsonKey(name: 'currentNavIndex') this.currentNavIndex = 0});

  factory _$BottomNavStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BottomNavStateImplFromJson(json);

  @override
  @JsonKey(name: 'currentNavIndex')
  final int? currentNavIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BottomNavState(currentNavIndex: $currentNavIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BottomNavState'))
      ..add(DiagnosticsProperty('currentNavIndex', currentNavIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavStateImpl &&
            (identical(other.currentNavIndex, currentNavIndex) ||
                other.currentNavIndex == currentNavIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentNavIndex);

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavStateImplCopyWith<_$BottomNavStateImpl> get copyWith =>
      __$$BottomNavStateImplCopyWithImpl<_$BottomNavStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BottomNavStateImplToJson(
      this,
    );
  }
}

abstract class _BottomNavState implements BottomNavState {
  const factory _BottomNavState(
          {@JsonKey(name: 'currentNavIndex') final int? currentNavIndex}) =
      _$BottomNavStateImpl;

  factory _BottomNavState.fromJson(Map<String, dynamic> json) =
      _$BottomNavStateImpl.fromJson;

  @override
  @JsonKey(name: 'currentNavIndex')
  int? get currentNavIndex;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavStateImplCopyWith<_$BottomNavStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
