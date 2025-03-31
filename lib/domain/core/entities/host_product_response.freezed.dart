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
  @JsonKey(name: 'results')
  List<HostProduct>? get results => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'results') List<HostProduct>? results});
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
              as List<HostProduct>?,
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
      @JsonKey(name: 'results') List<HostProduct>? results});
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
              as List<HostProduct>?,
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
      @JsonKey(name: 'results') this.results});

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
  @JsonKey(name: 'results')
  final List<HostProduct>? results;

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
          @JsonKey(name: 'results') final List<HostProduct>? results}) =
      _$HostProductResponseImpl;

  factory _HostProductResponse.fromJson(Map<String, dynamic> json) =
      _$HostProductResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(name: 'results')
  List<HostProduct>? get results;

  /// Create a copy of HostProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostProductResponseImplCopyWith<_$HostProductResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HostProduct _$HostProductFromJson(Map<String, dynamic> json) {
  return _HostProduct.fromJson(json);
}

/// @nodoc
mixin _$HostProduct {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  UserState get host => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get subcategory => throw _privateConstructorUsedError;
  Availability get availability => throw _privateConstructorUsedError;
  List<Pricing> get pricing => throw _privateConstructorUsedError;
  MediaFile? get image => throw _privateConstructorUsedError;
  dynamic get video => throw _privateConstructorUsedError;
  List<Location> get locations => throw _privateConstructorUsedError;

  /// Serializes this HostProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostProductCopyWith<HostProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostProductCopyWith<$Res> {
  factory $HostProductCopyWith(
          HostProduct value, $Res Function(HostProduct) then) =
      _$HostProductCopyWithImpl<$Res, HostProduct>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      UserState host,
      String name,
      String description,
      String number,
      String category,
      String subcategory,
      Availability availability,
      List<Pricing> pricing,
      MediaFile? image,
      dynamic video,
      List<Location> locations});

  $UserStateCopyWith<$Res> get host;
  $AvailabilityCopyWith<$Res> get availability;
  $MediaFileCopyWith<$Res>? get image;
}

/// @nodoc
class _$HostProductCopyWithImpl<$Res, $Val extends HostProduct>
    implements $HostProductCopyWith<$Res> {
  _$HostProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? name = null,
    Object? description = null,
    Object? number = null,
    Object? category = null,
    Object? subcategory = null,
    Object? availability = null,
    Object? pricing = null,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as UserState,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<Pricing>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as MediaFile?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ) as $Val);
  }

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get host {
    return $UserStateCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityCopyWith<$Res> get availability {
    return $AvailabilityCopyWith<$Res>(_value.availability, (value) {
      return _then(_value.copyWith(availability: value) as $Val);
    });
  }

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaFileCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $MediaFileCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostProductImplCopyWith<$Res>
    implements $HostProductCopyWith<$Res> {
  factory _$$HostProductImplCopyWith(
          _$HostProductImpl value, $Res Function(_$HostProductImpl) then) =
      __$$HostProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      UserState host,
      String name,
      String description,
      String number,
      String category,
      String subcategory,
      Availability availability,
      List<Pricing> pricing,
      MediaFile? image,
      dynamic video,
      List<Location> locations});

  @override
  $UserStateCopyWith<$Res> get host;
  @override
  $AvailabilityCopyWith<$Res> get availability;
  @override
  $MediaFileCopyWith<$Res>? get image;
}

