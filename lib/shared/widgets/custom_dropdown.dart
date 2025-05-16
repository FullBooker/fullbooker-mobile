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
    this.validator,
  });

  final String? Function(String?)? validator;
  final String? labelText;
  final ValueChanged<String?> onChanged;
  final List<String> options;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText?.isNotEmpty ?? false)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        DropdownButtonFormField<String>(
          value: value,
          validator: validator,
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
