import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/set_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/toggle_pricing_option_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/pricing_option.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_option_item.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductModeOfAccessPage extends StatelessWidget {
  const ProductModeOfAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            modeOfAccess,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            modeOfAccessCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      StoreConnector<AppState, ProductSetupViewModel>(
                        converter: (Store<AppState> store) =>
                            ProductSetupViewModel.fromState(store.state),
                        onInit: (Store<AppState> store) {
                          context.dispatch(
                            FetchPricingOptionsAction(
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        },
                        builder:
                            (BuildContext context, ProductSetupViewModel vm) {
                          if (context.isWaiting(FetchPricingOptionsAction)) {
                            return AppLoading();
                          }

                          final List<PricingOption?>? pricingOptions =
                              vm.pricingOptions;

                          return Column(
                            children: <Widget>[
                              if (vm.selectedPricingOptionIDs?.isEmpty ?? true)
                                Container(
                                  padding: const EdgeInsets.all(16),
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
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Expanded(
                                        child: Text(
                                          addProductPricingOptionErrorMsg,
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
                              ListView.builder(
                                itemCount: pricingOptions?.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  final PricingOption? current =
                                      pricingOptions![index];

                                  final bool selected = vm
                                          .selectedPricingOptionIDs
                                          ?.contains(current?.id) ??
                                      false;

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: PricingOptionItem(
                                      option: current!,
                                      isSelected: selected,
                                      onTap: () {
                                        context.dispatch(
                                          TogglePricingOptionAction(
                                            optionID: current.id,
                                          ),
                                        );
                                      },
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
                ],
              ),
            ),
            StoreConnector<AppState, ProductSetupViewModel>(
              converter: (Store<AppState> store) =>
                  ProductSetupViewModel.fromState(store.state),
              builder: (BuildContext context, ProductSetupViewModel vm) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: <Widget>[
                    PrimaryButton(
                      onPressed: () {
                        context.dispatch(
                          SetProductPricingOptionsAction(
                            client: AppWrapperBase.of(context)!.customClient,
                            onSuccess: () =>
                                context.router.push(ProductPricingRoute()),
                            onError: (String error) {
                              showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              );
                            },
                          ),
                        );
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
    );
  }
}
