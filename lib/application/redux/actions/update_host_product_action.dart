import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/host_product_response.dart';

class UpdateHostProductAction extends ReduxAction<AppState> {
  UpdateHostProductAction({
    this.products,
  });

  List<HostProduct?>? products;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.call(
      products: products ?? state.hostState!.products,
    );

    return newState;
  }
}
