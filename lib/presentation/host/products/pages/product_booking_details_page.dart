import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_booking_tickets_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_booking_detail_view_model.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/ticket.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_fan_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_ticket_item_widget.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

@RoutePage()
class ProductBookingDetailsPage extends StatelessWidget {
  const ProductBookingDetailsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchBookingTicketsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: productBookingDetails),
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
                    final double revenue =
                        double.tryParse(vm.selectedBooking.totalCost ?? '0') ??
                            0;

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
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
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
                      ],
                    );
                  },
                ),
                StoreConnector<AppState, ProductBookingDetailsViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductBookingDetailsViewModel.fromState(store.state),
                  onInit: (Store<AppState> store) {
                    context.dispatch(
                      FetchBookingTicketsAction(
                        client: AppWrapperBase.of(context)!.customClient,
                      ),
                    );
                  },
                  builder: (
                    BuildContext context,
                    ProductBookingDetailsViewModel vm,
                  ) {
                    if (context.isWaiting(FetchBookingTicketsAction)) {
                      return AppLoading();
                    }

                    if (vm.selectedBookingTickets?.isEmpty ?? true) {
                      return GenericZeroState(
                        iconPath: bookingTicketsZeroStateSVGPath,
                        title: noTickets,
                        description: noTicketsCopy,
                        onCTATap: () {
                          context.dispatch(
                            FetchBookingTicketsAction(
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        },
                        ctaText: tryAgain,
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        Text(
                          ticketsDisplay(
                            vm.selectedBooking.totalTicketsCount ?? 0,
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (vm.selectedBookingTickets?.isNotEmpty ?? false)
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: vm.selectedBookingTickets?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Ticket? current =
                                  vm.selectedBookingTickets?[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: BookingTicketItemWidget(
                                  ticket: current,
                                ),
                              );
                            },
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
