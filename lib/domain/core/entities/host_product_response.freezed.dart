// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HostProductResponse _$HostProductResponseFromJson(Map<String, dynamic> json) {
  return _HostProductResponse.fromJson(json);
}

/// @nodoc
mixin _$HostProductResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(fromJson: productsFromApiJson)
  List<Product?>? get results => throw _privateConstructorUsedError;

  /// Serializes this HostProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostProductResponseCopyWith<HostProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostProductResponseCopyWith<$Res> {
  factory $HostProductResponseCopyWith(
          HostProductResponse value, $Res Function(HostProductResponse) then) =
      _$HostProductResponseCopyWithImpl<$Res, HostProductResponse>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      @JsonKey(fromJson: productsFromApiJson) List<Product?>? results});
}

/// @nodoc
class _$HostProductResponseCopyWithImpl<$Res, $Val extends HostProductResponse>
    implements $HostProductResponseCopyWith<$Res> {
  _$HostProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostProductResponse
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
              as List<Product?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HostProductResponseImplCopyWith<$Res>
    implements $HostProductResponseCopyWith<$Res> {
  factory _$$HostProductResponseImplCopyWith(_$HostProductResponseImpl value,
          $Res Function(_$HostProductResponseImpl) then) =
      __$$HostProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      @JsonKey(fromJson: productsFromApiJson) List<Product?>? results});
}

/// @nodoc
class __$$HostProductResponseImplCopyWithImpl<$Res>
    extends _$HostProductResponseCopyWithImpl<$Res, _$HostProductResponseImpl>
    implements _$$HostProductResponseImplCopyWith<$Res> {
  __$$HostProductResponseImplCopyWithImpl(_$HostProductResponseImpl _value,
      $Res Function(_$HostProductResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$HostProductResponseImpl(
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
              as List<Product?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HostProductResponseImpl implements _HostProductResponse {
  _$HostProductResponseImpl(
      {this.count = 0,
      this.next,
      this.previous,
      @JsonKey(fromJson: productsFromApiJson) this.results});

  factory _$HostProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostProductResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey(fromJson: productsFromApiJson)
  final List<Product?>? results;

  @override
  String toString() {
    return 'HostProductResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostProductResponseImpl &&
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

  /// Create a copy of HostProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostProductResponseImplCopyWith<_$HostProductResponseImpl> get copyWith =>
      __$$HostProductResponseImplCopyWithImpl<_$HostProductResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostProductResponseImplToJson(
      this,
    );
  }
}

abstract class _HostProductResponse implements HostProductResponse {
  factory _HostProductResponse(
      {final int count,
      final String? next,
      final String? previous,
      @JsonKey(fromJson: productsFromApiJson)
      final List<Product?>? results}) = _$HostProductResponseImpl;

  factory _HostProductResponse.fromJson(Map<String, dynamic> json) =
      _$HostProductResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(fromJson: productsFromApiJson)
  List<Product?>? get results;

  /// Create a copy of HostProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostProductResponseImplCopyWith<_$HostProductResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
