import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';

class TimeSelectionCard extends StatelessWidget {
  const TimeSelectionCard({
    super.key,
    this.onHourSelected,
    this.onMinuteSelected,
  });

  final void Function(int)? onMinuteSelected;
  final void Function(int)? onHourSelected;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return CustomCard(
      child: Column(
        children: <Widget>[
          Text(
            activityLengthString,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            width: width - 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: width / 2.8,
                    height: 42,
                    child: OldCustomDropdown(
                      label: hoursString,
                      options: List<OldDropDownOption>.generate(
                        23,
                        (int idx) => OldDropDownOption(
                          (idx + 1).toString(),
                          idx.toString(),
                          () {},
                        ),
                      ),
                      onChanged: (OldDropDownOption? hour) {
                        if (hour != null && onHourSelected != null) {
                          onHourSelected!(int.parse(hour.name));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 2.8,
                    height: 42,
                    child: OldCustomDropdown(
                      label: minutesString,
                      options: List<OldDropDownOption>.generate(
                        59,
                        (int idx) => OldDropDownOption(
                          (idx + 1).toString(),
                          idx.toString(),
                          () {},
                        ),
                      ),
                      onChanged: (OldDropDownOption? minutes) {
                        if (minutes != null && onMinuteSelected != null) {
                          onMinuteSelected!(int.parse(minutes.name));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
