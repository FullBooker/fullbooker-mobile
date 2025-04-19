// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStats _$ProductStatsFromJson(Map<String, dynamic> json) {
  return _ProductStats.fromJson(json);
}

/// @nodoc
mixin _$ProductStats {
  int? get bookings => throw _privateConstructorUsedError;
  String? get revenue => throw _privateConstructorUsedError;

  /// Serializes this ProductStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStatsCopyWith<ProductStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStatsCopyWith<$Res> {
  factory $ProductStatsCopyWith(
          ProductStats value, $Res Function(ProductStats) then) =
      _$ProductStatsCopyWithImpl<$Res, ProductStats>;
  @useResult
  $Res call({int? bookings, String? revenue});
}

/// @nodoc
class _$ProductStatsCopyWithImpl<$Res, $Val extends ProductStats>
    implements $ProductStatsCopyWith<$Res> {
  _$ProductStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = freezed,
    Object? revenue = freezed,
  }) {
    return _then(_value.copyWith(
      bookings: freezed == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as int?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStatsImplCopyWith<$Res>
    implements $ProductStatsCopyWith<$Res> {
  factory _$$ProductStatsImplCopyWith(
          _$ProductStatsImpl value, $Res Function(_$ProductStatsImpl) then) =
      __$$ProductStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? bookings, String? revenue});
}

/// @nodoc
class __$$ProductStatsImplCopyWithImpl<$Res>
    extends _$ProductStatsCopyWithImpl<$Res, _$ProductStatsImpl>
    implements _$$ProductStatsImplCopyWith<$Res> {
  __$$ProductStatsImplCopyWithImpl(
      _$ProductStatsImpl _value, $Res Function(_$ProductStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = freezed,
    Object? revenue = freezed,
  }) {
    return _then(_$ProductStatsImpl(
      bookings: freezed == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as int?,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductStatsImpl implements _ProductStats {
  _$ProductStatsImpl({this.bookings = 0, this.revenue = UNKNOWN});

  factory _$ProductStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStatsImplFromJson(json);

  @override
  @JsonKey()
  final int? bookings;
  @override
  @JsonKey()
  final String? revenue;

  @override
  String toString() {
    return 'ProductStats(bookings: $bookings, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStatsImpl &&
            (identical(other.bookings, bookings) ||
                other.bookings == bookings) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookings, revenue);

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStatsImplCopyWith<_$ProductStatsImpl> get copyWith =>
      __$$ProductStatsImplCopyWithImpl<_$ProductStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStatsImplToJson(
      this,
    );
  }
}

abstract class _ProductStats implements ProductStats {
  factory _ProductStats({final int? bookings, final String? revenue}) =
      _$ProductStatsImpl;

  factory _ProductStats.fromJson(Map<String, dynamic> json) =
      _$ProductStatsImpl.fromJson;

  @override
  int? get bookings;
  @override
  String? get revenue;

  /// Create a copy of ProductStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStatsImplCopyWith<_$ProductStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
