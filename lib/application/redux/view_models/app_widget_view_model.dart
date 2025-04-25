import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class AppWidgetViewModel extends Vm {
  AppWidgetViewModel({required this.isSignedIn})
      : super(equals: <bool>[isSignedIn]);

  factory AppWidgetViewModel.fromStore(Store<AppState> store) {
    return AppWidgetViewModel(
      isSignedIn: store.state.authState?.isSignedIn ?? false,
    );
  }

  final bool isSignedIn;
}
