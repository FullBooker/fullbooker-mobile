import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/features/host/controllers/days_controller.dart';
import 'package:fullbooker/features/host/controllers/product_controller.dart';
import 'package:fullbooker/features/host/models/days.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/features/host/pages/image_selection_page.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/product_setup_nav_bar.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:flutter/foundation.dart';
import 'package:fullbooker/shared/widgets/scale_locked_text.dart';
import 'package:fullbooker/shared/widgets/time_selection_card.dart';

class ActivityDateSelectionPage extends StatefulWidget {
  const ActivityDateSelectionPage({
    super.key,
    required this.product,
    required this.location,
  });

  final Map<String, Object?> location;
  final Product product;

  @override
  State<StatefulWidget> createState() => _ActivityDateSelectionPageState();
}

class _ActivityDateSelectionPageState extends State<ActivityDateSelectionPage> {
  List<DateTime> closedDays = <DateTime>[];
  List<Days>? days;
  DaysViewModel daysController = DaysViewModel();
  Map<String, TimeOfDay> endTimes = <String, TimeOfDay>{};
  int? hourSelected;
  bool isLoading = false;
  int? minuteSelected;
  ProductViewModel productController = ProductViewModel();
  Map<String, TimeOfDay> startTimes = <String, TimeOfDay>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchDays());
  }

  void onContinueClick() {
    if (hourSelected == null || minuteSelected == null) {
      showSnackBar('Please set how long the activity is', context);
      return;
    }
    if (startTimes.isEmpty || endTimes.isEmpty) {
      showSnackBar(
        'Please set both start and endtime for at least one day of the week',
        context,
      );
      return;
    }

    setState(() => isLoading = true);
    final List<String> startTimesKeys = startTimes.keys.toList();
    startTimesKeys.sort();
    final List<String> endTimesKeys = endTimes.keys.toList();
    endTimesKeys.sort();

    if (!listEquals(startTimesKeys, endTimesKeys)) {
      showSnackBar(
        "Please set both the start and end times for the days you've selected",
        context,
      );
      setState(() => isLoading = true);
      return;
    }

    productController
        .createActivityAvailability(
      widget.product.id,
      startTimes,
      endTimes,
      closedDays,
    )
        .then((Map<String, Object?>? availability) {
      if (availability == null) {
        if (mounted) {
          showSnackBar('Failed to create availability for activity', context);
        }
        setState(() => isLoading = false);
        return;
      }

      setState(() => isLoading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute<ImageSelectionPage>(
            builder: (_) => ImageSelectionPage(
              product: widget.product,
              type: ProductTypes.Activity,
            ),
          ),
        );
      });
    });
  }

  void fetchDays() {
    daysController.repository
        .pullMultiple(1, 100, processResponseAsPage: true)
        .then((List<Days> days_) {
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
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductSetupNavBar(step: ProductSteps.Products),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  const PageHeader(
                    '',
                    'When does this activity happen?',
                    withLogo: false,
                    widthFactor: 0.9,
                    pageDescriptionPadding: 20,
                    headerTopPadding: 0,
                    pageTitleBottomPadding: 0,
                    pageDescriptionFontSize: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TimeSelectionCard(
                      onMinuteSelected: (int minute) =>
                          setState(() => minuteSelected = minute),
                      onHourSelected: (int hour) =>
                          setState(() => hourSelected = hour),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: CustomCard(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Select the days of the week that you are open',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                          if (days == null)
                            const Center(child: CircularProgressIndicator())
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Row(
                                children: <Widget>[
                                  const Expanded(child: SizedBox()),
                                  SizedBox(
                                    width: (width - 30) / 4,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(child: Text('Start Time')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (width - 30) / 4,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(child: Text('End Time')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          for (Days day in days ?? <dynamic>[])
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      day.name,
                                      style: const TextStyle(fontSize: 16),
                                      textScaler: TextScaler.linear(
                                        ScaleSize.textScaleFactor(
                                          context,
                                          maxTextScaleFactor: 2.6,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: SizedBox(
                                      width: (width - 30) / 4,
                                      height: 42,
                                      child: CustomDropdown(
                                        onlyLabelContent: true,
                                        label: startTimes[day.id] != null
                                            ? startTimes[day.id]!
                                                .format(context)
                                            : '',
                                        withNullOption: false,
                                        onClick: () => showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then(
                                          (TimeOfDay? time) =>
                                              setStartTimeForDay(day.id, time),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: SizedBox(
                                      width: (width - 30) / 4,
                                      height: 42,
                                      child: CustomDropdown(
                                        onlyLabelContent: true,
                                        label: endTimes[day.id] != null
                                            ? endTimes[day.id]!.format(context)
                                            : '',
                                        withNullOption: false,
                                        onClick: () => showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then(
                                          (TimeOfDay? time) =>
                                              setEndTimeForDay(day.id, time),
                                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: CustomCard(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Choose the specific days of the year when '
                            'your activity will  remain closed (Optional)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: (width - 30) / 2,
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Color(0xf0FC8135),
                                        ),
                                      ),
                                      SizedBox(
                                        width: (width - 40) / 4,
                                        height: 25,
                                        child: CustomDropdown(
                                          onClick: () async {
                                            final DateTime? date =
                                                await showDatePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(
                                                DateTime.now().year + 2,
                                              ),
                                            );
                                            setState(() {
                                              if (date != null) {
                                                closedDays.add(date);
                                              }
                                            });
                                          },
                                          withNullOption: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SizedBox(
                                    height: 120,
                                    width: 140,
                                    child: Column(
                                      children: <Widget>[
                                        const Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            child: ScaleLockedText(
                                              'Activity Not Open On',
                                              softWrap: true,
                                            ),
                                          ),
                                        ),
                                        const RoundedDivider(
                                          height: 1,
                                          color: Color(0xf0FC8135),
                                        ),
                                        Expanded(
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: List<Padding>.generate(
                                                closedDays.length, (int idx) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 4,
                                                ),
                                                child: Center(
                                                  child: ScaleLockedText(
                                                      '${closedDays[idx].year}/'
                                                      '${closedDays[idx].month}/'
                                                      '${closedDays[idx].day}'),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
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
      ),
    );
  }
}
