import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/select_product_pricing_option_action.dart';
import 'package:fullbooker/application/redux/actions/set_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product_pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/mode_of_access_item.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/modes_of_access_bottom_sheet.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductModeOfAccessPage extends StatelessWidget {
  const ProductModeOfAccessPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchProductPricingOptionsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(context),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            showBell: false,
            title: setupEvent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            modeOfAccess,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            modeOfAccessCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            builder: (_) => ModesOfAccessBottomSheet(),
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
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      StoreConnector<AppState, ProductSetupViewModel>(
                        converter: (Store<AppState> store) =>
                            ProductSetupViewModel.fromState(store.state),
                        onInit: (Store<AppState> store) {
                          context.dispatch(
                            FetchProductPricingOptionsAction(
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        },
                        builder:
                            (BuildContext context, ProductSetupViewModel vm) {
                          if (context
                              .isWaiting(FetchProductPricingOptionsAction)) {
                            return AppLoading();
                          }

                          final List<ProductPricingOption?>?
                              productPricingOptions = vm.productPricingOptions;

                          if (productPricingOptions?.isEmpty ?? true) {
                            return GenericZeroState(
                              iconPath: bookingTicketsZeroStateSVGPath,
                              title: setupModesOfAccess,
                              description: setupModesOfAccessCopy,
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
                                  builder: (_) => ModesOfAccessBottomSheet(),
                                );
                              },
                              ctaText: addModeOfAccess,
                            );
                          }

                          return ListView.builder(
                            itemCount: productPricingOptions?.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final ProductPricingOption? current =
                                  productPricingOptions![index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ModeOfAccessItem(
                                  option: current!,
                                  onCTATap: () {
                                    context.dispatch(
                                      SelectProductPricingOptionAction(
                                        productPricingOption: current,
                                      ),
                                    );
                                    context.router.push(ProductPricingRoute());
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                StoreConnector<AppState, ProductSetupViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductSetupViewModel.fromState(store.state),
                  builder: (BuildContext context, ProductSetupViewModel vm) {
                    if (context.isWaiting(SetProductPricingOptionsAction)) {
                      return AppLoading();
                    }

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
                              context.router
                                  .push(ProductReviewAndSubmitRoute());
                            }
                          },
                          child: d.right(continueString),
                        ),
                        SecondaryButton(
                          onPressed: () => context.router.maybePop(),
                          child: d.right(previousString),
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
