// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_option_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingOptionResponse _$PricingOptionResponseFromJson(
    Map<String, dynamic> json) {
  return _PricingOptionResponse.fromJson(json);
}

/// @nodoc
mixin _$PricingOptionResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PricingOption?>? get results => throw _privateConstructorUsedError;

  /// Serializes this PricingOptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingOptionResponseCopyWith<PricingOptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingOptionResponseCopyWith<$Res> {
  factory $PricingOptionResponseCopyWith(PricingOptionResponse value,
          $Res Function(PricingOptionResponse) then) =
      _$PricingOptionResponseCopyWithImpl<$Res, PricingOptionResponse>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PricingOption?>? results});
}

/// @nodoc
class _$PricingOptionResponseCopyWithImpl<$Res,
        $Val extends PricingOptionResponse>
    implements $PricingOptionResponseCopyWith<$Res> {
  _$PricingOptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingOptionResponse
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
              as List<PricingOption?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingOptionResponseImplCopyWith<$Res>
    implements $PricingOptionResponseCopyWith<$Res> {
  factory _$$PricingOptionResponseImplCopyWith(
          _$PricingOptionResponseImpl value,
          $Res Function(_$PricingOptionResponseImpl) then) =
      __$$PricingOptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PricingOption?>? results});
}

/// @nodoc
class __$$PricingOptionResponseImplCopyWithImpl<$Res>
    extends _$PricingOptionResponseCopyWithImpl<$Res,
        _$PricingOptionResponseImpl>
    implements _$$PricingOptionResponseImplCopyWith<$Res> {
  __$$PricingOptionResponseImplCopyWithImpl(_$PricingOptionResponseImpl _value,
      $Res Function(_$PricingOptionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$PricingOptionResponseImpl(
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
              as List<PricingOption?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PricingOptionResponseImpl implements _PricingOptionResponse {
  _$PricingOptionResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$PricingOptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingOptionResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<PricingOption?>? results;

  @override
  String toString() {
    return 'PricingOptionResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingOptionResponseImpl &&
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

  /// Create a copy of PricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingOptionResponseImplCopyWith<_$PricingOptionResponseImpl>
      get copyWith => __$$PricingOptionResponseImplCopyWithImpl<
          _$PricingOptionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingOptionResponseImplToJson(
      this,
    );
  }
}

abstract class _PricingOptionResponse implements PricingOptionResponse {
  factory _PricingOptionResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<PricingOption?>? results}) = _$PricingOptionResponseImpl;

  factory _PricingOptionResponse.fromJson(Map<String, dynamic> json) =
      _$PricingOptionResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PricingOption?>? get results;

  /// Create a copy of PricingOptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingOptionResponseImplCopyWith<_$PricingOptionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
