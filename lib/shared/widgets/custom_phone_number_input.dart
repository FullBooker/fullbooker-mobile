import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:fullbooker/core/theme/app_colors.dart';

class CustomPhoneInput extends StatelessWidget {
  const CustomPhoneInput({
    super.key,
    required this.onInputChanged,
    this.initialValue,
    this.labelText,
    this.validator,
    this.autovalidateMode,
  });

  final Function(PhoneNumber number) onInputChanged;
  final PhoneNumber? initialValue;
  final String? labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        InternationalPhoneNumberInput(
          onInputChanged: onInputChanged,
          initialValue: initialValue,
          countries: allowedPhoneNumberCountries,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            leadingPadding: 12,
            setSelectorButtonAsPrefixIcon: true,
            useEmoji: true,
          ),
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            hintText: enterPhone,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.bodyTextColor.withValues(alpha: .4),
                ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          textStyle: Theme.of(context).textTheme.bodyLarge,
          autoValidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          validator: validator,
          cursorColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
