import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/fullbooker_app_widget.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class AppEntryPointViewModelFactory
    extends VmFactory<AppState, FullBookerAppWidget, AppEntryPointViewModel> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      accessToken: state.authState?.authCredentials?.accessToken,
      refreshToken: state.authState?.authCredentials?.refreshToken,
      isSignedIn: state.authState?.isSignedIn ?? false,
    );
  }
}

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.accessToken,
    required this.refreshToken,
    required this.isSignedIn,
  }) : super(equals: <Object?>[accessToken, refreshToken, isSignedIn]);

  final String? accessToken;
  final String? refreshToken;
  final bool isSignedIn;
}
