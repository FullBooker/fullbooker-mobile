import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductDateTimePagePage extends StatelessWidget {
  const ProductDateTimePagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: <Widget>[
                      Text(
                        dateAndTime,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        dateAndTimeCopy,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  CustomTextInput(
                    hintText: selectDateHint,
                    labelText: dateString,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) => validateProductName(
                      value,
                    ),
                    onChanged: (String value) {},
                    keyboardType: TextInputType.name,
                    prefixIconData: HeroIcons.calendar,
                  ),
                  Row(
                    spacing: 16,
                    children: <Widget>[
                      Expanded(
                        child: CustomTextInput(
                          hintText: chooseTime,
                          labelText: starting,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => validateProductName(
                            value,
                          ),
                          onChanged: (String value) {},
                          keyboardType: TextInputType.text,
                          prefixIconData: HeroIcons.calendar,
                        ),
                      ),
                      Expanded(
                        child: CustomTextInput(
                          hintText: chooseTime,
                          labelText: ending,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => validateProductName(
                            value,
                          ),
                          onChanged: (String value) {},
                          keyboardType: TextInputType.text,
                          prefixIconData: HeroIcons.calendar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(SetupProductCategoryRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () {
                context.router.maybePop();
              },
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
