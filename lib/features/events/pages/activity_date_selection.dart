import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/events/controllers/days_controller.dart';
import 'package:fullbooker/features/events/controllers/product_controller.dart';
import 'package:fullbooker/features/events/models/days.dart';
import 'package:fullbooker/features/events/models/product.dart';
import 'package:fullbooker/features/events/pages/category_selection.dart';
import 'package:fullbooker/features/events/pages/image_selection.dart';
import 'package:fullbooker/shared/widgets/appbar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:flutter/foundation.dart';

class TimeSelectionCard extends StatelessWidget {
  final void Function(int)? onMinuteSelected;
  final void Function(int)? onHourSelected;

  const TimeSelectionCard(
      {super.key, this.onHourSelected, this.onMinuteSelected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomCard(
        child: Column(
      children: [
        const Text("How long is the activity",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
        SizedBox(
            width: width - 40,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: (width) / 2.8,
                          height: 42,
                          child: CustomDropdown(
                              label: "Hours",
                              options: List.generate(
                                  23,
                                  (idx) => DropDownOption((idx + 1).toString(),
                                      idx.toString(), () {})),
                              onChanged: (hour) {
                                if (hour != null && onHourSelected != null) {
                                  onHourSelected!(int.parse(hour.name));
                                }
                              })),
                      SizedBox(
                          width: (width) / 2.8,
                          height: 42,
                          child: CustomDropdown(
                              label: "Minutes",
                              options: List.generate(
                                  59,
                                  (idx) => DropDownOption((idx + 1).toString(),
                                      idx.toString(), () {})),
                              onChanged: (minutes) {
                                if (minutes != null &&
                                    onMinuteSelected != null) {
                                  onMinuteSelected!(int.parse(minutes.name));
                                }
                              }))
                    ]))),
      ],
    ));
  }
}

class ActivityDateSelection extends StatefulWidget {
  final Product product;
  final Map<String, Object?> location;

  const ActivityDateSelection(
      {super.key, required this.product, required this.location});

  @override
  State<StatefulWidget> createState() => _ActivityDateSelectionState();
}

class _ActivityDateSelectionState extends State<ActivityDateSelection> {
  bool isLoading = false;
  int? hourSelected;
  int? minuteSelected;
  List<Days>? days;
  var daysController = DaysViewModel();
  var productController = ProductViewModel();
  Map<String, TimeOfDay> startTimes = {};
  Map<String, TimeOfDay> endTimes = {};
  List<DateTime> closedDays = [];

  void onContinueClick() {
    if (hourSelected == null || minuteSelected == null) {
      showSnackBar("Please set how long the activity is", context);
      return;
    }
    if (startTimes.isEmpty || endTimes.isEmpty) {
      showSnackBar(
          "Please set both start and endtime for at least one day of the week",
          context);
      return;
    }

    setState(() => isLoading = true);
    var startTimesKeys = startTimes.keys.toList();
    startTimesKeys.sort();
    var endTimesKeys = endTimes.keys.toList();
    endTimesKeys.sort();

    if (!listEquals(startTimesKeys, endTimesKeys)) {
      showSnackBar(
          "Please set both the start and end times for the days you've selected",
          context);
      setState(() => isLoading = true);
      return;
    }

    productController
        .createActivityAvailability(
            widget.product.id, startTimes, endTimes, closedDays)
        .then((availability) {
      if (availability == null) {
        if (mounted) {
          showSnackBar("Failed to create availability for activity", context);
        }
        setState(() => isLoading = false);
        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ImageSelection(
                product: widget.product, type: ProductTypes.Activity)));
      });
    });
  }

  void fetchDays() {
    daysController.repository
        .pullMultiple(1, 100, processResponseAsPage: false)
        .then((days_) {
      setState(() => days = days_);
    });
  }

  void setStartTimeForDay(String dayId, TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => startTimes[dayId] = timeOfDay);
      });
    }
  }

  void setEndTimeForDay(String dayId, TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => endTimes[dayId] = timeOfDay);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchDays());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const ProductSetupNavBar(step: ProductSteps.Products),
        body: Center(
            child: Column(children: [
          Expanded(
              child: ListView(children: [
            const PageHeader("", "When does this activity happen?",
                withLogo: false,
                widthFactor: 0.9,
                pageDescriptionPadding: 20,
                headerTopPadding: 0,
                pageTitleBottomPadding: 0,
                pageDescriptionFontSize: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TimeSelectionCard(
                  onMinuteSelected: (minute) =>
                      setState(() => minuteSelected = minute),
                  onHourSelected: (hour) =>
                      setState(() => hourSelected = hour)),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomCard(
                    child: Column(children: [
                  const Text("Select the days of the week that you are open",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                  if (days == null)
                    const Center(child: CircularProgressIndicator())
                  else
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Row(children: [
                          const Expanded(child: SizedBox()),
                          SizedBox(
                              width: (width - 30) / 4,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(child: Text("Start Time")),
                              )),
                          SizedBox(
                              width: (width - 30) / 4,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(child: Text("End Time")),
                              ))
                        ])),
                  for (var day in days ?? [])
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(day.name,
                                  style: const TextStyle(fontSize: 16),
                                  textScaler: TextScaler.linear(
                                      ScaleSize.textScaleFactor(context,
                                          maxTextScaleFactor: 2.6)))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                                width: (width - 30) / 4,
                                height: 42,
                                child: CustomDropdown(
                                  onlyLabelContent: true,
                                  label: startTimes[day.id] != null
                                      ? startTimes[day.id]!.format(context)
                                      : "",
                                  withNullOption: false,
                                  onClick: () => showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((time) =>
                                          setStartTimeForDay(day.id, time)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                                width: (width - 30) / 4,
                                height: 42,
                                child: CustomDropdown(
                                  onlyLabelContent: true,
                                  label: endTimes[day.id] != null
                                      ? endTimes[day.id]!.format(context)
                                      : "",
                                  withNullOption: false,
                                  onClick: () => showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((time) =>
                                          setEndTimeForDay(day.id, time)),
                                )),
                          )
                        ],
                      ),
                    ),
                ]))),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomCard(
                    child: Column(children: [
                  const Text(
                      "Choose the specific days of the year when "
                      "your activity will  remain closed (Optional)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                  Center(
                    child: Row(children: [
                      SizedBox(
                          width: (width - 30) / 2,
                          child: Row(children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.calendar_month,
                                  color: Color(0xf0FC8135)),
                            ),
                            SizedBox(
                                width: (width - 40) / 4,
                                height: 25,
                                child: CustomDropdown(
                                    label: "",
                                    onClick: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(
                                              DateTime.now().year + 2));
                                      setState(() {
                                        if (date != null) closedDays.add(date);
                                      });
                                    },
                                    withNullOption: false))
                          ])),
                      DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: SizedBox(
                              height: 120,
                              width: 140,
                              child: Column(children: [
                                const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text("Activity Not Open On")),
                                const RoundedDivider(
                                  height: 1,
                                  color: Color(0xf0FC8135),
                                ),
                                Expanded(
                                  child: ListView(
                                      shrinkWrap: true,
                                      children: List.generate(closedDays.length,
                                          (idx) {
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 4),
                                            child: Center(
                                              child: Text(
                                                  "${closedDays[idx].year}/"
                                                  "${closedDays[idx].month}/"
                                                  "${closedDays[idx].day}"),
                                            ));
                                      })),
                                )
                              ])))
                    ]),
                  )
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
        ])));
  }
}
