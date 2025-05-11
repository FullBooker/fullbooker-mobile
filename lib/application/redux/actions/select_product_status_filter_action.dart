import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class SelectProductStatusFilterAction extends ReduxAction<AppState> {
  SelectProductStatusFilterAction({
    this.productStatus,
  });

  final ProductStatus? productStatus;

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      selectedProductStatusFilter:
          productStatus ?? state.hostState?.selectedProductStatusFilter,
    );
  }
}
