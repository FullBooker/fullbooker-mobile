import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/entities/product_schedule.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';

class UpdateSelectedProductAction extends ReduxAction<AppState> {
  UpdateSelectedProductAction({
    this.photos,
    this.videos,
    this.productPricing,
    this.schedule,
    this.stats,
    this.bookings,
    this.name,
    this.description,
  });

  final String? description;
  final String? name;
  final List<ProductMedia?>? photos;
  final List<ProductMedia?>? videos;
  final List<ProductPricing?>? productPricing;
  final List<Booking?>? bookings;
  final ProductSchedule? schedule;
  final ProductStats? stats;

  @override
  AppState? reduce() {
    final AppState? newState = state.copyWith.hostState?.selectedProduct?.call(
      photos: photos ?? state.hostState?.selectedProduct?.photos,
      videos: videos ?? state.hostState?.selectedProduct?.videos,
      schedule: schedule ?? state.hostState?.selectedProduct?.schedule,
      stats: stats ?? state.hostState?.selectedProduct?.stats,
      bookings: bookings ?? state.hostState?.selectedProduct?.bookings,
      name: name ?? state.hostState?.selectedProduct?.name,
      description: description ?? state.hostState?.selectedProduct?.description,
    );

    return newState;
  }
}