/// @nodoc
class __$$HostProductImplCopyWithImpl<$Res>
    extends _$HostProductCopyWithImpl<$Res, _$HostProductImpl>
    implements _$$HostProductImplCopyWith<$Res> {
  __$$HostProductImplCopyWithImpl(
      _$HostProductImpl _value, $Res Function(_$HostProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? name = null,
    Object? description = null,
    Object? number = null,
    Object? category = null,
    Object? subcategory = null,
    Object? availability = null,
    Object? pricing = null,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = null,
  }) {
    return _then(_$HostProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as UserState,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability,
      pricing: null == pricing
          ? _value._pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<Pricing>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as MediaFile?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HostProductImpl implements _HostProduct {
  _$HostProductImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.active,
      required this.host,
      required this.name,
      required this.description,
      required this.number,
      required this.category,
      required this.subcategory,
      required this.availability,
      required final List<Pricing> pricing,
      this.image,
      this.video,
      required final List<Location> locations})
      : _pricing = pricing,
        _locations = locations;

  factory _$HostProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostProductImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final bool active;
  @override
  final UserState host;
  @override
  final String name;
  @override
  final String description;
  @override
  final String number;
  @override
  final String category;
  @override
  final String subcategory;
  @override
  final Availability availability;
  final List<Pricing> _pricing;
  @override
  List<Pricing> get pricing {
    if (_pricing is EqualUnmodifiableListView) return _pricing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pricing);
  }

  @override
  final MediaFile? image;
  @override
  final dynamic video;
  final List<Location> _locations;
  @override
  List<Location> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  String toString() {
    return 'HostProduct(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, name: $name, description: $description, number: $number, category: $category, subcategory: $subcategory, availability: $availability, pricing: $pricing, image: $image, video: $video, locations: $locations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            const DeepCollectionEquality().equals(other._pricing, _pricing) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      active,
      host,
      name,
      description,
      number,
      category,
      subcategory,
      availability,
      const DeepCollectionEquality().hash(_pricing),
      image,
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(_locations));

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostProductImplCopyWith<_$HostProductImpl> get copyWith =>
      __$$HostProductImplCopyWithImpl<_$HostProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostProductImplToJson(
      this,
    );
  }
}

abstract class _HostProduct implements HostProduct {
  factory _HostProduct(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final bool active,
      required final UserState host,
      required final String name,
      required final String description,
      required final String number,
      required final String category,
      required final String subcategory,
      required final Availability availability,
      required final List<Pricing> pricing,
      final MediaFile? image,
      final dynamic video,
      required final List<Location> locations}) = _$HostProductImpl;

  factory _HostProduct.fromJson(Map<String, dynamic> json) =
      _$HostProductImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  bool get active;
  @override
  UserState get host;
  @override
  String get name;
  @override
  String get description;
  @override
  String get number;
  @override
  String get category;
  @override
  String get subcategory;
  @override
  Availability get availability;
  @override
  List<Pricing> get pricing;
  @override
  MediaFile? get image;
  @override
  dynamic get video;
  @override
  List<Location> get locations;

  /// Create a copy of HostProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostProductImplCopyWith<_$HostProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return _Availability.fromJson(json);
}

/// @nodoc
mixin _$Availability {
  String get id => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates => throw _privateConstructorUsedError;

  /// Serializes this Availability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityCopyWith<Availability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityCopyWith<$Res> {
  factory $AvailabilityCopyWith(
          Availability value, $Res Function(Availability) then) =
      _$AvailabilityCopyWithImpl<$Res, Availability>;
  @useResult
  $Res call(
      {String id,
      String product,
      @JsonKey(name: 'product_name') String productName,
      String start,
      String end,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic> openDays,
      @JsonKey(name: 'closed_dates') List<dynamic> closedDates});
}

/// @nodoc
class _$AvailabilityCopyWithImpl<$Res, $Val extends Availability>
    implements $AvailabilityCopyWith<$Res> {
  _$AvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? productName = null,
    Object? start = null,
    Object? end = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = freezed,
    Object? openDays = null,
    Object? closedDates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: null == openDays
          ? _value.openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedDates: null == closedDates
          ? _value.closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityImplCopyWith<$Res>
    implements $AvailabilityCopyWith<$Res> {
  factory _$$AvailabilityImplCopyWith(
          _$AvailabilityImpl value, $Res Function(_$AvailabilityImpl) then) =
      __$$AvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String product,
      @JsonKey(name: 'product_name') String productName,
      String start,
      String end,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int? duration,
      @JsonKey(name: 'open_days') List<dynamic> openDays,
      @JsonKey(name: 'closed_dates') List<dynamic> closedDates});
}

