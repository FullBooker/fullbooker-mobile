import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';

class ResetCurrentProductAction extends ReduxAction<AppState> {
  ResetCurrentProductAction();

  @override
  AppState? reduce() {
    return state.copyWith.hostState?.call(
      currentProduct: Product.initial(),
      selectedSchedule: ProductSchedule.initial(),
    );
  }
}
