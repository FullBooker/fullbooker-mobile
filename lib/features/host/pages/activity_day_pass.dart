import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/activity_subscription.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/rounded_floating_action.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';

class SessionPricing {
  final double price;
  final int maxTickets;
  final Currency currency;

  const SessionPricing(
      {required this.price, required this.maxTickets, required this.currency});
}

class CustomSwitch extends StatefulWidget {
  final Function(bool)? onValueChanged;

  const CustomSwitch({super.key, this.onValueChanged});

  @override
  State<StatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSwitchOn ? 'Yes' : 'No',
          style: const TextStyle(fontSize: 18),
        ),
        Switch(
          value: isSwitchOn,
          onChanged: (bool value) {
            setState(() {
              isSwitchOn = value;
              if (widget.onValueChanged != null) widget.onValueChanged!(value);
            });
          },
        ),
      ],
    );
  }
}

class ActivityDayPass extends StatefulWidget {
  final Product product;
  final SessionPricing sessionPricing;

  const ActivityDayPass(
      {super.key, required this.product, required this.sessionPricing});

  @override
  State<StatefulWidget> createState() => _ActivityDayPass();
}

class _ActivityDayPass extends State<ActivityDayPass> {
  bool isLoading = false;
  List<Currency> currencies = [];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  Currency? selectedCurrency;
  var priceController = TextEditingController();
  var amountController = TextEditingController();
  bool setDayPass = false;

  void onContinueClick() {
    if (setDayPass) {
      if (priceController.text.isEmpty ||
          amountController.text.isEmpty ||
          selectedCurrency == null) {
        showSnackBar(
            "Please set the currency, price and maximum booking amount for the activity",
            context);
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ActivitySubscription(
                product: widget.product,
                dayPassPricing: SessionPricing(
                    price: double.parse(priceController.text),
                    maxTickets: int.parse(amountController.text),
                    currency: selectedCurrency!),
                sessionPricing: widget.sessionPricing)));
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ActivitySubscription(
              product: widget.product, sessionPricing: widget.sessionPricing)));
    });
  }

  void onDayPassSelectionChanged(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => setDayPass = value);
    });
  }

  @override
  void initState() {
    super.initState();
    currencyViewModel.repository.pullMultiple(1, 100).then((currencies_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => currencies = currencies_);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        bottomNavigationBar: const BottomNavBar(),
        body: Column(children: [
          Expanded(
              child: ListView(children: [
            Center(
              child: SizedBox(
                width: width * 0.8,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        child: const Text(
                            "Is there a day pass for your product",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      CustomSwitch(onValueChanged: onDayPassSelectionChanged)
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: SizedBox(
                  width: width * 0.8,
                  child: const RoundedDivider(
                    height: 2,
                    color: Color(0xfff55E00),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SizedBox(
                        width: width * 0.4,
                        child:
                            const Text("Select a currency for this activity")),
                    currencies.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: width * 0.4,
                            height: 30,
                            child: CustomDropdown(
                                label: "",
                                options: currencies
                                    .map((currency) => DropDownOption(
                                        currency.code, currency.id, () {}))
                                    .toList(),
                                onChanged: (option) {
                                  if (option != null) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      setState(() => selectedCurrency =
                                          currencies.firstWhere((currency) =>
                                              currency.id == option.id));
                                    });
                                  }
                                }))
                  ])),
            ),
            const Padding(
                padding: EdgeInsets.all(20),
                child: Row(children: [
                  RoundedFloatingAction("B", height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Day Pass",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  )
                ])),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (width - 20) * 0.5,
                        child: const Text(
                            "What is the price per person per day pass",
                            style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: selectedCurrency == null
                            ? Center(
                                child: SizedBox(
                                    width: (width - 20) * 0.3,
                                    child:
                                        const Text("Please select a currency")))
                            : SizedBox(
                                width: (width - 20) * 0.3,
                                height: 40,
                                child: SimpleDoubleInput(
                                    controller: priceController,
                                    leading: Text(selectedCurrency!.code))),
                      )
                    ])),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (width - 20) * 0.5,
                        child: const Text(
                            "Maximum number of tickets per day pass",
                            style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                            width: (width - 20) * 0.3,
                            height: 40,
                            child:
                                SimpleIntInput(controller: amountController)),
                      )
                    ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomCard(
                  child: Column(children: [
                    const Text("TOTAL CHARGEABLE (PER SESSION)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: width * 0.7,
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            "Amount (${selectedCurrency?.code ?? "_"})",
                                            softWrap: true,
                                            style:
                                                const TextStyle(fontSize: 18)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        priceController.text.isEmpty
                                            ? 0.toString()
                                            : priceController.text,
                                        style: const TextStyle(fontSize: 18)),
                                  )
                                ]),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Service Fee (5%)",
                                            softWrap: true,
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          (priceController.text.isEmpty
                                                  ? 0
                                                  : double.parse(priceController
                                                          .text) *
                                                      0.05)
                                              .toString(),
                                          style: const TextStyle(fontSize: 18)),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Total",
                                          style: TextStyle(
                                              color: Color(0xf008AE32),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          (priceController.text.isEmpty
                                                  ? 0
                                                  : double.parse(priceController
                                                          .text) *
                                                      1.05)
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color(0xf008AE32),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                    )
                                  ]),
                            )
                          ]),
                        ))
                  ]),
                )),
          ])),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
                child: Button(onContinueClick,
                    actionLabel: "Continue", loading: isLoading),
              ))
        ]));
  }
}
