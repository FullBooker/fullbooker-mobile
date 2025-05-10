import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/modes_of_access_bottom_sheet.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_options_bottom_sheet.dart';
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
                          Column(
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
                                      builder: (_) =>
                                          PricingOptionsBottomSheet(),
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

                              String _tierKey(String display) =>
                                  display.toLowerCase().replaceAll(' ', '_');

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 12,
                                children: <Widget>[
                                  if (vm.pricing?.isEmpty ?? true)
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withValues(alpha: .1),
                                      ),
                                      child: Row(
                                        spacing: 8,
                                        children: <Widget>[
                                          HeroIcon(
                                            HeroIcons.exclamationTriangle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          Expanded(
                                            child: Text(
                                              addPricingErrorMsg,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  // for (final String tier in allTicketTiers)
                                  //   PricingCardWidget(
                                  //     onAddOrEdit: () {
                                  //       context.dispatch(
                                  //         UpdateHostStateAction(
                                  //           selectedPricingTier: tier,
                                  //         ),
                                  //       );
                                  //       context.router
                                  //           .push(AddProductPricingRoute());
                                  //     },
                                  //     pricing: pricingMap[_tierKey(tier)],
                                  //     tierDisplay: tier,
                                  //   ),
                                ],
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
