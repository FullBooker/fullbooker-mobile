// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_type_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketTypeResponse _$TicketTypeResponseFromJson(Map<String, dynamic> json) {
  return _TicketTypeResponse.fromJson(json);
}

/// @nodoc
mixin _$TicketTypeResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<TicketType?>? get results => throw _privateConstructorUsedError;

  /// Serializes this TicketTypeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeResponseCopyWith<TicketTypeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeResponseCopyWith<$Res> {
  factory $TicketTypeResponseCopyWith(
          TicketTypeResponse value, $Res Function(TicketTypeResponse) then) =
      _$TicketTypeResponseCopyWithImpl<$Res, TicketTypeResponse>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<TicketType?>? results});
}

/// @nodoc
class _$TicketTypeResponseCopyWithImpl<$Res, $Val extends TicketTypeResponse>
    implements $TicketTypeResponseCopyWith<$Res> {
  _$TicketTypeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketTypeResponse
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
              as List<TicketType?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeResponseImplCopyWith<$Res>
    implements $TicketTypeResponseCopyWith<$Res> {
  factory _$$TicketTypeResponseImplCopyWith(_$TicketTypeResponseImpl value,
          $Res Function(_$TicketTypeResponseImpl) then) =
      __$$TicketTypeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<TicketType?>? results});
}

/// @nodoc
class __$$TicketTypeResponseImplCopyWithImpl<$Res>
    extends _$TicketTypeResponseCopyWithImpl<$Res, _$TicketTypeResponseImpl>
    implements _$$TicketTypeResponseImplCopyWith<$Res> {
  __$$TicketTypeResponseImplCopyWithImpl(_$TicketTypeResponseImpl _value,
      $Res Function(_$TicketTypeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$TicketTypeResponseImpl(
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
              as List<TicketType?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TicketTypeResponseImpl implements _TicketTypeResponse {
  _$TicketTypeResponseImpl(
      {this.count = 0, this.next, this.previous, this.results});

  factory _$TicketTypeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final List<TicketType?>? results;

  @override
  String toString() {
    return 'TicketTypeResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeResponseImpl &&
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

  /// Create a copy of TicketTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeResponseImplCopyWith<_$TicketTypeResponseImpl> get copyWith =>
      __$$TicketTypeResponseImplCopyWithImpl<_$TicketTypeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeResponseImplToJson(
      this,
    );
  }
}

abstract class _TicketTypeResponse implements TicketTypeResponse {
  factory _TicketTypeResponse(
      {final int count,
      final String? next,
      final String? previous,
      final List<TicketType?>? results}) = _$TicketTypeResponseImpl;

  factory _TicketTypeResponse.fromJson(Map<String, dynamic> json) =
      _$TicketTypeResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<TicketType?>? get results;

  /// Create a copy of TicketTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeResponseImplCopyWith<_$TicketTypeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
