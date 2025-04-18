// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) {
  return _CurrencyResponse.fromJson(json);
}

/// @nodoc
mixin _$CurrencyResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Currency?>? get results => throw _privateConstructorUsedError;

  /// Serializes this CurrencyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyResponseCopyWith<CurrencyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyResponseCopyWith<$Res> {
  factory $CurrencyResponseCopyWith(
          CurrencyResponse value, $Res Function(CurrencyResponse) then) =
      _$CurrencyResponseCopyWithImpl<$Res, CurrencyResponse>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Currency?>? results});
}

/// @nodoc
class _$CurrencyResponseCopyWithImpl<$Res, $Val extends CurrencyResponse>
    implements $CurrencyResponseCopyWith<$Res> {
  _$CurrencyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyResponse
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
              as List<Currency?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyResponseImplCopyWith<$Res>
    implements $CurrencyResponseCopyWith<$Res> {
  factory _$$CurrencyResponseImplCopyWith(_$CurrencyResponseImpl value,
          $Res Function(_$CurrencyResponseImpl) then) =
      __$$CurrencyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Currency?>? results});
}

/// @nodoc
class __$$CurrencyResponseImplCopyWithImpl<$Res>
    extends _$CurrencyResponseCopyWithImpl<$Res, _$CurrencyResponseImpl>
    implements _$$CurrencyResponseImplCopyWith<$Res> {
  __$$CurrencyResponseImplCopyWithImpl(_$CurrencyResponseImpl _value,
      $Res Function(_$CurrencyResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$CurrencyResponseImpl(
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
              as List<Currency?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CurrencyResponseImpl implements _CurrencyResponse {
  _$CurrencyResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$CurrencyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<Currency?>? results;

  @override
  String toString() {
    return 'CurrencyResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyResponseImpl &&
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

  /// Create a copy of CurrencyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyResponseImplCopyWith<_$CurrencyResponseImpl> get copyWith =>
      __$$CurrencyResponseImplCopyWithImpl<_$CurrencyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyResponseImplToJson(
      this,
    );
  }
}

abstract class _CurrencyResponse implements CurrencyResponse {
  factory _CurrencyResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<Currency?>? results}) = _$CurrencyResponseImpl;

  factory _CurrencyResponse.fromJson(Map<String, dynamic> json) =
      _$CurrencyResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Currency?>? get results;

  /// Create a copy of CurrencyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyResponseImplCopyWith<_$CurrencyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
