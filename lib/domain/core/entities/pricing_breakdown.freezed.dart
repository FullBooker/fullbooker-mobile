// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingBreakdown _$PricingBreakdownFromJson(Map<String, dynamic> json) {
  return _PricingBreakdown.fromJson(json);
}

/// @nodoc
mixin _$PricingBreakdown {
  String get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyers_pay_without_fees')
  double get buyersPayWithoutFees => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyers_pay_with_fees')
  double get buyersPayWithFees => throw _privateConstructorUsedError;
  @JsonKey(name: 'revenue_if_buyers_pay')
  double get revenueIfBuyersPay => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_charged')
  double get feeCharged => throw _privateConstructorUsedError;

  /// Serializes this PricingBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingBreakdownCopyWith<PricingBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingBreakdownCopyWith<$Res> {
  factory $PricingBreakdownCopyWith(
          PricingBreakdown value, $Res Function(PricingBreakdown) then) =
      _$PricingBreakdownCopyWithImpl<$Res, PricingBreakdown>;
  @useResult
  $Res call(
      {String amount,
      String type,
      @JsonKey(name: 'buyers_pay_without_fees') double buyersPayWithoutFees,
      double revenue,
      @JsonKey(name: 'buyers_pay_with_fees') double buyersPayWithFees,
      @JsonKey(name: 'revenue_if_buyers_pay') double revenueIfBuyersPay,
      @JsonKey(name: 'fee_charged') double feeCharged});
}

/// @nodoc
class _$PricingBreakdownCopyWithImpl<$Res, $Val extends PricingBreakdown>
    implements $PricingBreakdownCopyWith<$Res> {
  _$PricingBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
    Object? buyersPayWithoutFees = null,
    Object? revenue = null,
    Object? buyersPayWithFees = null,
    Object? revenueIfBuyersPay = null,
    Object? feeCharged = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      buyersPayWithoutFees: null == buyersPayWithoutFees
          ? _value.buyersPayWithoutFees
          : buyersPayWithoutFees // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      buyersPayWithFees: null == buyersPayWithFees
          ? _value.buyersPayWithFees
          : buyersPayWithFees // ignore: cast_nullable_to_non_nullable
              as double,
      revenueIfBuyersPay: null == revenueIfBuyersPay
          ? _value.revenueIfBuyersPay
          : revenueIfBuyersPay // ignore: cast_nullable_to_non_nullable
              as double,
      feeCharged: null == feeCharged
          ? _value.feeCharged
          : feeCharged // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingBreakdownImplCopyWith<$Res>
    implements $PricingBreakdownCopyWith<$Res> {
  factory _$$PricingBreakdownImplCopyWith(_$PricingBreakdownImpl value,
          $Res Function(_$PricingBreakdownImpl) then) =
      __$$PricingBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      String type,
      @JsonKey(name: 'buyers_pay_without_fees') double buyersPayWithoutFees,
      double revenue,
      @JsonKey(name: 'buyers_pay_with_fees') double buyersPayWithFees,
      @JsonKey(name: 'revenue_if_buyers_pay') double revenueIfBuyersPay,
      @JsonKey(name: 'fee_charged') double feeCharged});
}

