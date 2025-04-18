import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductPricingPage extends StatelessWidget {
  const ProductPricingPage({super.key});

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
              child: StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                // onInit: (Store<AppState> store) => context.dispatch(
                //   FetchCurrenciesAction(
                //     client: AppWrapperBase.of(context)!.customClient,
                //   ),
                // ),
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  final Map<String, ProductPricing> pricingMap =
                      <String, ProductPricing>{};

                  for (final ProductPricing? p
                      in vm.pricing ?? <ProductPricing?>[]) {
                    final String? key = p?.ticketTier?.toLowerCase();
                    if (key != null && p != null) {
                      pricingMap[key] = p;
                    }
                  }

                  return ListView(
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
                          if (vm.pricing?.isEmpty ?? true) ...<Widget>[
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
                                      addPricingErrorMsg,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          for (final String tier in allTicketTiers)
                            PricingCardWidget(
                              ticketType: tier,
                              price: double.tryParse(
                                    pricingMap[tier.toLowerCase()]?.cost ?? '',
                                  ) ??
                                  0,
                              discount: null,
                              maxTickets:
                                  pricingMap[tier.toLowerCase()]?.maxTickets ??
                                      0,
                              svgIconPath: getTicketIconPath(tier),
                              onAddOrEdit: () {
                                context.router.push(AddProductPricingRoute());
                              },
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(
                  ProductReviewAndSubmitRoute(
                    workflowState: WorkflowState.CREATE,
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
        ),
      ),
    );
  }
}
