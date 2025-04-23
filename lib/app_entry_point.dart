import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/app_wrapper.dart';
import 'package:fullbooker/application/core/services/custom_client.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/fullbooker_app_widget.dart';
import 'package:get_it/get_it.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({
    super.key,
    required this.appName,
    required this.appStore,
    this.fcmToken,
  });

  final String appName;
  final Store<AppState> appStore;
  final String? fcmToken;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: appStore,
      child: StoreConnector<AppState, AppEntryPointViewModel>(
        vm: () => AppEntryPointViewModelFactory(),
        builder: (BuildContext context, AppEntryPointViewModel vm) {
          final String accessToken = vm.accessToken ?? UNKNOWN;
          final String refreshToken = vm.refreshToken ?? UNKNOWN;
          final String refreshTokenEndpoint =
              GetIt.I.get<AppConfig>().refreshTokenEndpoint;

          return AppWrapper(
            appName: appName,
            customClient: CustomClient(
              accessToken: accessToken,
              context: context,
              refreshToken: refreshToken,
              refreshTokenEndpoint: refreshTokenEndpoint,
            ),
            child: FullBookerAppWidget(),
          );
        },
      ),
    );
  }
}