/// @nodoc
class __$$AvailabilityImplCopyWithImpl<$Res>
    extends _$AvailabilityCopyWithImpl<$Res, _$AvailabilityImpl>
    implements _$$AvailabilityImplCopyWith<$Res> {
  __$$AvailabilityImplCopyWithImpl(
      _$AvailabilityImpl _value, $Res Function(_$AvailabilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? productName = null,
    Object? start = null,
    Object? end = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = freezed,
    Object? openDays = null,
    Object? closedDates = null,
  }) {
    return _then(_$AvailabilityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      openDays: null == openDays
          ? _value._openDays
          : openDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      closedDates: null == closedDates
          ? _value._closedDates
          : closedDates // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityImpl implements _Availability {
  _$AvailabilityImpl(
      {required this.id,
      required this.product,
      @JsonKey(name: 'product_name') required this.productName,
      required this.start,
      required this.end,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.duration,
      @JsonKey(name: 'open_days')
      final List<dynamic> openDays = const <dynamic>[],
      @JsonKey(name: 'closed_dates')
      final List<dynamic> closedDates = const <dynamic>[]})
      : _openDays = openDays,
        _closedDates = closedDates;

  factory _$AvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityImplFromJson(json);

  @override
  final String id;
  @override
  final String product;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final String start;
  @override
  final String end;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final int? duration;
  final List<dynamic> _openDays;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays {
    if (_openDays is EqualUnmodifiableListView) return _openDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openDays);
  }

  final List<dynamic> _closedDates;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates {
    if (_closedDates is EqualUnmodifiableListView) return _closedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closedDates);
  }

  @override
  String toString() {
    return 'Availability(id: $id, product: $product, productName: $productName, start: $start, end: $end, startTime: $startTime, endTime: $endTime, duration: $duration, openDays: $openDays, closedDates: $closedDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._openDays, _openDays) &&
            const DeepCollectionEquality()
                .equals(other._closedDates, _closedDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      product,
      productName,
      start,
      end,
      startTime,
      endTime,
      duration,
      const DeepCollectionEquality().hash(_openDays),
      const DeepCollectionEquality().hash(_closedDates));

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityImplCopyWith<_$AvailabilityImpl> get copyWith =>
      __$$AvailabilityImplCopyWithImpl<_$AvailabilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityImplToJson(
      this,
    );
  }
}

abstract class _Availability implements Availability {
  factory _Availability(
          {required final String id,
          required final String product,
          @JsonKey(name: 'product_name') required final String productName,
          required final String start,
          required final String end,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime,
          final int? duration,
          @JsonKey(name: 'open_days') final List<dynamic> openDays,
          @JsonKey(name: 'closed_dates') final List<dynamic> closedDates}) =
      _$AvailabilityImpl;

  factory _Availability.fromJson(Map<String, dynamic> json) =
      _$AvailabilityImpl.fromJson;

  @override
  String get id;
  @override
  String get product;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  String get start;
  @override
  String get end;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'open_days')
  List<dynamic> get openDays;
  @override
  @JsonKey(name: 'closed_dates')
  List<dynamic> get closedDates;

  /// Create a copy of Availability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityImplCopyWith<_$AvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pricing _$PricingFromJson(Map<String, dynamic> json) {
  return _Pricing.fromJson(json);
}

/// @nodoc
mixin _$Pricing {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get cost => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_tier')
  String get ticketTier => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum_number_of_tickets')
  int get maxTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_tickets')
  int get remainingTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'sold_tickets')
  int get soldTickets => throw _privateConstructorUsedError;

  /// Serializes this Pricing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingCopyWith<Pricing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingCopyWith<$Res> {
  factory $PricingCopyWith(Pricing value, $Res Function(Pricing) then) =
      _$PricingCopyWithImpl<$Res, Pricing>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String? name,
      String product,
      String currency,
      String cost,
      String type,
      @JsonKey(name: 'ticket_tier') String ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') int maxTickets,
      @JsonKey(name: 'remaining_tickets') int remainingTickets,
      @JsonKey(name: 'sold_tickets') int soldTickets});
}

/// @nodoc
class _$PricingCopyWithImpl<$Res, $Val extends Pricing>
    implements $PricingCopyWith<$Res> {
  _$PricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? name = freezed,
    Object? product = null,
    Object? currency = null,
    Object? cost = null,
    Object? type = null,
    Object? ticketTier = null,
    Object? maxTickets = null,
    Object? remainingTickets = null,
    Object? soldTickets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTier: null == ticketTier
          ? _value.ticketTier
          : ticketTier // ignore: cast_nullable_to_non_nullable
              as String,
      maxTickets: null == maxTickets
          ? _value.maxTickets
          : maxTickets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTickets: null == remainingTickets
          ? _value.remainingTickets
          : remainingTickets // ignore: cast_nullable_to_non_nullable
              as int,
      soldTickets: null == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingImplCopyWith<$Res> implements $PricingCopyWith<$Res> {
  factory _$$PricingImplCopyWith(
          _$PricingImpl value, $Res Function(_$PricingImpl) then) =
      __$$PricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String? name,
      String product,
      String currency,
      String cost,
      String type,
      @JsonKey(name: 'ticket_tier') String ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') int maxTickets,
      @JsonKey(name: 'remaining_tickets') int remainingTickets,
      @JsonKey(name: 'sold_tickets') int soldTickets});
}

