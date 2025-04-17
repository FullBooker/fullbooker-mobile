// Package imports:

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';

part 'host_state.freezed.dart';
part 'host_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HostState with _$HostState {
  @JsonSerializable(explicitToJson: true)
  factory HostState({
    @Default(<Product>[]) List<Product?>? products,
    Product? currentProduct,
    Product? selectedProduct,
    @Default(<ProductCategory>[]) List<ProductCategory>? productCategories,
    LocationPermsResult? locationPerms,

    // Used during product setup
    ProductLocation? selectedLocation,
  }) = _HostState;

  factory HostState.initial() => HostState(
        currentProduct: Product.initial(),
        selectedProduct: Product.initial(),
        locationPerms: LocationPermsResult.initial(),
        selectedLocation: ProductLocation.initial(),
      );

  factory HostState.fromJson(Map<String, dynamic> json) =>
      _$HostStateFromJson(json);
}
