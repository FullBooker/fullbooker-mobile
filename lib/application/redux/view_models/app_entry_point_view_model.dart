import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/app_entry_point.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class AppEntryPointViewModelFactory
    extends VmFactory<AppState, AppEntryPoint, AppEntryPointViewModel> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      accessToken: state.authState?.authCredentials?.accessToken,
      refreshToken: state.authState?.authCredentials?.refreshToken,
    );
  }
}

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.accessToken,
    required this.refreshToken,
  }) : super(equals: <Object?>[accessToken, refreshToken]);

  final String? accessToken;
  final String? refreshToken;
}
