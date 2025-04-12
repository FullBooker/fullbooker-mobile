import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/infrastructure/location/location_handler.dart';
import 'package:fullbooker/shared/entities/location_perms_result.dart';

class CheckLocationPermissionAction extends ReduxAction<AppState> {
  CheckLocationPermissionAction();

  @override
  Future<AppState?> reduce() async {
    final LocationPermsResult result =
        await LocationHandler.checkLocationPermission();

    return state.copyWith.hostState?.call(locationPerms: result);
  }
}
