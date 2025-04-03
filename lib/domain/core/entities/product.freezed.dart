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
  String? get subcategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'availability')
  ProductAvailability? get availability => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricing')
  List<ProductPricing>? get pricing => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  ProductImage? get image => throw _privateConstructorUsedError;
  dynamic get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'locations')
  List<ProductLocation>? get locations => throw _privateConstructorUsedError;

  /// Temp values used to create the product
  ProductCategory? get selectedProductCategory =>
      throw _privateConstructorUsedError;
  ProductCategory? get selectedProductSubCategory =>
      throw _privateConstructorUsedError;

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
      String? subcategory,
      @JsonKey(name: 'availability') ProductAvailability? availability,
      @JsonKey(name: 'pricing') List<ProductPricing>? pricing,
      @JsonKey(name: 'image') ProductImage? image,
      dynamic video,
      @JsonKey(name: 'locations') List<ProductLocation>? locations,
      ProductCategory? selectedProductCategory,
      ProductCategory? selectedProductSubCategory});

  $UserStateCopyWith<$Res>? get host;
  $ProductAvailabilityCopyWith<$Res>? get availability;
  $ProductImageCopyWith<$Res>? get image;
  $ProductCategoryCopyWith<$Res>? get selectedProductCategory;
  $ProductCategoryCopyWith<$Res>? get selectedProductSubCategory;
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
    Object? subcategory = freezed,
    Object? availability = freezed,
    Object? pricing = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = freezed,
    Object? selectedProductCategory = freezed,
    Object? selectedProductSubCategory = freezed,
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
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as ProductAvailability?,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<ProductPricing>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ProductLocation>?,
      selectedProductCategory: freezed == selectedProductCategory
          ? _value.selectedProductCategory
          : selectedProductCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      selectedProductSubCategory: freezed == selectedProductSubCategory
          ? _value.selectedProductSubCategory
          : selectedProductSubCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
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
  $ProductAvailabilityCopyWith<$Res>? get availability {
    if (_value.availability == null) {
      return null;
    }

    return $ProductAvailabilityCopyWith<$Res>(_value.availability!, (value) {
      return _then(_value.copyWith(availability: value) as $Val);
    });
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ProductImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
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
      String? subcategory,
      @JsonKey(name: 'availability') ProductAvailability? availability,
      @JsonKey(name: 'pricing') List<ProductPricing>? pricing,
      @JsonKey(name: 'image') ProductImage? image,
      dynamic video,
      @JsonKey(name: 'locations') List<ProductLocation>? locations,
      ProductCategory? selectedProductCategory,
      ProductCategory? selectedProductSubCategory});

  @override
  $UserStateCopyWith<$Res>? get host;
  @override
  $ProductAvailabilityCopyWith<$Res>? get availability;
  @override
  $ProductImageCopyWith<$Res>? get image;
  @override
  $ProductCategoryCopyWith<$Res>? get selectedProductCategory;
  @override
  $ProductCategoryCopyWith<$Res>? get selectedProductSubCategory;
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
    Object? subcategory = freezed,
    Object? availability = freezed,
    Object? pricing = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? locations = freezed,
    Object? selectedProductCategory = freezed,
    Object? selectedProductSubCategory = freezed,
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
      subcategory: freezed == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as ProductAvailability?,
      pricing: freezed == pricing
          ? _value._pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as List<ProductPricing>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ProductImage?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locations: freezed == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ProductLocation>?,
      selectedProductCategory: freezed == selectedProductCategory
          ? _value.selectedProductCategory
          : selectedProductCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
      selectedProductSubCategory: freezed == selectedProductSubCategory
          ? _value.selectedProductSubCategory
          : selectedProductSubCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
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
      this.subcategory = UNKNOWN,
      @JsonKey(name: 'availability') this.availability,
      @JsonKey(name: 'pricing')
      final List<ProductPricing>? pricing = const <ProductPricing>[],
      @JsonKey(name: 'image') this.image,
      this.video,
      @JsonKey(name: 'locations')
      final List<ProductLocation>? locations = const <ProductLocation>[],
      this.selectedProductCategory,
      this.selectedProductSubCategory})
      : _pricing = pricing,
        _locations = locations;

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
  @JsonKey()
  final String? subcategory;
  @override
  @JsonKey(name: 'availability')
  final ProductAvailability? availability;
  final List<ProductPricing>? _pricing;
  @override
  @JsonKey(name: 'pricing')
  List<ProductPricing>? get pricing {
    final value = _pricing;
    if (value == null) return null;
    if (_pricing is EqualUnmodifiableListView) return _pricing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'image')
  final ProductImage? image;
  @override
  final dynamic video;
  final List<ProductLocation>? _locations;
  @override
  @JsonKey(name: 'locations')
  List<ProductLocation>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Temp values used to create the product
  @override
  final ProductCategory? selectedProductCategory;
  @override
  final ProductCategory? selectedProductSubCategory;

  @override
  String toString() {
    return 'Product(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, active: $active, host: $host, name: $name, description: $description, number: $number, category: $category, subcategory: $subcategory, availability: $availability, pricing: $pricing, image: $image, video: $video, locations: $locations, selectedProductCategory: $selectedProductCategory, selectedProductSubCategory: $selectedProductSubCategory)';
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
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            const DeepCollectionEquality().equals(other._pricing, _pricing) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            (identical(
                    other.selectedProductCategory, selectedProductCategory) ||
                other.selectedProductCategory == selectedProductCategory) &&
            (identical(other.selectedProductSubCategory,
                    selectedProductSubCategory) ||
                other.selectedProductSubCategory ==
                    selectedProductSubCategory));
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
      const DeepCollectionEquality().hash(_locations),
      selectedProductCategory,
      selectedProductSubCategory);

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
      final String? subcategory,
      @JsonKey(name: 'availability') final ProductAvailability? availability,
      @JsonKey(name: 'pricing') final List<ProductPricing>? pricing,
      @JsonKey(name: 'image') final ProductImage? image,
      final dynamic video,
      @JsonKey(name: 'locations') final List<ProductLocation>? locations,
      final ProductCategory? selectedProductCategory,
      final ProductCategory? selectedProductSubCategory}) = _$ProductImpl;

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
  String? get subcategory;
  @override
  @JsonKey(name: 'availability')
  ProductAvailability? get availability;
  @override
  @JsonKey(name: 'pricing')
  List<ProductPricing>? get pricing;
  @override
  @JsonKey(name: 'image')
  ProductImage? get image;
  @override
  dynamic get video;
  @override
  @JsonKey(name: 'locations')
  List<ProductLocation>? get locations;

  /// Temp values used to create the product
  @override
  ProductCategory? get selectedProductCategory;
  @override
  ProductCategory? get selectedProductSubCategory;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