/// @nodoc
class __$$PricingBreakdownImplCopyWithImpl<$Res>
    extends _$PricingBreakdownCopyWithImpl<$Res, _$PricingBreakdownImpl>
    implements _$$PricingBreakdownImplCopyWith<$Res> {
  __$$PricingBreakdownImplCopyWithImpl(_$PricingBreakdownImpl _value,
      $Res Function(_$PricingBreakdownImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
    Object? buyersPayWithoutFees = null,
    Object? revenue = null,
    Object? buyersPayWithFees = null,
    Object? revenueIfBuyersPay = null,
    Object? feeCharged = null,
  }) {
    return _then(_$PricingBreakdownImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      buyersPayWithoutFees: null == buyersPayWithoutFees
          ? _value.buyersPayWithoutFees
          : buyersPayWithoutFees // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      buyersPayWithFees: null == buyersPayWithFees
          ? _value.buyersPayWithFees
          : buyersPayWithFees // ignore: cast_nullable_to_non_nullable
              as double,
      revenueIfBuyersPay: null == revenueIfBuyersPay
          ? _value.revenueIfBuyersPay
          : revenueIfBuyersPay // ignore: cast_nullable_to_non_nullable
              as double,
      feeCharged: null == feeCharged
          ? _value.feeCharged
          : feeCharged // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PricingBreakdownImpl implements _PricingBreakdown {
  _$PricingBreakdownImpl(
      {this.amount = '0.00',
      this.type = kBookingPriceType,
      @JsonKey(name: 'buyers_pay_without_fees') this.buyersPayWithoutFees = 0,
      this.revenue = 0,
      @JsonKey(name: 'buyers_pay_with_fees') this.buyersPayWithFees = 0,
      @JsonKey(name: 'revenue_if_buyers_pay') this.revenueIfBuyersPay = 0,
      @JsonKey(name: 'fee_charged') this.feeCharged = 0});

  factory _$PricingBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingBreakdownImplFromJson(json);

  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey(name: 'buyers_pay_without_fees')
  final double buyersPayWithoutFees;
  @override
  @JsonKey()
  final double revenue;
  @override
  @JsonKey(name: 'buyers_pay_with_fees')
  final double buyersPayWithFees;
  @override
  @JsonKey(name: 'revenue_if_buyers_pay')
  final double revenueIfBuyersPay;
  @override
  @JsonKey(name: 'fee_charged')
  final double feeCharged;

  @override
  String toString() {
    return 'PricingBreakdown(amount: $amount, type: $type, buyersPayWithoutFees: $buyersPayWithoutFees, revenue: $revenue, buyersPayWithFees: $buyersPayWithFees, revenueIfBuyersPay: $revenueIfBuyersPay, feeCharged: $feeCharged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingBreakdownImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.buyersPayWithoutFees, buyersPayWithoutFees) ||
                other.buyersPayWithoutFees == buyersPayWithoutFees) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.buyersPayWithFees, buyersPayWithFees) ||
                other.buyersPayWithFees == buyersPayWithFees) &&
            (identical(other.revenueIfBuyersPay, revenueIfBuyersPay) ||
                other.revenueIfBuyersPay == revenueIfBuyersPay) &&
            (identical(other.feeCharged, feeCharged) ||
                other.feeCharged == feeCharged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      type,
      buyersPayWithoutFees,
      revenue,
      buyersPayWithFees,
      revenueIfBuyersPay,
      feeCharged);

  /// Create a copy of PricingBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingBreakdownImplCopyWith<_$PricingBreakdownImpl> get copyWith =>
      __$$PricingBreakdownImplCopyWithImpl<_$PricingBreakdownImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingBreakdownImplToJson(
      this,
    );
  }
}

abstract class _PricingBreakdown implements PricingBreakdown {
  factory _PricingBreakdown(
      {final String amount,
      final String type,
      @JsonKey(name: 'buyers_pay_without_fees')
      final double buyersPayWithoutFees,
      final double revenue,
      @JsonKey(name: 'buyers_pay_with_fees') final double buyersPayWithFees,
      @JsonKey(name: 'revenue_if_buyers_pay') final double revenueIfBuyersPay,
      @JsonKey(name: 'fee_charged')
      final double feeCharged}) = _$PricingBreakdownImpl;

  factory _PricingBreakdown.fromJson(Map<String, dynamic> json) =
      _$PricingBreakdownImpl.fromJson;

  @override
  String get amount;
  @override
  String get type;
  @override
  @JsonKey(name: 'buyers_pay_without_fees')
  double get buyersPayWithoutFees;
  @override
  double get revenue;
  @override
  @JsonKey(name: 'buyers_pay_with_fees')
  double get buyersPayWithFees;
  @override
  @JsonKey(name: 'revenue_if_buyers_pay')
  double get revenueIfBuyersPay;
  @override
  @JsonKey(name: 'fee_charged')
  double get feeCharged;

  /// Create a copy of PricingBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingBreakdownImplCopyWith<_$PricingBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
