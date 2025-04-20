import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_bookings_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_bookings_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_list_item_widget.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductBookingsPage extends StatelessWidget {
  const ProductBookingsPage({super.key});

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
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        showBell: false,
        title: productBookings,
      ),
      floatingActionButton: GestureDetector(
        onTap: () => context.router.push(ScanTicketsRoute()),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16),
          child: HeroIcon(
            HeroIcons.camera,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        StoreConnector<AppState, ProductsBookingsViewModel>(
                          converter: (Store<AppState> store) =>
                              ProductsBookingsViewModel.fromState(store.state),
                          builder: (
                            BuildContext context,
                            ProductsBookingsViewModel vm,
                          ) {
                            final ProductStats? stats = vm.stats;
                            final int count = stats?.bookings ?? 0;
                            final bool hasBookings = count > 0;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: <Widget>[
                                Text(
                                  vm.productName,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  hasBookings
                                      ? bookingsValue(count)
                                      : noBookingsYet,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  'KES ${stats?.revenue}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            );
                          },
                        ),

                        // TODO(abiud): add filter groups here

                        StoreConnector<AppState, ProductsBookingsViewModel>(
                          converter: (Store<AppState> store) =>
                              ProductsBookingsViewModel.fromState(store.state),
                          onInit: (Store<AppState> store) {
                            context.dispatch(
                              FetchProductBookingsAction(
                                client:
                                    AppWrapperBase.of(context)!.customClient,
                              ),
                            );
                          },
                          builder: (
                            BuildContext context,
                            ProductsBookingsViewModel vm,
                          ) {
                            if (context.isWaiting(FetchProductBookingsAction)) {
                              return AppLoading();
                            }

                            if (vm.bookings?.isEmpty ?? true) {
                              return GenericZeroState(
                                iconPath: bookingZeroStateSVGPath,
                                title: noBookingsYet,
                                description: noBookingsYetCopy,
                                onCTATap: () {
                                  context.dispatch(
                                    FetchProductBookingsAction(
                                      client: AppWrapperBase.of(context)!
                                          .customClient,
                                    ),
                                  );
                                },
                                ctaText: tryAgain,
                              );
                            }

                            return Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // TODO(abiud): restore this when we link bookings search
                                // CustomTextInput(
                                //   hintText: searchBookingsHint,
                                //   autovalidateMode:
                                //       AutovalidateMode.onUserInteraction,
                                //   onChanged: (String param) {},
                                //   keyboardType: TextInputType.name,
                                //   prefixIconData: HeroIcons.magnifyingGlass,
                                // ),
                                ListView.builder(
                                  itemCount: vm.bookings?.length,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Booking? current =
                                        vm.bookings![index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: BookingListItem(booking: current!),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
