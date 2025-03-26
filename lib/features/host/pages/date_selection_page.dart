import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/date_group.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/event_time_selection_card.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

@RoutePage()
class DateSelectionPage extends StatefulWidget {
  final Product product;
  final Map<String, Object?> location;

  const DateSelectionPage({
    super.key,
    required this.location,
    required this.product,
  });

  @override
  State<StatefulWidget> createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  DateGroup? startDate;
  DateGroup? endDate;
  bool isLoading = false;
  ProductController productController = ProductController();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: okThanksString,
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 340,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void onContinueClick() {
    if (startDate == null || endDate == null) {
      showSnackBar(selectStartEndDate);
      return;
    }
    setState(() => isLoading = true);
    productController
        .createAvailability(startDate!, endDate!, widget.product.id)
        .then((Map<String, Object?>? availability) {
      setState(() => isLoading = false);
      if (availability != null) {
        context.router.push(ImageSelectionRoute(product: widget.product));
      } else {
        showSnackBar(startBeforeEndDate);
      }
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
                const PageHeader(
                  whenWillThisEventHappen,
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
                  child: EventTimeSelectionCard(
                    title: timeStart,
                    width: width,
                    onValueChanged: (DateGroup date) =>
                        setState(() => startDate = date),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: EventTimeSelectionCard(
                    title: timeEnd,
                    width: width,
                    onValueChanged: (DateGroup date) =>
                        setState(() => endDate = date),
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
