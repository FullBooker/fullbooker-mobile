import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class SelectLocationAction extends ReduxAction<AppState> {
  SelectLocationAction({
    this.lat,
    this.long,
    this.address,
    this.city,
    this.coordinates,
  });

  final String? lat;
  final String? long;
  final String? address;
  final String? city;
  final String? coordinates;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedLocation?.call(
      lat: lat ?? state.hostState?.selectedLocation?.lat,
      long: long ?? state.hostState?.selectedLocation?.long,
      address: address ?? state.hostState?.selectedLocation?.address,
      city: city ?? state.hostState?.selectedLocation?.city,
      coordinates:
          coordinates ?? state.hostState?.selectedLocation?.coordinates,
    );

    return newState;
  }
}
