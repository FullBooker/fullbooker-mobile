import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/states/user_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/domain/core/entities/booking.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/host/products/widgets/booking_list_item_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductBookingsPage extends StatelessWidget {
  const ProductBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        showBell: false,
        title: productBookings,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          // TODO(abiud): scan tickets on this page
        },
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              StoreConnector<AppState, ProductsPageViewModel>(
                converter: (Store<AppState> store) =>
                    ProductsPageViewModel.fromState(store.state),
                onInit: (Store<AppState> store) {
                  // TODO(abiud): dispatch get product bookings action
                  // context.dispatch(
                  //   FetchProductsAction(
                  //     client: AppWrapperBase.of(context)!.customClient,
                  //   ),
                  // );
                },
                builder: (BuildContext context, ProductsPageViewModel vm) {
                  // TODO(abiud): restore this code when linking to the API

                  // if (context.isWaiting(FetchProductsAction)) {
                  //   return AppLoading();
                  // }

                  // final List<Product>? products = vm.products;

                  // if (products?.isEmpty ?? true) {
                  //   return GenericZeroState(
                  //     iconPath: productZeroStateSVGPath,
                  //     title: noProducts,
                  //     description: noProductsCopy,
                  //     onCTATap: () {
                  //       context.router.push(SetupProductTypeRoute());
                  //     },
                  //     ctaText: createProductString,
                  //   );
                  // }

                  // return ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: products?.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     final Product product = products![index];

                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 12),
                  //       child: NewProductCard(product: product),
                  //     );
                  //   },
                  // );

                  return Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: <Widget>[
                          Text(
                            testEventName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '400 $bookings',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'KES 300, 000',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),

                          // TODO(abiud): add filter groups here

                          CustomTextInput(
                            hintText: searchBookingsHint,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (String param) {},
                            keyboardType: TextInputType.name,
                            prefixIconData: HeroIcons.magnifyingGlass,
                          ),

                          // Bookings
                          ListView.builder(
                            itemCount: mockBookings.length,
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final Booking current = mockBookings[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: BookingListItem(
                                  booking: Booking.initial().copyWith(
                                    bookedOn: DateTime.now().toIso8601String(),
                                    user: UserState(
                                      firstName: current.user?.firstName,
                                      lastName: current.user?.lastName,
                                    ),
                                    bookingType: current.bookingType,
                                    price: current.price,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
