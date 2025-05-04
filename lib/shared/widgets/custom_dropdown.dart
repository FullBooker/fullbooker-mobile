import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:heroicons/heroicons.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.labelText,
    required this.value,
    required this.onChanged,
    required this.options,
  });

  final String? labelText;
  final String value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText?.isNotEmpty ?? false)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        DropdownButtonFormField<String>(
          value: value,
          icon: HeroIcon(
            HeroIcons.chevronDown,
            color: AppColors.bodyTextColor,
            size: 20,
          ),
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBackgroundColor,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor.withValues(alpha: 0.4),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          items: options
              .map(
                (String option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
