import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/session_pricing.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/rounded_floating_action.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';

@RoutePage()
class ActivityPricingPage extends StatefulWidget {
  final Product product;

  const ActivityPricingPage({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ActivityPricingPageState();
}

class _ActivityPricingPageState extends State<ActivityPricingPage> {
  bool isLoading = false;
  List<Currency> currencies = <Currency>[];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  Currency? selectedCurrency;
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void onContinueClick() {
    if (priceController.text.isEmpty ||
        amountController.text.isEmpty ||
        selectedCurrency == null) {
      showSnackBar(
        'Please set the currency, price and maximum booking amount for the activity',
        context,
      );
      return;
    }

    context.router.push(
      ActivityDayPassRoute(
        product: widget.product,
        sessionPricing: SessionPricing(
          price: double.parse(priceController.text),
          maxTickets: int.parse(amountController.text),
          currency: selectedCurrency!,
        ),
      ),
    );
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
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const PageHeader(
                  'How much will the activity cost',
                  '',
                  withLogo: false,
                  widthFactor: 0.9,
                  pageDescriptionPadding: 0,
                  headerTopPadding: 30,
                  pageTitleBottomPadding: 10,
                  pageDescriptionFontSize: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.4,
                          child:
                              const Text('Select a currency for this activity'),
                        ),
                        if (currencies.isEmpty)
                          const Center(child: CircularProgressIndicator())
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
                      RoundedFloatingAction('A', height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Cost per session',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
                          'What is the price per person per session',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: selectedCurrency == null
                            ? Center(
                                child: SizedBox(
                                  width: width * 0.3,
                                  child: const Text('Please select a currency'),
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
                          'Maximum number of tickets per session',
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
                                      const Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Service Fee (5%)',
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
              child: Button(
                onContinueClick,
                actionLabel: 'Continue',
                loading: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
