import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';

class DatePicker extends StatefulWidget {
  final Product product;
  final Function(DateTime?)? onDateSelected;

  const DatePicker({super.key, required this.product, this.onDateSelected});

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? setDateTime;

  void setSelectedDate() {}

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Icon(Icons.calendar_month, color: Color(0xf0FC8135), size: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
                setDateTime == null
                    ? "Select Date"
                    : "${setDateTime!.day}/${setDateTime!.month}/${setDateTime!.year}",
                style: const TextStyle(fontSize: 14)),
          ),
          GestureDetector(
            onTap: () async {
              var dateTimeLocal = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2018, 1, 1),
                  lastDate: DateTime(2026, 1, 1));
              setState(() => setDateTime = dateTimeLocal);
              if (widget.onDateSelected != null) {
                widget.onDateSelected!(dateTimeLocal);
              }
            },
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all()),
                child: Transform.rotate(
                    angle: 1.57, child: const Icon(Icons.arrow_forward_ios))),
          )
        ]);
  }
}
