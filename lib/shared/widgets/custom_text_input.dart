import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/shared/entities/types.dart';
import 'package:heroicons/heroicons.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? inputKey,
    required this.onChanged,
    this.iconData,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffixIconData,
    this.keyboardType,
    this.suffixIconFunc,
    this.maxLines = 1,
    this.autoValidate,
    this.prefixIconData,
    this.labelText,
    this.initialValue,
    this.inputFormatters,
    this.autovalidateMode,
    this.autofillHints,
  }) : super(key: inputKey);

  final AutovalidateMode? autovalidateMode;

  final String? Function(String? value)? validator;
  final String? hintText;
  final String? labelText;
  final IconData? iconData;
  final bool obscureText;
  final FormFieldCallback onChanged;
  final HeroIcons? suffixIconData;
  final HeroIcons? prefixIconData;
  final TextInputType? keyboardType;
  final void Function()? suffixIconFunc;
  final int? maxLines;
  final bool? autoValidate;
  final String? initialValue;
  final List<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: <Widget>[
        if (labelText?.isNotEmpty ?? false)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        TextFormField(
          onChanged: onChanged,
          cursorColor: Theme.of(context).primaryColor,
          obscureText: obscureText,
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLines,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          autovalidateMode: autoValidate ?? false
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText ?? '',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.bodyTextColor.withValues(alpha: .4),
                ),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black),
            suffixIcon: suffixIconData != null
                ? IconButton(
                    icon: HeroIcon(
                      suffixIconData!,
                      size: 20,
                    ),
                    onPressed: suffixIconFunc,
                  )
                : null,
            prefixIcon: prefixIconData != null
                ? IconButton(
                    icon: HeroIcon(
                      prefixIconData!,
                      color: AppColors.bodyTextColor,
                      size: 20,
                    ),
                    onPressed: suffixIconFunc,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
