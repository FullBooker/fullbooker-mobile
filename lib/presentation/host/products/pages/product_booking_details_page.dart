import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_bookings_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_booking_detail_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_fan_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_list_item_widget.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductBookingDetailsPage extends StatelessWidget {
  const ProductBookingDetailsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchProductBookingsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: productBookingDetails,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PrimaryButton(
          onPressed: () => context.router.push(ScanTicketsRoute()),
          customRadius: 100,
          child: left(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: <Widget>[
                HeroIcon(
                  HeroIcons.camera,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  scanTickets,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: <Widget>[
                StoreConnector<AppState, ProductBookingDetailsViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductBookingDetailsViewModel.fromState(store.state),
                  builder: (
                    BuildContext context,
                    ProductBookingDetailsViewModel vm,
                  ) {
                    final ProductStats? stats = vm.stats;
                    final double revenue =
                        double.tryParse(stats?.revenue ?? '0') ?? 0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        Text(
                          vm.productName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          formatCurrency(revenue),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    );
                  },
                ),
                StoreConnector<AppState, ProductBookingDetailsViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductBookingDetailsViewModel.fromState(store.state),
                  builder: (
                    BuildContext context,
                    ProductBookingDetailsViewModel vm,
                  ) {
                    if (context.isWaiting(FetchProductBookingsAction)) {
                      return AppLoading();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        Text(
                          bookedBy,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: BookingFanWidget(
                            booking: vm.selectedBooking,
                          ),
                        ),
                        Text(
                          ticketsDisplay(
                            vm.selectedBooking.totalTicketsCount ?? 0,
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: BookingListItem(
                            booking: vm.selectedBooking,
                            readOnly: true,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
