// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  UserState? get host => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  String? get subcategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'subcategory_name')
  String? get subcategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  String? get scheduleID => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule')
  ProductSchedule? get schedule => throw _privateConstructorUsedError;
  List<ProductPricing?>? get pricing => throw _privateConstructorUsedError;
  List<ProductPricingOption?>? get pricingOptions =>
      throw _privateConstructorUsedError;
  ProductMedia? get image => throw _privateConstructorUsedError;
  ProductMedia? get video => throw _privateConstructorUsedError;
  List<ProductLocation>? get locations => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'images_count')
  int? get imageCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'videos_count')
  int? get videoCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_accepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_and_conditions_id')
  String? get termsID => throw _privateConstructorUsedError;

  /// Temp values used when creating a product
  List<ProductMedia?>? get photos => throw _privateConstructorUsedError;
  List<ProductMedia?>? get videos => throw _privateConstructorUsedError;
  List<Booking?>? get bookings => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: true, includeToJson: true)
  ProductCategory? get selectedProductCategory =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: true, includeToJson: true)
  ProductCategory? get selectedProductSubCategory =>
      throw _privateConstructorUsedError;
  ProductStats? get stats => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      UserState? host,
      String? name,
      String? description,
      String? number,
      String? category,
      @JsonKey(name: 'category_name') String? categoryName,
      String? subcategory,
      @JsonKey(name: 'subcategory_name') String? subcategoryName,
      @JsonKey(name: 'schedule_id') String? scheduleID,
      @JsonKey(name: 'schedule') ProductSchedule? schedule,
      List<ProductPricing?>? pricing,
      List<ProductPricingOption?>? pricingOptions,
      ProductMedia? image,
      ProductMedia? video,
      List<ProductLocation>? locations,
      bool? completed,
      @JsonKey(name: 'images_count') int? imageCount,
      @JsonKey(name: 'videos_count') int? videoCount,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'terms_accepted') bool? termsAccepted,
      @JsonKey(name: 'terms_and_conditions_id') String? termsID,
      List<ProductMedia?>? photos,
      List<ProductMedia?>? videos,
      List<Booking?>? bookings,
      @JsonKey(includeFromJson: true, includeToJson: true)
      ProductCategory? selectedProductCategory,
      @JsonKey(includeFromJson: true, includeToJson: true)
      ProductCategory? selectedProductSubCategory,
      ProductStats? stats});

  $UserStateCopyWith<$Res>? get host;
  $ProductScheduleCopyWith<$Res>? get schedule;
  $ProductMediaCopyWith<$Res>? get image;
  $ProductMediaCopyWith<$Res>? get video;
  $ProductCategoryCopyWith<$Res>? get selectedProductCategory;
  $ProductCategoryCopyWith<$Res>? get selectedProductSubCategory;
  $ProductStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? number = freezed,
    Object? category = freezed,
    Object? categoryName = freezed,
    Object? subcategory = freezed,
    Object? subcategoryName = freezed,
    Object? scheduleID = freezed,
    Object? schedule = freezed,
    Object? pricing = freezed,
    Object? pricingOptions = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = freezed,
    Object? completed = freezed,
    Object? imageCount = freezed,
    Object? videoCount = freezed,
    Object? status = freezed,
    Object? termsAccepted = freezed,
    Object? termsID = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? bookings = freezed,
    Object? selectedProductCategory = freezed,
    Object? selectedProductSubCategory = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as UserState?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategoryName: freezed == subcategoryName
          ? _value.subcategoryName
          : subcategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleID: freezed == scheduleID
          ? _value.scheduleID
          : scheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ProductSchedule?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<ProductPricing?>?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductPricingOption?>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductMedia?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as ProductMedia?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ProductLocation>?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      videoCount: freezed == videoCount
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsID: freezed == termsID
          ? _value.termsID
          : termsID // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
      bookings: freezed == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<Booking?>?,
      selectedProductCategory: freezed == selectedProductCategory
          ? _value.selectedProductCategory
          : selectedProductCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      selectedProductSubCategory: freezed == selectedProductSubCategory
          ? _value.selectedProductSubCategory
          : selectedProductSubCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ProductStats?,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res>? get host {
    if (_value.host == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.host!, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ProductScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductMediaCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ProductMediaCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductMediaCopyWith<$Res>? get video {
    if (_value.video == null) {
      return null;
    }

    return $ProductMediaCopyWith<$Res>(_value.video!, (value) {
      return _then(_value.copyWith(video: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCategoryCopyWith<$Res>? get selectedProductCategory {
    if (_value.selectedProductCategory == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.selectedProductCategory!,
        (value) {
      return _then(_value.copyWith(selectedProductCategory: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCategoryCopyWith<$Res>? get selectedProductSubCategory {
    if (_value.selectedProductSubCategory == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.selectedProductSubCategory!,
        (value) {
      return _then(_value.copyWith(selectedProductSubCategory: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $ProductStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      bool? active,
      UserState? host,
      String? name,
      String? description,
      String? number,
      String? category,
      @JsonKey(name: 'category_name') String? categoryName,
      String? subcategory,
      @JsonKey(name: 'subcategory_name') String? subcategoryName,
      @JsonKey(name: 'schedule_id') String? scheduleID,
      @JsonKey(name: 'schedule') ProductSchedule? schedule,
      List<ProductPricing?>? pricing,
      List<ProductPricingOption?>? pricingOptions,
      ProductMedia? image,
      ProductMedia? video,
      List<ProductLocation>? locations,
      bool? completed,
      @JsonKey(name: 'images_count') int? imageCount,
      @JsonKey(name: 'videos_count') int? videoCount,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'terms_accepted') bool? termsAccepted,
      @JsonKey(name: 'terms_and_conditions_id') String? termsID,
      List<ProductMedia?>? photos,
      List<ProductMedia?>? videos,
      List<Booking?>? bookings,
      @JsonKey(includeFromJson: true, includeToJson: true)
      ProductCategory? selectedProductCategory,
      @JsonKey(includeFromJson: true, includeToJson: true)
      ProductCategory? selectedProductSubCategory,
      ProductStats? stats});

  @override
  $UserStateCopyWith<$Res>? get host;
  @override
  $ProductScheduleCopyWith<$Res>? get schedule;
  @override
  $ProductMediaCopyWith<$Res>? get image;
  @override
  $ProductMediaCopyWith<$Res>? get video;
  @override
  $ProductCategoryCopyWith<$Res>? get selectedProductCategory;
  @override
  $ProductCategoryCopyWith<$Res>? get selectedProductSubCategory;
  @override
  $ProductStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? active = freezed,
    Object? host = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? number = freezed,
    Object? category = freezed,
    Object? categoryName = freezed,
    Object? subcategory = freezed,
    Object? subcategoryName = freezed,
    Object? scheduleID = freezed,
    Object? schedule = freezed,
    Object? pricing = freezed,
    Object? pricingOptions = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = freezed,
    Object? completed = freezed,
    Object? imageCount = freezed,
    Object? videoCount = freezed,
    Object? status = freezed,
    Object? termsAccepted = freezed,
    Object? termsID = freezed,
    Object? photos = freezed,
    Object? videos = freezed,
    Object? bookings = freezed,
    Object? selectedProductCategory = freezed,
    Object? selectedProductSubCategory = freezed,
    Object? stats = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as UserState?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategoryName: freezed == subcategoryName
          ? _value.subcategoryName
          : subcategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleID: freezed == scheduleID
          ? _value.scheduleID
          : scheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ProductSchedule?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<ProductPricing?>?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as List<ProductPricingOption?>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductMedia?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as ProductMedia?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ProductLocation>?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      videoCount: freezed == videoCount
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsID: freezed == termsID
          ? _value.termsID
          : termsID // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<ProductMedia?>?,
      bookings: freezed == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<Booking?>?,
      selectedProductCategory: freezed == selectedProductCategory
          ? _value.selectedProductCategory
          : selectedProductCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      selectedProductSubCategory: freezed == selectedProductSubCategory
          ? _value.selectedProductSubCategory
          : selectedProductSubCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ProductStats?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {this.id = UNKNOWN,
      @JsonKey(name: 'created_at') this.createdAt = UNKNOWN,
      @JsonKey(name: 'updated_at') this.updatedAt = UNKNOWN,
      this.active = false,
      required this.host,
      this.name = UNKNOWN,
      this.description = UNKNOWN,
      this.number = UNKNOWN,
      this.category = UNKNOWN,
      @JsonKey(name: 'category_name') this.categoryName = UNKNOWN,
      this.subcategory = UNKNOWN,
      @JsonKey(name: 'subcategory_name') this.subcategoryName = UNKNOWN,
      @JsonKey(name: 'schedule_id') this.scheduleID = UNKNOWN,
      @JsonKey(name: 'schedule') this.schedule,
      this.pricing = const <ProductPricing>[],
      this.pricingOptions = const <ProductPricingOption>[],
      this.image,
      this.video,
      this.locations = const <ProductLocation>[],
      this.completed = false,
      @JsonKey(name: 'images_count') this.imageCount = 0,
      @JsonKey(name: 'videos_count') this.videoCount = 0,
      @JsonKey(name: 'status') this.status = 'DRAFT',
      @JsonKey(name: 'terms_accepted') this.termsAccepted = false,
      @JsonKey(name: 'terms_and_conditions_id') this.termsID = UNKNOWN,
      this.photos = const <ProductMedia>[],
      this.videos = const <ProductMedia>[],
      this.bookings = const <Booking>[],
      @JsonKey(includeFromJson: true, includeToJson: true)
      this.selectedProductCategory,
      @JsonKey(includeFromJson: true, includeToJson: true)
      this.selectedProductSubCategory,
      this.stats});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey()
  final bool? active;
  @override
  final UserState? host;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? number;
  @override
  @JsonKey()
  final String? category;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey()
  final String? subcategory;
  @override
  @JsonKey(name: 'subcategory_name')
  final String? subcategoryName;
  @override
  @JsonKey(name: 'schedule_id')
  final String? scheduleID;
  @override
  @JsonKey(name: 'schedule')
  final ProductSchedule? schedule;
  @override
  @JsonKey()
  final List<ProductPricing?>? pricing;
  @override
  @JsonKey()
  final List<ProductPricingOption?>? pricingOptions;
  @override
  final ProductMedia? image;
  @override
  final ProductMedia? video;
  @override
  @JsonKey()
  final List<ProductLocation>? locations;
  @override
  @JsonKey()
  final bool? completed;
  @override
  @JsonKey(name: 'images_count')
  final int? imageCount;
  @override
  @JsonKey(name: 'videos_count')
  final int? videoCount;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'terms_accepted')
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'terms_and_conditions_id')
  final String? termsID;

  /// Temp values used when creating a product
  @override
  @JsonKey()
  final List<ProductMedia?>? photos;
  @override
  @JsonKey()
  final List<ProductMedia?>? videos;
  @override
  @JsonKey()
  final List<Booking?>? bookings;
  @override
  @JsonKey(includeFromJson: true, includeToJson: true)
  final ProductCategory? selectedProductCategory;
  @override
  @JsonKey(includeFromJson: true, includeToJson: true)
  final ProductCategory? selectedProductSubCategory;
  @override
  final ProductStats? stats;

  @override
  String toString() {
    return 'Product(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, name: $name, description: $description, number: $number, category: $category, categoryName: $categoryName, subcategory: $subcategory, subcategoryName: $subcategoryName, scheduleID: $scheduleID, schedule: $schedule, pricing: $pricing, pricingOptions: $pricingOptions, image: $image, video: $video, locations: $locations, completed: $completed, imageCount: $imageCount, videoCount: $videoCount, status: $status, termsAccepted: $termsAccepted, termsID: $termsID, photos: $photos, videos: $videos, bookings: $bookings, selectedProductCategory: $selectedProductCategory, selectedProductSubCategory: $selectedProductSubCategory, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
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
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.subcategoryName, subcategoryName) ||
                other.subcategoryName == subcategoryName) &&
            (identical(other.scheduleID, scheduleID) ||
                other.scheduleID == scheduleID) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality().equals(other.pricing, pricing) &&
            const DeepCollectionEquality()
                .equals(other.pricingOptions, pricingOptions) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video) &&
            const DeepCollectionEquality().equals(other.locations, locations) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.videoCount, videoCount) ||
                other.videoCount == videoCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.termsAccepted, termsAccepted) ||
                other.termsAccepted == termsAccepted) &&
            (identical(other.termsID, termsID) || other.termsID == termsID) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            const DeepCollectionEquality().equals(other.videos, videos) &&
            const DeepCollectionEquality().equals(other.bookings, bookings) &&
            (identical(
                    other.selectedProductCategory, selectedProductCategory) ||
                other.selectedProductCategory == selectedProductCategory) &&
            (identical(other.selectedProductSubCategory,
                    selectedProductSubCategory) ||
                other.selectedProductSubCategory ==
                    selectedProductSubCategory) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        categoryName,
        subcategory,
        subcategoryName,
        scheduleID,
        schedule,
        const DeepCollectionEquality().hash(pricing),
        const DeepCollectionEquality().hash(pricingOptions),
        image,
        video,
        const DeepCollectionEquality().hash(locations),
        completed,
        imageCount,
        videoCount,
        status,
        termsAccepted,
        termsID,
        const DeepCollectionEquality().hash(photos),
        const DeepCollectionEquality().hash(videos),
        const DeepCollectionEquality().hash(bookings),
        selectedProductCategory,
        selectedProductSubCategory,
        stats
      ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {final String? id,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final bool? active,
      required final UserState? host,
      final String? name,
      final String? description,
      final String? number,
      final String? category,
      @JsonKey(name: 'category_name') final String? categoryName,
      final String? subcategory,
      @JsonKey(name: 'subcategory_name') final String? subcategoryName,
      @JsonKey(name: 'schedule_id') final String? scheduleID,
      @JsonKey(name: 'schedule') final ProductSchedule? schedule,
      final List<ProductPricing?>? pricing,
      final List<ProductPricingOption?>? pricingOptions,
      final ProductMedia? image,
      final ProductMedia? video,
      final List<ProductLocation>? locations,
      final bool? completed,
      @JsonKey(name: 'images_count') final int? imageCount,
      @JsonKey(name: 'videos_count') final int? videoCount,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'terms_accepted') final bool? termsAccepted,
      @JsonKey(name: 'terms_and_conditions_id') final String? termsID,
      final List<ProductMedia?>? photos,
      final List<ProductMedia?>? videos,
      final List<Booking?>? bookings,
      @JsonKey(includeFromJson: true, includeToJson: true)
      final ProductCategory? selectedProductCategory,
      @JsonKey(includeFromJson: true, includeToJson: true)
      final ProductCategory? selectedProductSubCategory,
      final ProductStats? stats}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  bool? get active;
  @override
  UserState? get host;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get number;
  @override
  String? get category;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  String? get subcategory;
  @override
  @JsonKey(name: 'subcategory_name')
  String? get subcategoryName;
  @override
  @JsonKey(name: 'schedule_id')
  String? get scheduleID;
  @override
  @JsonKey(name: 'schedule')
  ProductSchedule? get schedule;
  @override
  List<ProductPricing?>? get pricing;
  @override
  List<ProductPricingOption?>? get pricingOptions;
  @override
  ProductMedia? get image;
  @override
  ProductMedia? get video;
  @override
  List<ProductLocation>? get locations;
  @override
  bool? get completed;
  @override
  @JsonKey(name: 'images_count')
  int? get imageCount;
  @override
  @JsonKey(name: 'videos_count')
  int? get videoCount;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'terms_accepted')
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'terms_and_conditions_id')
  String? get termsID;

  /// Temp values used when creating a product
  @override
  List<ProductMedia?>? get photos;
  @override
  List<ProductMedia?>? get videos;
  @override
  List<Booking?>? get bookings;
  @override
  @JsonKey(includeFromJson: true, includeToJson: true)
  ProductCategory? get selectedProductCategory;
  @override
  @JsonKey(includeFromJson: true, includeToJson: true)
  ProductCategory? get selectedProductSubCategory;
  @override
  ProductStats? get stats;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
