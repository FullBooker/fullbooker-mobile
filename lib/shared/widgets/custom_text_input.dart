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
    this.prefixIconFunc,
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
    this.prefixIconActive = false,
    this.suffixIconActive = false,
    this.controller,
  }) : super(key: inputKey);

  final String? Function(String? value)? validator;
  final void Function()? suffixIconFunc;
  final void Function()? prefixIconFunc;
  final bool? autoValidate;
  final List<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final String? hintText;
  final IconData? iconData;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLines;
  final bool obscureText;
  final FormFieldCallback onChanged;
  final HeroIcons? prefixIconData;
  final HeroIcons? suffixIconData;
  final bool prefixIconActive;
  final bool suffixIconActive;
  final TextEditingController? controller;

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
          controller: controller,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLines,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          autovalidateMode: autoValidate ?? false
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.textBlackColor),
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
                    splashColor:
                        Theme.of(context).primaryColor.withValues(alpha: .1),
                    highlightColor:
                        Theme.of(context).primaryColor.withValues(alpha: .1),
                    icon: HeroIcon(
                      suffixIconData!,
                      size: 20,
                      color: prefixIconActive
                          ? Theme.of(context).primaryColor
                          : AppColors.bodyTextColor,
                    ),
                    onPressed: suffixIconFunc,
                  )
                : null,
            prefixIcon: prefixIconData != null
                ? IconButton(
                    splashColor:
                        Theme.of(context).primaryColor.withValues(alpha: .1),
                    highlightColor:
                        Theme.of(context).primaryColor.withValues(alpha: .1),
                    icon: HeroIcon(
                      prefixIconData!,
                      color: prefixIconActive
                          ? Theme.of(context).primaryColor
                          : AppColors.bodyTextColor,
                      size: 20,
                    ),
                    onPressed: prefixIconFunc,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
