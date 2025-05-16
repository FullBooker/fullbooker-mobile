import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_bookings_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_bookings_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_list_item_widget.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
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
      appBar: CustomAppBar(title: productBookings),
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
                HeroIcon(HeroIcons.camera, color: Colors.white, size: 24),
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
                          hasBookings ? bookingsValue(count) : noBookingsYet,
                          style: Theme.of(context).textTheme.bodySmall,
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

                // TODO(abiud): add filter groups here

                StoreConnector<AppState, ProductsBookingsViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductsBookingsViewModel.fromState(store.state),
                  onInit: (Store<AppState> store) {
                    context.dispatch(
                      FetchProductBookingsAction(
                        client: AppWrapperBase.of(context)!.customClient,
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
                              client: AppWrapperBase.of(context)!.customClient,
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
                        CustomTextInput(
                          hintText: searchBookingsHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String param) {},
                          keyboardType: TextInputType.name,
                          prefixIconData: HeroIcons.magnifyingGlass,
                        ),
                        ListView.builder(
                          itemCount: vm.bookings?.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 100),
                          itemBuilder: (BuildContext context, int index) {
                            final Booking? current = vm.bookings![index];

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
          ),
        ),
      ),
    );
  }
}
