import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/tickets_summary.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';

class EventCategory extends StatefulWidget {
  final Product product;
  const EventCategory({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
  List<String> categories = [
    "Early Bird",
    "Last Minute",
    "Standard",
    "VIP",
    "VVIP"
  ];
  Map<String, bool> selectionState = {
    "Early Bird": false,
    "Last Minute": false,
    "Standard": false,
    "VIP": false,
    "VVIP": false
  };
  Map<String, TextEditingController> priceControllers = {};
  Map<String, TextEditingController> amountControllers = {};
  List<Currency> currencies = [];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  Currency? selectedCurrency;
  List<String> selectedCategories = [];
  Map<String, double> prices = {};
  Map<String, int> amounts = {};
  bool isLoading = false;

  void onContinueClick() {
    setState(() => isLoading = true);
    if (selectedCategories.isEmpty) {
      showSnackBar("Please select at least one category", context);
      setState(() => isLoading = false);
      return;
    }
    for (var category in selectedCategories) {
      if (priceControllers[category]!.text.isNotEmpty) {
        prices[category] = double.parse(priceControllers[category]!.text);
      }
      if (amountControllers[category]!.text.isNotEmpty) {
        amounts[category] = int.parse(amountControllers[category]!.text);
      }
    }
    if (selectedCurrency == null ||
        prices.keys.length != selectedCategories.length ||
        amounts.keys.length != selectedCategories.length) {
      prices = {};
      amounts = {};
      showSnackBar(
          "ensure you've set both prices and amounts for all selected categories",
          context,
          duration: 10000);
      setState(() => isLoading = false);
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => TicketsSummary(
            product: widget.product,
            currency: selectedCurrency!,
            prices: prices,
            amounts: amounts,
            selectedCategories: selectedCategories)));
  }

  @override
  void initState() {
    super.initState();
    currencyViewModel.repository
        .pullMultiple(1, 100, processResponseAsPage: false)
        .then((currencies_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          currencies = currencies_;
          priceControllers = {
            for (var cat in categories) cat: TextEditingController()
          };
          amountControllers = {
            for (var cat in categories) cat: TextEditingController()
          };
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        body: Column(children: [
          Expanded(
              child: ListView(children: [
            const PageHeader(
                "", "How much will you charge for this event per ticket?",
                withLogo: false,
                widthFactor: 0.9,
                pageDescriptionPadding: 20,
                headerTopPadding: 0,
                pageTitleBottomPadding: 0,
                pageDescriptionFontSize: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const Text("Select a currency for this event"),
                    currencies.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: 120,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomCard(
                child: Column(children: [
                  const Text("Select Ticket Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Wrap(
                      children: categories.map((category) {
                    return SizedBox(
                      width: width / 2.5,
                      child: CheckboxListTile(
                          value: selectionState[category],
                          title: Text(category),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (selected) {
                            if (selected != null) {
                              selected
                                  ? WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                      setState(() {
                                        selectionState[category] = true;
                                        selectedCategories.add(category);
                                      });
                                    })
                                  : WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                      setState(() {
                                        selectionState[category] = false;
                                        selectedCategories.remove(category);
                                      });
                                    });
                            }
                          }),
                    );
                  }).toList()),
                ]),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomCard(
                    child: Column(children: [
                  const Text("Price Per Ticket Category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Column(
                      children: selectedCategories.isEmpty
                          ? [
                              const Center(
                                  child:
                                      Text("Please select a ticket category"))
                            ]
                          : selectedCategories.map((selectedCategory) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 2.5,
                                      child: Text(selectedCategory,
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    selectedCurrency == null
                                        ? const Center(
                                            child: Text(
                                                "Please select a currency"))
                                        : SizedBox(
                                            width: 120,
                                            height: 40,
                                            child: SimpleDoubleInput(
                                                controller: priceControllers[
                                                    selectedCategory]!,
                                                leading: Text(
                                                    selectedCurrency!.code)))
                                  ],
                                ),
                              );
                            }).toList())
                ]))),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomCard(
                    child: Column(children: [
                  const Text("Maximum number of tickets per category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Column(
                      children: selectedCategories.isEmpty
                          ? [
                              const Center(
                                  child:
                                      Text("Please select a ticket category"))
                            ]
                          : selectedCategories.map((selectedCategory) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 2.5,
                                      child: Text(selectedCategory,
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    SizedBox(
                                        width: 120,
                                        height: 40,
                                        child: SimpleIntInput(
                                            controller: amountControllers[
                                                selectedCategory]!))
                                  ],
                                ),
                              );
                            }).toList())
                ])))
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
