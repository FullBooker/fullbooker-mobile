// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bookings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductBookingsResponse _$ProductBookingsResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductBookingsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductBookingsResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Booking?>? get results => throw _privateConstructorUsedError;

  /// Serializes this ProductBookingsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductBookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductBookingsResponseCopyWith<ProductBookingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductBookingsResponseCopyWith<$Res> {
  factory $ProductBookingsResponseCopyWith(ProductBookingsResponse value,
          $Res Function(ProductBookingsResponse) then) =
      _$ProductBookingsResponseCopyWithImpl<$Res, ProductBookingsResponse>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Booking?>? results});
}

/// @nodoc
class _$ProductBookingsResponseCopyWithImpl<$Res,
        $Val extends ProductBookingsResponse>
    implements $ProductBookingsResponseCopyWith<$Res> {
  _$ProductBookingsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductBookingsResponse
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
              as List<Booking?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductBookingsResponseImplCopyWith<$Res>
    implements $ProductBookingsResponseCopyWith<$Res> {
  factory _$$ProductBookingsResponseImplCopyWith(
          _$ProductBookingsResponseImpl value,
          $Res Function(_$ProductBookingsResponseImpl) then) =
      __$$ProductBookingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Booking?>? results});
}

/// @nodoc
class __$$ProductBookingsResponseImplCopyWithImpl<$Res>
    extends _$ProductBookingsResponseCopyWithImpl<$Res,
        _$ProductBookingsResponseImpl>
    implements _$$ProductBookingsResponseImplCopyWith<$Res> {
  __$$ProductBookingsResponseImplCopyWithImpl(
      _$ProductBookingsResponseImpl _value,
      $Res Function(_$ProductBookingsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductBookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ProductBookingsResponseImpl(
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
              as List<Booking?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductBookingsResponseImpl implements _ProductBookingsResponse {
  _$ProductBookingsResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$ProductBookingsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductBookingsResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<Booking?>? results;

  @override
  String toString() {
    return 'ProductBookingsResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductBookingsResponseImpl &&
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

  /// Create a copy of ProductBookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductBookingsResponseImplCopyWith<_$ProductBookingsResponseImpl>
      get copyWith => __$$ProductBookingsResponseImplCopyWithImpl<
          _$ProductBookingsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductBookingsResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductBookingsResponse implements ProductBookingsResponse {
  factory _ProductBookingsResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<Booking?>? results}) = _$ProductBookingsResponseImpl;

  factory _ProductBookingsResponse.fromJson(Map<String, dynamic> json) =
      _$ProductBookingsResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Booking?>? get results;

  /// Create a copy of ProductBookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductBookingsResponseImplCopyWith<_$ProductBookingsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
