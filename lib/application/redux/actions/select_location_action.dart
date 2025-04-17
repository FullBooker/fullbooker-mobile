import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';

class SelectLocationAction extends ReduxAction<AppState> {
  SelectLocationAction({
    this.selectedProduct,
    this.currentProduct,
    this.selectedLocation,
    this.lat,
    this.long,
    this.address,
    this.city,
  });

  Product? selectedProduct;
  Product? currentProduct;
  ProductLocation? selectedLocation;
  final String? lat;
  final String? long;
  final String? address;
  final String? city;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedLocation?.call(
      lat: lat ?? state.hostState?.selectedLocation?.lat,
      long: long ?? state.hostState?.selectedLocation?.long,
      address: address ?? state.hostState?.selectedLocation?.address,
      city: city ?? state.hostState?.selectedLocation?.city,
    );

    return newState;
  }
}