/// @nodoc
class __$$PricingImplCopyWithImpl<$Res>
    extends _$PricingCopyWithImpl<$Res, _$PricingImpl>
    implements _$$PricingImplCopyWith<$Res> {
  __$$PricingImplCopyWithImpl(
      _$PricingImpl _value, $Res Function(_$PricingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? name = freezed,
    Object? product = null,
    Object? currency = null,
    Object? cost = null,
    Object? type = null,
    Object? ticketTier = null,
    Object? maxTickets = null,
    Object? remainingTickets = null,
    Object? soldTickets = null,
  }) {
    return _then(_$PricingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTier: null == ticketTier
          ? _value.ticketTier
          : ticketTier // ignore: cast_nullable_to_non_nullable
              as String,
      maxTickets: null == maxTickets
          ? _value.maxTickets
          : maxTickets // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTickets: null == remainingTickets
          ? _value.remainingTickets
          : remainingTickets // ignore: cast_nullable_to_non_nullable
              as int,
      soldTickets: null == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PricingImpl implements _Pricing {
  _$PricingImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.active,
      required this.host,
      this.name,
      required this.product,
      required this.currency,
      required this.cost,
      required this.type,
      @JsonKey(name: 'ticket_tier') required this.ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') required this.maxTickets,
      @JsonKey(name: 'remaining_tickets') required this.remainingTickets,
      @JsonKey(name: 'sold_tickets') required this.soldTickets});

  factory _$PricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final bool active;
  @override
  final String host;
  @override
  final String? name;
  @override
  final String product;
  @override
  final String currency;
  @override
  final String cost;
  @override
  final String type;
  @override
  @JsonKey(name: 'ticket_tier')
  final String ticketTier;
  @override
  @JsonKey(name: 'maximum_number_of_tickets')
  final int maxTickets;
  @override
  @JsonKey(name: 'remaining_tickets')
  final int remainingTickets;
  @override
  @JsonKey(name: 'sold_tickets')
  final int soldTickets;

  @override
  String toString() {
    return 'Pricing(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, name: $name, product: $product, currency: $currency, cost: $cost, type: $type, ticketTier: $ticketTier, maxTickets: $maxTickets, remainingTickets: $remainingTickets, soldTickets: $soldTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ticketTier, ticketTier) ||
                other.ticketTier == ticketTier) &&
            (identical(other.maxTickets, maxTickets) ||
                other.maxTickets == maxTickets) &&
            (identical(other.remainingTickets, remainingTickets) ||
                other.remainingTickets == remainingTickets) &&
            (identical(other.soldTickets, soldTickets) ||
                other.soldTickets == soldTickets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      active,
      host,
      name,
      product,
      currency,
      cost,
      type,
      ticketTier,
      maxTickets,
      remainingTickets,
      soldTickets);

  /// Create a copy of Pricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingImplCopyWith<_$PricingImpl> get copyWith =>
      __$$PricingImplCopyWithImpl<_$PricingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingImplToJson(
      this,
    );
  }
}

abstract class _Pricing implements Pricing {
  factory _Pricing(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final bool active,
      required final String host,
      final String? name,
      required final String product,
      required final String currency,
      required final String cost,
      required final String type,
      @JsonKey(name: 'ticket_tier') required final String ticketTier,
      @JsonKey(name: 'maximum_number_of_tickets') required final int maxTickets,
      @JsonKey(name: 'remaining_tickets') required final int remainingTickets,
      @JsonKey(name: 'sold_tickets')
      required final int soldTickets}) = _$PricingImpl;

  factory _Pricing.fromJson(Map<String, dynamic> json) = _$PricingImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  bool get active;
  @override
  String get host;
  @override
  String? get name;
  @override
  String get product;
  @override
  String get currency;
  @override
  String get cost;
  @override
  String get type;
  @override
  @JsonKey(name: 'ticket_tier')
  String get ticketTier;
  @override
  @JsonKey(name: 'maximum_number_of_tickets')
  int get maxTickets;
  @override
  @JsonKey(name: 'remaining_tickets')
  int get remainingTickets;
  @override
  @JsonKey(name: 'sold_tickets')
  int get soldTickets;

  /// Create a copy of Pricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingImplCopyWith<_$PricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaFile _$MediaFileFromJson(Map<String, dynamic> json) {
  return _MediaFile.fromJson(json);
}

