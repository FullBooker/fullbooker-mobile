import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/shared/entities/date_group.dart';
import 'package:fullbooker/shared/widgets/card.dart';
import 'package:fullbooker/shared/widgets/dropdown.dart';

class EventTimeSelectionCard extends StatefulWidget {
  final double width;
  final String title;
  final Function(DateGroup)? onValueChanged;

  const EventTimeSelectionCard({
    super.key,
    this.width = 100,
    this.title = '',
    this.onValueChanged,
  });

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
          widget.onValueChanged!(
            DateGroup(
              date: selectedDate!,
              hours: hourSelected!,
              minutes: minuteSelected!,
            ),
          );
        });
      }
    }

    return CustomCard(
      child: Column(
        children: <Widget>[
          Text(widget.title),
          SizedBox(
            width: widget.width / 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 25,
                  child: OldCustomDropdown(
                    label: selectedDate == null ? '' : selectedDate.toString(),
                    onClick: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 2),
                      );
                      setState(() => selectedDate = date);
                    },
                    withNullOption: false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: widget.width - 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: (widget.width) / 2.5,
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
                      onChanged: (OldDropDownOption? hour) => setState(() {
                        if (hour != null) {
                          hourSelected = int.parse(hour.name);
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    width: (widget.width) / 2.5,
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
                      onChanged: (OldDropDownOption? minutes) => setState(() {
                        if (minutes != null) {
                          minuteSelected = int.parse(minutes.name);
                        }
                      }),
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
