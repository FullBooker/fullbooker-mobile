import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.value,
    this.onTap,
    this.isSelected = false,
  });

  final String value;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).dividerColor,
          ),
          color: isSelected ? Theme.of(context).primaryColor : null,
        ),
        child: Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