/// @nodoc
mixin _$MediaFile {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String get mediaType => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  String get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this MediaFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaFileCopyWith<MediaFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaFileCopyWith<$Res> {
  factory $MediaFileCopyWith(MediaFile value, $Res Function(MediaFile) then) =
      _$MediaFileCopyWithImpl<$Res, MediaFile>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      @JsonKey(name: 'media_type') String mediaType,
      String file,
      @JsonKey(name: 'uploaded_at') String uploadedAt});
}

/// @nodoc
class _$MediaFileCopyWithImpl<$Res, $Val extends MediaFile>
    implements $MediaFileCopyWith<$Res> {
  _$MediaFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? mediaType = null,
    Object? file = null,
    Object? uploadedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaFileImplCopyWith<$Res>
    implements $MediaFileCopyWith<$Res> {
  factory _$$MediaFileImplCopyWith(
          _$MediaFileImpl value, $Res Function(_$MediaFileImpl) then) =
      __$$MediaFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      @JsonKey(name: 'media_type') String mediaType,
      String file,
      @JsonKey(name: 'uploaded_at') String uploadedAt});
}

/// @nodoc
class __$$MediaFileImplCopyWithImpl<$Res>
    extends _$MediaFileCopyWithImpl<$Res, _$MediaFileImpl>
    implements _$$MediaFileImplCopyWith<$Res> {
  __$$MediaFileImplCopyWithImpl(
      _$MediaFileImpl _value, $Res Function(_$MediaFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? mediaType = null,
    Object? file = null,
    Object? uploadedAt = null,
  }) {
    return _then(_$MediaFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaFileImpl implements _MediaFile {
  _$MediaFileImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.active,
      required this.host,
      @JsonKey(name: 'media_type') required this.mediaType,
      required this.file,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt});

  factory _$MediaFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaFileImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final bool active;
  @override
  final String host;
  @override
  @JsonKey(name: 'media_type')
  final String mediaType;
  @override
  final String file;
  @override
  @JsonKey(name: 'uploaded_at')
  final String uploadedAt;

  @override
  String toString() {
    return 'MediaFile(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, mediaType: $mediaType, file: $file, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, active,
      host, mediaType, file, uploadedAt);

  /// Create a copy of MediaFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaFileImplCopyWith<_$MediaFileImpl> get copyWith =>
      __$$MediaFileImplCopyWithImpl<_$MediaFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaFileImplToJson(
      this,
    );
  }
}

abstract class _MediaFile implements MediaFile {
  factory _MediaFile(
          {required final String id,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt,
          required final bool active,
          required final String host,
          @JsonKey(name: 'media_type') required final String mediaType,
          required final String file,
          @JsonKey(name: 'uploaded_at') required final String uploadedAt}) =
      _$MediaFileImpl;

  factory _MediaFile.fromJson(Map<String, dynamic> json) =
      _$MediaFileImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  bool get active;
  @override
  String get host;
  @override
  @JsonKey(name: 'media_type')
  String get mediaType;
  @override
  String get file;
  @override
  @JsonKey(name: 'uploaded_at')
  String get uploadedAt;

  /// Create a copy of MediaFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaFileImplCopyWith<_$MediaFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  String get coordinates => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String product,
      String coordinates,
      String address});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? product = null,
    Object? coordinates = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      bool active,
      String host,
      String product,
      String coordinates,
      String address});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? active = null,
    Object? host = null,
    Object? product = null,
    Object? coordinates = null,
    Object? address = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  _$LocationImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.active,
      required this.host,
      required this.product,
      required this.coordinates,
      required this.address});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final bool active;
  @override
  final String host;
  @override
  final String product;
  @override
  final String coordinates;
  @override
  final String address;

  @override
  String toString() {
    return 'Location(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, product: $product, coordinates: $coordinates, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, active,
      host, product, coordinates, address);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  factory _Location(
      {required final String id,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final bool active,
      required final String host,
      required final String product,
      required final String coordinates,
      required final String address}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  bool get active;
  @override
  String get host;
  @override
  String get product;
  @override
  String get coordinates;
  @override
  String get address;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
