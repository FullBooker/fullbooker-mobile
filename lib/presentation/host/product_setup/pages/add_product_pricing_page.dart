import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_currencies_action.dart';
import 'package:fullbooker/application/redux/actions/save_product_pricing_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_selected_pricing_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_breakdown_widget.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_dropdown.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class AddProductPricingPage extends StatelessWidget {
  const AddProductPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: addTicketPrice,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                onInit: (Store<AppState> store) => context.dispatch(
                  FetchCurrenciesAction(
                    client: AppWrapperBase.of(context)!.customClient,
                  ),
                ),
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  return Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: <Widget>[
                                Text(
                                  setupTickerPrice,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  setupTickerPriceCopy,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Row(
                                spacing: 12,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    getTicketIconPath(vm.selectedPricingTier),
                                  ),
                                  Text(
                                    getTicketDisplayName(
                                      vm.selectedPricingTier,
                                    ),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),

                            // Currency dropdown
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: <Widget>[
                                Text(
                                  priceString,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Row(
                                  spacing: 12,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 3,
                                      child: context
                                              .isWaiting(FetchCurrenciesAction)
                                          ? const AppLoading()
                                          : CustomDropdown(
                                              options: vm.currencies
                                                      ?.whereType<Currency>()
                                                      .map(
                                                        (Currency c) =>
                                                            c.code ?? UNKNOWN,
                                                      )
                                                      .where(
                                                        (String code) =>
                                                            code.isNotEmpty &&
                                                            code != UNKNOWN,
                                                      )
                                                      .toList() ??
                                                  <String>[],
                                              value: (vm.selectedCurrency?.code
                                                              ?.isNotEmpty ??
                                                          false) &&
                                                      vm.selectedCurrency
                                                              ?.code !=
                                                          UNKNOWN
                                                  ? vm.selectedCurrency!.code!
                                                  : (vm.currencies
                                                          ?.firstWhere(
                                                            (Currency? c) =>
                                                                (c?.code?.isNotEmpty ??
                                                                    false) &&
                                                                c?.code !=
                                                                    UNKNOWN,
                                                            orElse: () => null,
                                                          )
                                                          ?.code ??
                                                      UNKNOWN),
                                              onChanged: (String? value) {
                                                if (value != null &&
                                                    value.isNotEmpty) {
                                                  final Currency? selected =
                                                      vm.currencies?.firstWhere(
                                                    (Currency? c) =>
                                                        c?.code == value,
                                                    orElse: () => null,
                                                  );
                                                  if (selected != null) {
                                                    context
                                                        .dispatchAll(<ReduxAction<
                                                            AppState>>[
                                                      UpdateHostStateAction(
                                                        selectedCurrency:
                                                            selected,
                                                      ),
                                                      UpdateSelectedPricingAction(
                                                        currency:
                                                            selected.code ??
                                                                UNKNOWN,
                                                      ),
                                                    ]);
                                                  }
                                                }
                                              },
                                            ),
                                    ),
                                    Flexible(
                                      flex: 9,
                                      child: CustomTextInput(
                                        hintText: priceHint,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (String? email) =>
                                            validateAmount(email),
                                        onChanged: (String value) {
                                          context.dispatch(
                                            UpdateSelectedPricingAction(
                                              cost: value,
                                            ),
                                          );
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            if (double.tryParse(
                                  vm.selectedPricing?.cost ?? '',
                                ) !=
                                null)
                              PricingBreakDownWidget(
                                ticketPrice: double.tryParse(
                                      vm.selectedPricing?.cost ?? '0',
                                    ) ??
                                    0,
                                buyerPaysFee:
                                    vm.selectedPricing?.buyerPaysFee ?? false,
                                onToggleFeeResponsibility: () {
                                  context.dispatch(
                                    UpdateSelectedPricingAction(
                                      buyerPaysFee: !vm.buyerPaysFee,
                                    ),
                                  );
                                },
                                selectedCurrency:
                                    (vm.selectedCurrency?.code?.isNotEmpty ??
                                                false) &&
                                            vm.selectedCurrency?.code != UNKNOWN
                                        ? vm.selectedCurrency!.code!
                                        : (vm.currencies
                                                ?.firstWhere(
                                                  (Currency? c) =>
                                                      (c?.code?.isNotEmpty ??
                                                          false) &&
                                                      c?.code != UNKNOWN,
                                                  orElse: () => null,
                                                )
                                                ?.code ??
                                            UNKNOWN),
                              ),

                            CustomTextInput(
                              hintText: maxTicketsHint,
                              labelText: maximumTickets(
                                getTicketDisplayName(vm.selectedPricingTier),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? email) =>
                                  validateMaxTickets(email),
                              onChanged: (String value) {
                                final int? parsed = int.tryParse(value);
                                if (parsed != null) {
                                  context.dispatch(
                                    UpdateSelectedPricingAction(
                                      maxTickets: parsed,
                                    ),
                                  );
                                }
                              },
                              keyboardType: TextInputType.number,
                            ),

                            // TODO(abiud): return this when the discount option is available
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   spacing: 12,
                            //   children: <Widget>[
                            //     Text(
                            //       discountLabel,
                            //       style:
                            //           Theme.of(context).textTheme.titleMedium,
                            //     ),
                            //     Row(
                            //       spacing: 12,
                            //       children: <Widget>[
                            //         Flexible(
                            //           flex: 4,
                            //           child: CustomDropdown(
                            //             options: kAllowedDiscountOptions,
                            //             value: kAllowedDiscountOptions.first,
                            //             onChanged: (String? value) {},
                            //           ),
                            //         ),
                            //         Flexible(
                            //           flex: 8,
                            //           child: CustomTextInput(
                            //             hintText: priceHint,
                            //             autovalidateMode:
                            //                 AutovalidateMode.onUserInteraction,
                            //             onChanged: (String value) {},
                            //             keyboardType: TextInputType.number,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            StoreConnector<AppState, ProductSetupViewModel>(
              converter: (Store<AppState> store) =>
                  ProductSetupViewModel.fromState(store.state),
              onInit: (Store<AppState> store) => context.dispatch(
                FetchCurrenciesAction(
                  client: AppWrapperBase.of(context)!.customClient,
                ),
              ),
              builder: (BuildContext context, ProductSetupViewModel vm) {
                if (context.isWaiting(SaveProductPricingAction)) {
                  return AppLoading();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: <Widget>[
                    PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.dispatch(
                            SaveProductPricingAction(
                              client: AppWrapperBase.of(context)!.customClient,
                              onSuccess: () =>
                                  context.router.push(ProductPricingRoute()),
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                            ),
                          );
                        }
                      },
                      child: d.right(saveString),
                    ),
                    SecondaryButton(
                      onPressed: () => context.router.maybePop(),
                      child: d.right(cancelString),
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
