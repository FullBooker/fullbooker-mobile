import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/currency_controller.dart';
import 'package:fullbooker/features/host/models/old_currency.dart';
import 'package:fullbooker/features/host/models/old_product.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/old_text_inputs.dart';

@RoutePage()
class EventCategoryPage extends StatefulWidget {
  final OldProduct product;
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
  List<OldCurrency> currencies = <OldCurrency>[];
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  OldCurrency? selectedCurrency;
  List<String> selectedCategories = <String>[];
  Map<String, double> prices = <String, double>{};
  Map<String, int> amounts = <String, int>{};
  bool isLoading = false;

  void onContinueClick() {
    setState(() => isLoading = true);
    if (selectedCategories.isEmpty) {
      showSnackBar(selectCategoryError, context);
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
        ensurePricesForCategories,
        context,
      );
      setState(() => isLoading = false);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    currencyViewModel.repository
        .pullMultiple(1, 100)
        .then((List<OldCurrency> currencies_) {
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const PageHeader(
                  howMuchPerTicket,
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
                            selectCurrencyForEvent,
                            softWrap: true,
                          ),
                        ),
                        if (currencies.isEmpty)
                          const Center(child: AppLoading())
                        else
                          SizedBox(
                            width: 120,
                            height: 30,
                            child: OldCustomDropdown(
                              options: currencies
                                  .map(
                                    (OldCurrency currency) => OldDropDownOption(
                                      currency.code,
                                      currency.id,
                                      () {},
                                    ),
                                  )
                                  .toList(),
                              onChanged: (OldDropDownOption? option) {
                                if (option != null) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    setState(
                                      () => selectedCurrency =
                                          currencies.firstWhere(
                                        (OldCurrency currency) =>
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
                        Text(
                          selectTicketCategories,
                          style: Theme.of(context).textTheme.headlineSmall,
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
                        Text(
                          pricePerTicketCategory,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Column(
                          children: selectedCategories.isEmpty
                              ? <Widget>[
                                  const Center(
                                    child: Text(selectTicketCategoryPrompt),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
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
                        Text(
                          maxTicketsPerCategory,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Column(
                          children: selectedCategories.isEmpty
                              ? <Widget>[
                                  const Center(
                                    child: Text(pleaseSelectTicketCategory),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
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
              child: OldButton(
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
