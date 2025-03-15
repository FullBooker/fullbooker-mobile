import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class CustomActionObserver implements ActionObserver<AppState> {
  @override
  void observe(
    ReduxAction<dynamic> action,
    int dispatchCount, {
    required bool ini,
  }) {
    if (kDebugMode) {
      print('Dispatched action is $action');
    }
  }
}
