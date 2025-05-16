import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_pricing_options_action.dart';
import 'package:fullbooker/application/redux/actions/select_product_pricing_option_action.dart';
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
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: setupEvent),
        bottomNavigationBar: CustomBottomNavContainer(
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              final bool isEditing = vm.workflowState == WorkflowState.VIEW;

              return Row(
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: SecondaryButton(
                      addBorder: true,
                      onPressed: () {
                        isEditing
                            ? context.router.popUntil(
                                (Route<dynamic> r) =>
                                    r.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(
                        isEditing ? backToPreview : previousString,
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: PrimaryButton(
                      onPressed: () {
                        isEditing
                            ? context.router.popUntil(
                                (Route<dynamic> r) =>
                                    r.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router
                                .push(ProductReviewAndSubmitRoute());
                      },
                      child: d.right(continueString),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => onRefresh(context),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Column(
                spacing: 12,
                children: <Widget>[
                  // Header row
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
                          onTap: () => showModalBottomSheet(
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
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const HeroIcon(
                              HeroIcons.plus,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  StoreConnector<AppState, ProductSetupViewModel>(
                    converter: (Store<AppState> store) =>
                        ProductSetupViewModel.fromState(store.state),
                    onInit: (Store<AppState> store) => context.dispatch(
                      FetchProductPricingOptionsAction(
                        client: AppWrapperBase.of(context)!.customClient,
                      ),
                    ),
                    builder: (BuildContext context, ProductSetupViewModel vm) {
                      if (context.isWaiting(FetchProductPricingOptionsAction)) {
                        return const AppLoading();
                      }
                      final List<ProductPricingOption?>? options =
                          vm.productPricingOptions;
                      if (options == null || options.isEmpty) {
                        return GenericZeroState(
                          iconPath: bookingTicketsZeroStateSVGPath,
                          title: setupModesOfAccess,
                          description: setupModesOfAccessCopy,
                          onCTATap: () => showModalBottomSheet(
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
                          ),
                          ctaText: addModeOfAccess,
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ProductPricingOption? current = options[index];

                          return Padding(
                            padding: EdgeInsets.only(bottom: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
