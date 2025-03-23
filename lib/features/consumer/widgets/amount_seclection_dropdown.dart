import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';

class AmountSelectionDropdown extends StatefulWidget {
  const AmountSelectionDropdown({super.key});

  @override
  State<StatefulWidget> createState() => _AmountSelectionDropdownState();
}

class _AmountSelectionDropdownState extends State<AmountSelectionDropdown> {
  int selectedTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Label
            Text(
              selectNumberOfTicketsPrompt,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // Dropdown Button
            DropdownButton<int>(
              value: selectedTickets,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              underline: const SizedBox(),
              // TODO(abiud): investigate this and fix
              // ignore: always_specify_types
              items: List.generate(11, (int index) => index).map((int number) {
                return DropdownMenuItem<int>(
                  value: number,
                  child: Text(
                    number.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }).toList(),
              onChanged: (int? value) {
                setState(() {
                  selectedTickets = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
