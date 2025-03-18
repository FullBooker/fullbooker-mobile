import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/session_pricing.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_switch_widget.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/rounded_floating_action.dart';
import 'package:fullbooker/shared/widgets/old_text_inputs.dart';

@RoutePage()
class ActivitySubscriptionPage extends StatefulWidget {
  final Product product;
  final SessionPricing sessionPricing;
  final SessionPricing? dayPassPricing;

  const ActivitySubscriptionPage({
    super.key,
    required this.product,
    required this.sessionPricing,
    this.dayPassPricing,
  });

  @override
  State<StatefulWidget> createState() => _ActivitySubscription();
}

class _ActivitySubscription extends State<ActivitySubscriptionPage> {
  bool isLoading = false;
  bool setSub = false;

  void onSubSelectionChanged(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => setSub = value);
    });
  }

  List<Currency> currencies = <Currency>[];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  Currency? selectedCurrency;
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  ProductViewModel productController = ProductViewModel();

  void onContinueClick() {
    SessionPricing? subPricing;
    setState(() => isLoading = true);

    if (setSub) {
      if (priceController.text.isEmpty ||
          amountController.text.isEmpty ||
          selectedCurrency == null) {
        showSnackBar(
          'Please set the currency, price and maximum booking amount for the activity',
          context,
        );
        setState(() => isLoading = false);
        return;
      }
      subPricing = SessionPricing(
        price: double.parse(priceController.text),
        maxTickets: int.parse(amountController.text),
        currency: selectedCurrency!,
      );
    }

    productController
        .createActivityPricing(
      widget.product.id,
      widget.sessionPricing,
      widget.dayPassPricing,
      subPricing,
    )
        .then((List<Map<String, Object?>>? pricing) {
      if (pricing == null) {
        if (mounted) {
          showSnackBar('Failed to create pricing data for activity', context);
        }
        setState(() => isLoading = false);
        return;
      }

      setState(() => isLoading = false);

      context.router
          .push(HostProductSummaryRoute(host: widget.product.host.id));
    });
  }

  @override
  void initState() {
    super.initState();
    currencyViewModel.repository
        .pullMultiple(1, 100)
        .then((List<Currency> currencies_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => currencies = currencies_);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      bottomNavigationBar: const OldBottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.5,
                          child: const Text(
                            'Is there a monthly subscription',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CustomSwitchWidget(
                          onValueChanged: onSubSelectionChanged,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: SizedBox(
                    width: width * 0.8,
                    child: RoundedDivider(
                      height: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.4,
                          child: const Text(currencySelectGeneralPrompt),
                        ),
                        if (currencies.isEmpty)
                          const Center(child: AppLoading())
                        else
                          SizedBox(
                            width: width * 0.4,
                            height: 30,
                            child: CustomDropdown(
                              options: currencies
                                  .map(
                                    (Currency currency) => DropDownOption(
                                      currency.code,
                                      currency.id,
                                      () {},
                                    ),
                                  )
                                  .toList(),
                              onChanged: (DropDownOption? option) {
                                if (option != null) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    setState(
                                      () => selectedCurrency =
                                          currencies.firstWhere(
                                        (Currency currency) =>
                                            currency.id == option.id,
                                      ),
                                    );
                                  });
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      RoundedFloatingAction('C', height: 40),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Monthly Subscription',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: (width - 20) * 0.5,
                        child: const Text(
                          'What is the price per person per subscription',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: selectedCurrency == null
                            ? Center(
                                child: SizedBox(
                                  width: (width - 20) * 0.3,
                                  child:
                                      const Text(currencySelectGeneralPrompt),
                                ),
                              )
                            : SizedBox(
                                width: (width - 20) * 0.3,
                                height: 40,
                                child: SimpleDoubleInput(
                                  controller: priceController,
                                  leading: Text(selectedCurrency!.code),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: (width - 20) * 0.5,
                        child: const Text(
                          'Maximum number of tickets per day pass',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: (width - 20) * 0.3,
                          height: 40,
                          child: SimpleIntInput(controller: amountController),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomCard(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'TOTAL CHARGEABLE (PER SESSION)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: width * 0.7,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Amount (${selectedCurrency?.code ?? "_"})",
                                            softWrap: true,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        priceController.text.isEmpty
                                            ? 0.toString()
                                            : priceController.text,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            serviceFee(kPlatformServiceFee),
                                            softWrap: true,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          (priceController.text.isEmpty
                                                  ? 0
                                                  : double.parse(
                                                        priceController.text,
                                                      ) *
                                                      0.05)
                                              .toString(),
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                            color: Color(0xf008AE32),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          (priceController.text.isEmpty
                                                  ? 0
                                                  : double.parse(
                                                        priceController.text,
                                                      ) *
                                                      1.05)
                                              .toString(),
                                          style: const TextStyle(
                                            color: Color(0xf008AE32),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: OldButton(
                onContinueClick,
                actionLabel: publish,
                loading: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
