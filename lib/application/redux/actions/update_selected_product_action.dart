import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';

class UpdateSelectedProductAction extends ReduxAction<AppState> {
  UpdateSelectedProductAction({
    this.productMedia,
    this.productPricing,
    this.schedule,
    this.stats,
  });

  final List<ProductMedia?>? productMedia;
  final List<ProductPricing?>? productPricing;
  final ProductSchedule? schedule;
  final ProductStats? stats;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedProduct?.call(
      productMedia:
          productMedia ?? state.hostState?.selectedProduct?.productMedia,
      schedule: schedule ?? state.hostState?.selectedProduct?.schedule,
      stats: stats ?? state.hostState?.selectedProduct?.stats,
    );

    return newState;
  }
}
