import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_currencies_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/currency.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
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
    const double buyerPay = 2825;
    const double revenue = 2500;
    const double serviceFee = 2500;
    const double totalPrice = 2825;

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
                                SvgPicture.asset(standardTicketIconSVGPath),
                                Text(
                                  vip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
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
                                style: Theme.of(context).textTheme.titleMedium,
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
                                                    ?.map(
                                                      (Currency? c) =>
                                                          c?.code ?? UNKNOWN,
                                                    )
                                                    .where(
                                                      (String code) =>
                                                          code.isNotEmpty,
                                                    )
                                                    .toList() ??
                                                <String>[],
                                            value: vm.selectedCurrencyCode
                                                        .isNotEmpty ==
                                                    true
                                                ? vm.selectedCurrencyCode
                                                : (vm.currencies?.first?.code ??
                                                    UNKNOWN),
                                            onChanged: (String? value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                context.dispatch(
                                                  UpdateHostStateAction(
                                                    selectedCurrencyCode: value,
                                                  ),
                                                );
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
                                      onChanged: (String value) {},
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ), // Orange border
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16,
                              children: <Widget>[
                                Text(
                                  pricingBreakdown,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      serviceFeeLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      serviceFee.toStringAsFixed(0),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      yourBuyers,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      buyerPay.toStringAsFixed(0),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      yourRevenue,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      revenue.toStringAsFixed(0),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: AppColors.greenColor,
                                          ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    // TODO(abiud): save this value to state for the current product
                                  },
                                  highlightColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.1),
                                  splashColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.1),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      spacing: 12,
                                      children: <Widget>[
                                        Icon(
                                          Icons.check_box,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          iWantBuyersToPay,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      totalString,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      totalPrice.toStringAsFixed(0),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          CustomTextInput(
                            hintText: maxTicketsHint,
                            labelText: maximumTickets(vip),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (String value) {},
                            keyboardType: TextInputType.number,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: <Widget>[
                              Text(
                                discountLabel,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                spacing: 12,
                                children: <Widget>[
                                  Flexible(
                                    flex: 4,
                                    child: CustomDropdown(
                                      options: kAllowedDiscountOptions,
                                      value: kAllowedDiscountOptions.first,
                                      onChanged: (String? value) {},
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: CustomTextInput(
                                      hintText: priceHint,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: (String value) {},
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                context.router.push(ProductPricingRoute());
              },
              child: d.right(saveString),
            ),
            SecondaryButton(
              onPressed: () {
                context.router.maybePop();
              },
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
