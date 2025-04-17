// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pricing_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPricingResponse _$ProductPricingResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductPricingResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductPricingResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ProductPricing?>? get results => throw _privateConstructorUsedError;

  /// Serializes this ProductPricingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPricingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPricingResponseCopyWith<ProductPricingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPricingResponseCopyWith<$Res> {
  factory $ProductPricingResponseCopyWith(ProductPricingResponse value,
          $Res Function(ProductPricingResponse) then) =
      _$ProductPricingResponseCopyWithImpl<$Res, ProductPricingResponse>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductPricing?>? results});
}

/// @nodoc
class _$ProductPricingResponseCopyWithImpl<$Res,
        $Val extends ProductPricingResponse>
    implements $ProductPricingResponseCopyWith<$Res> {
  _$ProductPricingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPricingResponse
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
              as List<ProductPricing?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPricingResponseImplCopyWith<$Res>
    implements $ProductPricingResponseCopyWith<$Res> {
  factory _$$ProductPricingResponseImplCopyWith(
          _$ProductPricingResponseImpl value,
          $Res Function(_$ProductPricingResponseImpl) then) =
      __$$ProductPricingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductPricing?>? results});
}

/// @nodoc
class __$$ProductPricingResponseImplCopyWithImpl<$Res>
    extends _$ProductPricingResponseCopyWithImpl<$Res,
        _$ProductPricingResponseImpl>
    implements _$$ProductPricingResponseImplCopyWith<$Res> {
  __$$ProductPricingResponseImplCopyWithImpl(
      _$ProductPricingResponseImpl _value,
      $Res Function(_$ProductPricingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPricingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ProductPricingResponseImpl(
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
              as List<ProductPricing?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductPricingResponseImpl implements _ProductPricingResponse {
  _$ProductPricingResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$ProductPricingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPricingResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<ProductPricing?>? results;

  @override
  String toString() {
    return 'ProductPricingResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPricingResponseImpl &&
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

  /// Create a copy of ProductPricingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPricingResponseImplCopyWith<_$ProductPricingResponseImpl>
      get copyWith => __$$ProductPricingResponseImplCopyWithImpl<
          _$ProductPricingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPricingResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductPricingResponse implements ProductPricingResponse {
  factory _ProductPricingResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<ProductPricing?>? results}) = _$ProductPricingResponseImpl;

  factory _ProductPricingResponse.fromJson(Map<String, dynamic> json) =
      _$ProductPricingResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ProductPricing?>? get results;

  /// Create a copy of ProductPricingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPricingResponseImplCopyWith<_$ProductPricingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
