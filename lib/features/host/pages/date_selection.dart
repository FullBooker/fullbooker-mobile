import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/image_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

class DateGroup {
  DateTime date;
  int hours;
  int minutes;

  DateGroup({required this.date, required this.hours, required this.minutes});
}

class EventTimeSelectionCard extends StatefulWidget {
  final double width;
  final String title;
  final Function(DateGroup)? onValueChanged;

  const EventTimeSelectionCard(
      {super.key, this.width = 100, this.title = "", this.onValueChanged});

  @override
  State<StatefulWidget> createState() => _EventTimeSelectionCard();
}

class _EventTimeSelectionCard extends State<EventTimeSelectionCard> {
  DateTime? selectedDate;
  int? hourSelected;
  int? minuteSelected;

  @override
  Widget build(BuildContext context) {
    if (selectedDate != null &&
        hourSelected != null &&
        minuteSelected != null) {
      if (widget.onValueChanged != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onValueChanged!(DateGroup(
              date: selectedDate!,
              hours: hourSelected!,
              minutes: minuteSelected!));
        });
      }
    }

    return CustomCard(
        child: Column(children: [
      Text(widget.title),
      SizedBox(
        width: widget.width / 2,
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.calendar_month, color: Color(0xf0FC8135)),
          ),
          SizedBox(
              width: 160,
              height: 25,
              child: CustomDropdown(
                  label: selectedDate == null ? "" : selectedDate.toString(),
                  onClick: () async {
                    var date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 2));
                    setState(() => selectedDate = date);
                  },
                  withNullOption: false))
        ]),
      ),
      SizedBox(
        width: widget.width - 40,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(children: [
              SizedBox(
                  width: (widget.width) / 2.5,
                  height: 42,
                  child: CustomDropdown(
                      label: "Hours",
                      options: List.generate(
                          23,
                          (idx) => DropDownOption(
                              (idx + 1).toString(), idx.toString(), () {})),
                      onChanged: (hour) => setState(() {
                            if (hour != null) {
                              hourSelected = int.parse(hour.name);
                            }
                          }))),
              SizedBox(
                  width: (widget.width) / 2.5,
                  height: 42,
                  child: CustomDropdown(
                      label: "Minutes",
                      options: List.generate(
                          59,
                          (idx) => DropDownOption(
                              (idx + 1).toString(), idx.toString(), () {})),
                      onChanged: (minutes) => setState(() {
                            if (minutes != null) {
                              minuteSelected = int.parse(minutes.name);
                            }
                          })))
            ])),
      )
    ]));
  }
}

class DateSelection extends StatefulWidget {
  final Product product;
  final Map<String, Object?> location;

  const DateSelection(
      {super.key, required this.location, required this.product});

  @override
  State<StatefulWidget> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateGroup? startDate;
  DateGroup? endDate;
  bool isLoading = false;
  var productController = ProductViewModel();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
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
      showSnackBar("Please select a start and end date");
      return;
    }
    setState(() => isLoading = true);
    productController
        .createAvailability(startDate!, endDate!, widget.product.id)
        .then((availability) {
      setState(() => isLoading = false);
      if (availability != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ImageSelection(product: widget.product)));
        });
      } else {
        showSnackBar("Please ensure start date is before end date");
      }
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
          const PageHeader("", "When will this event happen?",
              withLogo: false,
              widthFactor: 0.9,
              pageDescriptionPadding: 20,
              headerTopPadding: 0,
              pageTitleBottomPadding: 0,
              pageDescriptionFontSize: 13),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: EventTimeSelectionCard(
                  title: "What time will this event start?",
                  width: width,
                  onValueChanged: (date) => setState(() => startDate = date))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: EventTimeSelectionCard(
                  title: "What time will this event end?",
                  width: width,
                  onValueChanged: (date) => setState(() => endDate = date)))
        ])),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width / 8, vertical: 30),
              child: Button(onContinueClick,
                  actionLabel: "Continue", loading: isLoading),
            ))
      ]),
    );
  }
}
