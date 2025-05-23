// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_media_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductMediaResponse _$ProductMediaResponseFromJson(Map<String, dynamic> json) {
  return _ProductMediaResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductMediaResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ProductMedia?>? get results => throw _privateConstructorUsedError;

  /// Serializes this ProductMediaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductMediaResponseCopyWith<ProductMediaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMediaResponseCopyWith<$Res> {
  factory $ProductMediaResponseCopyWith(ProductMediaResponse value,
          $Res Function(ProductMediaResponse) then) =
      _$ProductMediaResponseCopyWithImpl<$Res, ProductMediaResponse>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductMedia?>? results});
}

/// @nodoc
class _$ProductMediaResponseCopyWithImpl<$Res,
        $Val extends ProductMediaResponse>
    implements $ProductMediaResponseCopyWith<$Res> {
  _$ProductMediaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMediaResponseImplCopyWith<$Res>
    implements $ProductMediaResponseCopyWith<$Res> {
  factory _$$ProductMediaResponseImplCopyWith(_$ProductMediaResponseImpl value,
          $Res Function(_$ProductMediaResponseImpl) then) =
      __$$ProductMediaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductMedia?>? results});
}

/// @nodoc
class __$$ProductMediaResponseImplCopyWithImpl<$Res>
    extends _$ProductMediaResponseCopyWithImpl<$Res, _$ProductMediaResponseImpl>
    implements _$$ProductMediaResponseImplCopyWith<$Res> {
  __$$ProductMediaResponseImplCopyWithImpl(_$ProductMediaResponseImpl _value,
      $Res Function(_$ProductMediaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ProductMediaResponseImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductMediaResponseImpl implements _ProductMediaResponse {
  _$ProductMediaResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$ProductMediaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductMediaResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<ProductMedia?>? results;

  @override
  String toString() {
    return 'ProductMediaResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMediaResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(results));

  /// Create a copy of ProductMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMediaResponseImplCopyWith<_$ProductMediaResponseImpl>
      get copyWith =>
          __$$ProductMediaResponseImplCopyWithImpl<_$ProductMediaResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductMediaResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductMediaResponse implements ProductMediaResponse {
  factory _ProductMediaResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<ProductMedia?>? results}) = _$ProductMediaResponseImpl;

  factory _ProductMediaResponse.fromJson(Map<String, dynamic> json) =
      _$ProductMediaResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ProductMedia?>? get results;

  /// Create a copy of ProductMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductMediaResponseImplCopyWith<_$ProductMediaResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
