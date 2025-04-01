import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductDateTimePage extends StatefulWidget {
  const ProductDateTimePage({super.key});

  @override
  State<ProductDateTimePage> createState() => _ProductDateTimePageState();
}

class _ProductDateTimePageState extends State<ProductDateTimePage> {
  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;

  Future<void> _pickDate({required bool isStart}) async {
    final DateTime initialDate =
        isStart ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _pickTime({required bool isStart}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: <Widget>[
                      Text(
                        dateAndTime,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        dateAndTimeCopy,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickDate(isStart: true),
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                starting,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 12,
                                  children: <Widget>[
                                    HeroIcon(
                                      HeroIcons.calendar,
                                      size: 20,
                                      color: AppColors.bodyTextColor,
                                    ),
                                    if (_startDate != null)
                                      humanizeDate(
                                        loadedDate: _startDate
                                                ?.toIso8601String() ??
                                            DateTime.now().toIso8601String(),
                                        dateTextStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    else
                                      Text(
                                        selectDateHint,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickTime(isStart: true),
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                atString,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 12,
                                  children: <Widget>[
                                    HeroIcon(
                                      HeroIcons.clock,
                                      size: 20,
                                      color: AppColors.bodyTextColor,
                                    ),
                                    if (_startTime != null)
                                      formatTime(
                                        timeOfDay: _startTime,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    else
                                      Text(
                                        chooseTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
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

                  // Ends on
                  Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickDate(isStart: false),
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                ending,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 12,
                                  children: <Widget>[
                                    HeroIcon(
                                      HeroIcons.calendar,
                                      size: 20,
                                      color: AppColors.bodyTextColor,
                                    ),
                                    if (_endDate != null)
                                      humanizeDate(
                                        loadedDate: _endDate
                                                ?.toIso8601String() ??
                                            DateTime.now().toIso8601String(),
                                        dateTextStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    else
                                      Text(
                                        selectDateHint,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickTime(isStart: false),
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                atString,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  spacing: 12,
                                  children: <Widget>[
                                    HeroIcon(
                                      HeroIcons.clock,
                                      size: 20,
                                      color: AppColors.bodyTextColor,
                                    ),
                                    if (_endTime != null)
                                      formatTime(
                                        timeOfDay: _endTime,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    else
                                      Text(
                                        chooseTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
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
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductPhotosRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
