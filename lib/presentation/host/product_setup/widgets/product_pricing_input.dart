import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/clear_selected_price_action.dart';
import 'package:fullbooker/application/redux/actions/fetch_currencies_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_selected_pricing_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_breakdown_widget.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/custom_dropdown.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';

class PricingInput extends StatelessWidget {
  const PricingInput({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      onInit: (Store<AppState> store) =>
          context.dispatchAll(<ReduxAction<AppState>>[
        ClearSelectedPriceAction(),
        FetchCurrenciesAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      ]),
      builder: (BuildContext context, ProductSetupViewModel vm) {
        final String selectedCurrencyCode =
            vm.selectedCurrency?.code ?? UNKNOWN;

        bool _isValidCode(String code) => code.isNotEmpty && code != UNKNOWN;

        final String selectedCurrency = _isValidCode(selectedCurrencyCode)
            ? selectedCurrencyCode
            : vm.currencies
                    ?.firstWhere(
                      (Currency? c) => _isValidCode(c?.code ?? UNKNOWN),
                      orElse: () => null,
                    )
                    ?.code ??
                UNKNOWN;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: <Widget>[
                Text(
                  priceString,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  spacing: 12,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: CustomDropdown(
                        isLoading: context.isWaiting(FetchCurrenciesAction),
                        options: vm.currencies
                                ?.whereType<Currency>()
                                .map(
                                  (Currency c) => c.code ?? UNKNOWN,
                                )
                                .where(
                                  (String code) =>
                                      code.isNotEmpty && code != UNKNOWN,
                                )
                                .toList() ??
                            <String>[],
                        value:
                            (vm.selectedCurrency?.code?.isNotEmpty ?? false) &&
                                    vm.selectedCurrency?.code != UNKNOWN
                                ? vm.selectedCurrency!.code!
                                : (vm.currencies
                                        ?.firstWhere(
                                          (Currency? c) =>
                                              (c?.code?.isNotEmpty ?? false) &&
                                              c?.code != UNKNOWN,
                                          orElse: () => null,
                                        )
                                        ?.code ??
                                    UNKNOWN),
                        onChanged: (String? value) {
                          if (value != null && value.isNotEmpty) {
                            final Currency? selected =
                                vm.currencies?.firstWhere(
                              (Currency? c) => c?.code == value,
                              orElse: () => null,
                            );
                            if (selected != null) {
                              context.dispatchAll(<ReduxAction<AppState>>[
                                UpdateHostStateAction(
                                  selectedCurrency: selected,
                                ),
                                UpdateSelectedPricingAction(
                                  currency: selected.code ?? UNKNOWN,
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
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: Validators.validateAmount,
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
                buyerPaysFee: vm.selectedPricing?.buyerPaysFee ?? false,
                onToggleFeeResponsibility: () {
                  context.dispatch(
                    UpdateSelectedPricingAction(
                      buyerPaysFee: !vm.buyerPaysFee,
                    ),
                  );
                },
                selectedCurrency: selectedCurrency,
              ),
          ],
        );
      },
    );
  }
}
