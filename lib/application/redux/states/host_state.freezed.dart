// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HostState _$HostStateFromJson(Map<String, dynamic> json) {
  return _HostState.fromJson(json);
}

/// @nodoc
mixin _$HostState {
  List<Product>? get products => throw _privateConstructorUsedError;
  Product? get currentProduct => throw _privateConstructorUsedError;
  Product? get selectedProduct => throw _privateConstructorUsedError;
  List<ProductCategory>? get productCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this HostState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostStateCopyWith<HostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostStateCopyWith<$Res> {
  factory $HostStateCopyWith(HostState value, $Res Function(HostState) then) =
      _$HostStateCopyWithImpl<$Res, HostState>;
  @useResult
  $Res call(
      {List<Product>? products,
      Product? currentProduct,
      Product? selectedProduct,
      List<ProductCategory>? productCategories});

  $ProductCopyWith<$Res>? get currentProduct;
  $ProductCopyWith<$Res>? get selectedProduct;
}

/// @nodoc
class _$HostStateCopyWithImpl<$Res, $Val extends HostState>
    implements $HostStateCopyWith<$Res> {
  _$HostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? currentProduct = freezed,
    Object? selectedProduct = freezed,
    Object? productCategories = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      productCategories: freezed == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ) as $Val);
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get currentProduct {
    if (_value.currentProduct == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.currentProduct!, (value) {
      return _then(_value.copyWith(currentProduct: value) as $Val);
    });
  }

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get selectedProduct {
    if (_value.selectedProduct == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.selectedProduct!, (value) {
      return _then(_value.copyWith(selectedProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostStateImplCopyWith<$Res>
    implements $HostStateCopyWith<$Res> {
  factory _$$HostStateImplCopyWith(
          _$HostStateImpl value, $Res Function(_$HostStateImpl) then) =
      __$$HostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product>? products,
      Product? currentProduct,
      Product? selectedProduct,
      List<ProductCategory>? productCategories});

  @override
  $ProductCopyWith<$Res>? get currentProduct;
  @override
  $ProductCopyWith<$Res>? get selectedProduct;
}

/// @nodoc
class __$$HostStateImplCopyWithImpl<$Res>
    extends _$HostStateCopyWithImpl<$Res, _$HostStateImpl>
    implements _$$HostStateImplCopyWith<$Res> {
  __$$HostStateImplCopyWithImpl(
      _$HostStateImpl _value, $Res Function(_$HostStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? currentProduct = freezed,
    Object? selectedProduct = freezed,
    Object? productCategories = freezed,
  }) {
    return _then(_$HostStateImpl(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      currentProduct: freezed == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      productCategories: freezed == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HostStateImpl implements _HostState {
  _$HostStateImpl(
      {this.products = const <Product>[],
      this.currentProduct,
      this.selectedProduct,
      this.productCategories = const <ProductCategory>[]});

  factory _$HostStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostStateImplFromJson(json);

  @override
  @JsonKey()
  final List<Product>? products;
  @override
  final Product? currentProduct;
  @override
  final Product? selectedProduct;
  @override
  @JsonKey()
  final List<ProductCategory>? productCategories;

  @override
  String toString() {
    return 'HostState(products: $products, currentProduct: $currentProduct, selectedProduct: $selectedProduct, productCategories: $productCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostStateImpl &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            const DeepCollectionEquality()
                .equals(other.productCategories, productCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      currentProduct,
      selectedProduct,
      const DeepCollectionEquality().hash(productCategories));

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostStateImplCopyWith<_$HostStateImpl> get copyWith =>
      __$$HostStateImplCopyWithImpl<_$HostStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostStateImplToJson(
      this,
    );
  }
}

abstract class _HostState implements HostState {
  factory _HostState(
      {final List<Product>? products,
      final Product? currentProduct,
      final Product? selectedProduct,
      final List<ProductCategory>? productCategories}) = _$HostStateImpl;

  factory _HostState.fromJson(Map<String, dynamic> json) =
      _$HostStateImpl.fromJson;

  @override
  List<Product>? get products;
  @override
  Product? get currentProduct;
  @override
  Product? get selectedProduct;
  @override
  List<ProductCategory>? get productCategories;

  /// Create a copy of HostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostStateImplCopyWith<_$HostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
