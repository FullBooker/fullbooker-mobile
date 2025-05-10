// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pricing_option_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPricingOptionResponse _$ProductPricingOptionResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductPricingOptionResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductPricingOptionResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ProductPricingOption?>? get results =>
      throw _privateConstructorUsedError;

  /// Serializes this ProductPricingOptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPricingOptionResponseCopyWith<ProductPricingOptionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPricingOptionResponseCopyWith<$Res> {
  factory $ProductPricingOptionResponseCopyWith(
          ProductPricingOptionResponse value,
          $Res Function(ProductPricingOptionResponse) then) =
      _$ProductPricingOptionResponseCopyWithImpl<$Res,
          ProductPricingOptionResponse>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductPricingOption?>? results});
}

/// @nodoc
class _$ProductPricingOptionResponseCopyWithImpl<$Res,
        $Val extends ProductPricingOptionResponse>
    implements $ProductPricingOptionResponseCopyWith<$Res> {
  _$ProductPricingOptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPricingOptionResponse
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
              as List<ProductPricingOption?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPricingOptionResponseImplCopyWith<$Res>
    implements $ProductPricingOptionResponseCopyWith<$Res> {
  factory _$$ProductPricingOptionResponseImplCopyWith(
          _$ProductPricingOptionResponseImpl value,
          $Res Function(_$ProductPricingOptionResponseImpl) then) =
      __$$ProductPricingOptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ProductPricingOption?>? results});
}

/// @nodoc
class __$$ProductPricingOptionResponseImplCopyWithImpl<$Res>
    extends _$ProductPricingOptionResponseCopyWithImpl<$Res,
        _$ProductPricingOptionResponseImpl>
    implements _$$ProductPricingOptionResponseImplCopyWith<$Res> {
  __$$ProductPricingOptionResponseImplCopyWithImpl(
      _$ProductPricingOptionResponseImpl _value,
      $Res Function(_$ProductPricingOptionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ProductPricingOptionResponseImpl(
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
              as List<ProductPricingOption?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductPricingOptionResponseImpl
    implements _ProductPricingOptionResponse {
  _$ProductPricingOptionResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$ProductPricingOptionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductPricingOptionResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<ProductPricingOption?>? results;

  @override
  String toString() {
    return 'ProductPricingOptionResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPricingOptionResponseImpl &&
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

  /// Create a copy of ProductPricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPricingOptionResponseImplCopyWith<
          _$ProductPricingOptionResponseImpl>
      get copyWith => __$$ProductPricingOptionResponseImplCopyWithImpl<
          _$ProductPricingOptionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPricingOptionResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductPricingOptionResponse
    implements ProductPricingOptionResponse {
  factory _ProductPricingOptionResponse(
          {final int count,
          final String? next,
          final String? previous,
          final List<ProductPricingOption?>? results}) =
      _$ProductPricingOptionResponseImpl;

  factory _ProductPricingOptionResponse.fromJson(Map<String, dynamic> json) =
      _$ProductPricingOptionResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ProductPricingOption?>? get results;

  /// Create a copy of ProductPricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPricingOptionResponseImplCopyWith<
          _$ProductPricingOptionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
