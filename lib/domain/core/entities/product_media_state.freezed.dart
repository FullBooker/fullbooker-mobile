// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_media_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductMediaState _$ProductMediaStateFromJson(Map<String, dynamic> json) {
  return _ProductMediaState.fromJson(json);
}

/// @nodoc
mixin _$ProductMediaState {
  List<ProductImage> get media => throw _privateConstructorUsedError;

  /// Serializes this ProductMediaState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductMediaStateCopyWith<ProductMediaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMediaStateCopyWith<$Res> {
  factory $ProductMediaStateCopyWith(
          ProductMediaState value, $Res Function(ProductMediaState) then) =
      _$ProductMediaStateCopyWithImpl<$Res, ProductMediaState>;
  @useResult
  $Res call({List<ProductImage> media});
}

/// @nodoc
class _$ProductMediaStateCopyWithImpl<$Res, $Val extends ProductMediaState>
    implements $ProductMediaStateCopyWith<$Res> {
  _$ProductMediaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMediaStateImplCopyWith<$Res>
    implements $ProductMediaStateCopyWith<$Res> {
  factory _$$ProductMediaStateImplCopyWith(_$ProductMediaStateImpl value,
          $Res Function(_$ProductMediaStateImpl) then) =
      __$$ProductMediaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductImage> media});
}

/// @nodoc
class __$$ProductMediaStateImplCopyWithImpl<$Res>
    extends _$ProductMediaStateCopyWithImpl<$Res, _$ProductMediaStateImpl>
    implements _$$ProductMediaStateImplCopyWith<$Res> {
  __$$ProductMediaStateImplCopyWithImpl(_$ProductMediaStateImpl _value,
      $Res Function(_$ProductMediaStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = null,
  }) {
    return _then(_$ProductMediaStateImpl(
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ProductImage>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductMediaStateImpl implements _ProductMediaState {
  const _$ProductMediaStateImpl({this.media = const <ProductImage>[]});

  factory _$ProductMediaStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductMediaStateImplFromJson(json);

  @override
  @JsonKey()
  final List<ProductImage> media;

  @override
  String toString() {
    return 'ProductMediaState(media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMediaStateImpl &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(media));

  /// Create a copy of ProductMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMediaStateImplCopyWith<_$ProductMediaStateImpl> get copyWith =>
      __$$ProductMediaStateImplCopyWithImpl<_$ProductMediaStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductMediaStateImplToJson(
      this,
    );
  }
}

abstract class _ProductMediaState implements ProductMediaState {
  const factory _ProductMediaState({final List<ProductImage> media}) =
      _$ProductMediaStateImpl;

  factory _ProductMediaState.fromJson(Map<String, dynamic> json) =
      _$ProductMediaStateImpl.fromJson;

  @override
  List<ProductImage> get media;

  /// Create a copy of ProductMediaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductMediaStateImplCopyWith<_$ProductMediaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
