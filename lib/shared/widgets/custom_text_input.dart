import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/entities/types.dart';
import 'package:heroicons/heroicons.dart';

class Input extends StatelessWidget {
  const Input({
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
  }) : super(key: inputKey);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: <Widget>[
        if (labelText != null)
          Text(
            labelText ?? '',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        TextFormField(
          onChanged: onChanged,
          cursorColor: Theme.of(context).primaryColor,
          obscureText: obscureText,
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          maxLines: maxLines,
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
                ?.copyWith(color: AppColors.textTitleColor),
            suffixIcon: suffixIconData != null
                ? IconButton(
                    icon: HeroIcon(
                      suffixIconData!,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: suffixIconFunc ?? () {},
                  )
                : null,
            prefixIcon: prefixIconData != null
                ? IconButton(
                    icon: HeroIcon(
                      prefixIconData!,
                      color: AppColors.bodyTextColor,
                    ),
                    onPressed: suffixIconFunc ?? () {},
                  )
                : null,
          ),
        ),
      ],
    );
  }
}