import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/ticket_types_bottom_sheet.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductPricingPage extends StatelessWidget {
  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchProductPricingAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  const ProductPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          showBell: false,
          title: setupEvent,
        ),
        body: RefreshIndicator(
          onRefresh: () => onRefresh(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: <Widget>[
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Text(
                                      pricingCopy,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isDismissible: false,
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      builder: (_) => TicketTypesBottomSheet(),
                                    );
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
                          StoreConnector<AppState, ProductSetupViewModel>(
                            converter: (Store<AppState> store) =>
                                ProductSetupViewModel.fromState(store.state),
                            onInit: (Store<AppState> store) {
                              context.dispatch(
                                FetchProductPricingAction(
                                  client:
                                      AppWrapperBase.of(context)!.customClient,
                                ),
                              );
                            },
                            builder: (
                              BuildContext context,
                              ProductSetupViewModel vm,
                            ) {
                              if (context
                                  .isWaiting(FetchProductPricingAction)) {
                                return AppLoading();
                              }

                              if (vm.pricing?.isEmpty ?? true) {
                                return GenericZeroState(
                                  iconPath: productPricingZeroStateSVGPath,
                                  title: noPricingAdded,
                                  description: noPricingAddedCopy,
                                  onCTATap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isDismissible: false,
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      builder: (_) => TicketTypesBottomSheet(),
                                    );
                                  },
                                  ctaText: addPricingString,
                                );
                              }

                              final Map<String, ProductPricing> pricingMap =
                                  <String, ProductPricing>{};

                              for (final ProductPricing? p
                                  in vm.pricing ?? <ProductPricing>[]) {
                                final String? tierKey =
                                    p?.ticketTier?.toLowerCase();
                                if (tierKey != null) {
                                  pricingMap[tierKey] = p!;
                                }
                              }

                              return ListView.builder(
                                itemCount: vm.pricing?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final ProductPricing? current =
                                      vm.pricing![index];

                                  return PricingCardWidget(
                                    onAddOrEdit: () {
                                      // context.dispatch(
                                      //   UpdateHostStateAction(
                                      //     selectedPricingTier: tier,
                                      //   ),
                                      // );
                                      // context.router
                                      //     .push(AddProductPricingRoute());
                                    },
                                    pricing: current,
                                    tierDisplay: current?.name,
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
                StoreConnector<AppState, ProductSetupViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductSetupViewModel.fromState(store.state),
                  builder: (BuildContext context, ProductSetupViewModel vm) {
                    final bool isEditing =
                        vm.workflowState == WorkflowState.VIEW;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        PrimaryButton(
                          onPressed: () {
                            if (isEditing) {
                              context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              );
                            } else {
                              if (vm.pricing?.isEmpty ?? true) {
                                showAlertDialog(
                                  context: context,
                                  assetPath: productZeroStateSVGPath,
                                  description: addPricingErrorMsg,
                                );
                              } else {
                                context.router
                                    .push(ProductReviewAndSubmitRoute());
                              }
                            }
                          },
                          child: d.right(continueString),
                        ),
                        SecondaryButton(
                          onPressed: () {
                            isEditing
                                ? context.router.popUntil(
                                    (Route<dynamic> route) =>
                                        route.settings.name ==
                                        ProductReviewAndSubmitRoute.name,
                                  )
                                : context.router.maybePop();
                          },
                          child: d.right(
                            isEditing ? backToPreview : previousString,
                          ),
                          fillColor: Colors.transparent,
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
