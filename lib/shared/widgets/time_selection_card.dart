import 'package:flutter/material.dart';
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
          const Text(
            'How long is the activity',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
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
                    child: CustomDropdown(
                      label: 'Hours',
                      options: List<DropDownOption>.generate(
                        23,
                        (int idx) => DropDownOption(
                          (idx + 1).toString(),
                          idx.toString(),
                          () {},
                        ),
                      ),
                      onChanged: (DropDownOption? hour) {
                        if (hour != null && onHourSelected != null) {
                          onHourSelected!(int.parse(hour.name));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 2.8,
                    height: 42,
                    child: CustomDropdown(
                      label: 'Minutes',
                      options: List<DropDownOption>.generate(
                        59,
                        (int idx) => DropDownOption(
                          (idx + 1).toString(),
                          idx.toString(),
                          () {},
                        ),
                      ),
                      onChanged: (DropDownOption? minutes) {
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
