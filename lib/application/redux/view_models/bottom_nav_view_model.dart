// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class BottomNavViewModel extends Vm {
  final int currentIndex;

  BottomNavViewModel({required this.currentIndex})
      : super(equals: <Object>[currentIndex]);

  factory BottomNavViewModel.fromStore(Store<AppState> store) {
    return BottomNavViewModel(
      currentIndex: store.state.bottomNavState?.currentNavIndex ?? 0,
    );
  }
}
