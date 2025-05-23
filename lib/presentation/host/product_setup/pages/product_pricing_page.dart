import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/clear_selected_ticket_type_options_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/selected_product_category_banner.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductPricingPage extends StatelessWidget {
  const ProductPricingPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchProductPricingAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: setupEvent),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: CustomBottomNavContainer(
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: <Widget>[
                  Flexible(
                    child: PrimaryButton(
                      isLoading: context.isWaiting(FetchProductPricingAction),
                      onPressed: () => context.router.maybePop(),
                      child: d.right(continueString),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator(
            onRefresh: () => onRefresh(context),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Top banner
                    Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: <Widget>[
                              Text(
                                pricing,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                pricingCopy,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              context.dispatch(
                                ClearSelectedTicketTypeOptionsAction(),
                              );
                              context.router.push(AddProductPricingRoute());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: HeroIcon(
                                HeroIcons.plus,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SelectedProductCategoryBanner(),

                    // Contents
                    StoreConnector<AppState, ProductSetupViewModel>(
                      converter: (Store<AppState> store) =>
                          ProductSetupViewModel.fromState(store.state),
                      onInit: (Store<AppState> store) {
                        context.dispatch(
                          FetchProductPricingAction(
                            client: AppWrapperBase.of(context)!.customClient,
                          ),
                        );
                      },
                      builder: (
                        BuildContext context,
                        ProductSetupViewModel vm,
                      ) {
                        if (context.isWaiting(FetchProductPricingAction)) {
                          return AppLoading();
                        }

                        if (vm.pricing?.isEmpty ?? true) {
                          return GenericZeroState(
                            iconPath: productPricingZeroStateSVGPath,
                            title: noPricingAdded,
                            description: noPricingAddedCopy,
                            onCTATap: () {
                              context.dispatch(
                                ClearSelectedTicketTypeOptionsAction(),
                              );
                              context.router.push(AddProductPricingRoute());
                            },
                            ctaText: addPricingString,
                          );
                        }

                        final Map<String, ProductPricing> pricingMap =
                            <String, ProductPricing>{};

                        for (final ProductPricing? p
                            in vm.pricing ?? <ProductPricing>[]) {
                          final String? tierKey = p?.ticketTier?.toLowerCase();
                          if (tierKey != null) {
                            pricingMap[tierKey] = p!;
                          }
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: vm.pricing?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final ProductPricing? current = vm.pricing![index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: PricingCardWidget(
                                onAddOrEdit: () {
                                  context.router.push(AddProductPricingRoute());
                                },
                                pricing: current,
                              ),
                            );
                          },
                        );
                      },
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
