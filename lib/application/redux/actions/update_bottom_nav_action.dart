// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdateBottomNavAction extends ReduxAction<AppState> {
  UpdateBottomNavAction({required this.currentIndex});

  final int currentIndex;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      bottomNavState:
          state.bottomNavState?.copyWith(currentNavIndex: currentIndex),
    );

    return newState;
  }
}
