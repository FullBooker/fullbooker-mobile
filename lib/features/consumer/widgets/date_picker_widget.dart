import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/host/models/product.dart';

class DatePickerWidget extends StatefulWidget {
  final Product product;
  final Function(DateTime?)? onDateSelected;

  const DatePickerWidget({
    super.key,
    required this.product,
    this.onDateSelected,
  });

  @override
  State<StatefulWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? setDateTime;

  void setSelectedDate() {}

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Icon(
          Icons.calendar_month,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            setDateTime == null
                ? selectDateString
                : '${setDateTime!.day}/${setDateTime!.month}/${setDateTime!.year}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        GestureDetector(
          onTap: () async {
            final DateTime? dateTimeLocal = await showDatePicker(
              context: context,
              firstDate: DateTime(2018),
              lastDate: DateTime(2026),
            );
            setState(() => setDateTime = dateTimeLocal);
            if (widget.onDateSelected != null) {
              widget.onDateSelected!(dateTimeLocal);
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(),
            ),
            child: Transform.rotate(
              angle: 1.57,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ],
    );
  }
}
