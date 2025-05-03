import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdateProductSearchAction extends ReduxAction<AppState> {
  UpdateProductSearchAction({
    this.searchParam,
    this.isSearching,
  });

  final String? searchParam;
  final bool? isSearching;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      searchParam: searchParam ?? state.hostState?.searchParam,
      isSearching: isSearching ?? state.hostState?.isSearching,
    );

    return newState;
  }
}
