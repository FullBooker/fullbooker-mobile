import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/models/currency.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/buttons.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_inputs.dart';

@RoutePage()
class EventCategoryPage extends StatefulWidget {
  final Product product;
  const EventCategoryPage({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _EventCategoryPageState();
}

class _EventCategoryPageState extends State<EventCategoryPage> {
  List<String> categories = <String>[
    'Early Bird',
    'Last Minute',
    'Standard',
    'VIP',
    'VVIP',
  ];
  Map<String, bool> selectionState = <String, bool>{
    'Early Bird': false,
    'Last Minute': false,
    'Standard': false,
    'VIP': false,
    'VVIP': false,
  };
  Map<String, TextEditingController> priceControllers =
      <String, TextEditingController>{};
  Map<String, TextEditingController> amountControllers =
      <String, TextEditingController>{};
  List<Currency> currencies = <Currency>[];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  Currency? selectedCurrency;
  List<String> selectedCategories = <String>[];
  Map<String, double> prices = <String, double>{};
  Map<String, int> amounts = <String, int>{};
  bool isLoading = false;

  void onContinueClick() {
    setState(() => isLoading = true);
    if (selectedCategories.isEmpty) {
      showSnackBar('Please select at least one category', context);
      setState(() => isLoading = false);
      return;
    }
    for (String category in selectedCategories) {
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
      prices = <String, double>{};
      amounts = <String, int>{};
      showSnackBar(
        "ensure you've set both prices and amounts for all selected categories",
        context,
        duration: 10000,
      );
      setState(() => isLoading = false);
      return;
    }

    context.router.push(
      TicketsSummaryRoute(
        product: widget.product,
        currency: selectedCurrency!,
        prices: prices,
        amounts: amounts,
        selectedCategories: selectedCategories,
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
        setState(() {
          currencies = currencies_;
          priceControllers = <String, TextEditingController>{
            for (String cat in categories) cat: TextEditingController(),
          };
          amountControllers = <String, TextEditingController>{
            for (String cat in categories) cat: TextEditingController(),
          };
        });
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
                  'How much will you charge for this event per ticket?',
                  '',
                  withLogo: false,
                  widthFactor: 0.9,
                  pageDescriptionPadding: 0,
                  pageTitleBottomPadding: 10,
                  pageDescriptionTopPadding: 0,
                  pageDescriptionFontSize: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            'Select a currency for this event',
                            softWrap: true,
                          ),
                        ),
                        if (currencies.isEmpty)
                          const Center(child: CircularProgressIndicator())
                        else
                          SizedBox(
                            width: 120,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomCard(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Select Ticket Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Wrap(
                          children: categories.map((String category) {
                            return SizedBox(
                              width: width / 2.5,
                              child: CheckboxListTile(
                                value: selectionState[category],
                                title: Text(category),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool? selected) {
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
                                              selectedCategories
                                                  .remove(category);
                                            });
                                          });
                                  }
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomCard(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Price Per Ticket Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Column(
                          children: selectedCategories.isEmpty
                              ? <Widget>[
                                  const Center(
                                    child:
                                        Text('Please select a ticket category'),
                                  ),
                                ]
                              : selectedCategories
                                  .map((String selectedCategory) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width / 2.5,
                                          child: Text(
                                            selectedCategory,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        if (selectedCurrency == null)
                                          const Center(
                                            child: Text(
                                              currencySelectGeneralPrompt,
                                            ),
                                          )
                                        else
                                          SizedBox(
                                            width: 120,
                                            height: 40,
                                            child: SimpleDoubleInput(
                                              controller: priceControllers[
                                                  selectedCategory]!,
                                              leading: Text(
                                                selectedCurrency!.code,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomCard(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Maximum number of tickets per category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Column(
                          children: selectedCategories.isEmpty
                              ? <Widget>[
                                  const Center(
                                    child:
                                        Text('Please select a ticket category'),
                                  ),
                                ]
                              : selectedCategories
                                  .map((String selectedCategory) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width / 2.5,
                                          child: Text(
                                            selectedCategory,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          height: 40,
                                          child: SimpleIntInput(
                                            controller: amountControllers[
                                                selectedCategory]!,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
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
                actionLabel: continueString,
                loading: isLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
