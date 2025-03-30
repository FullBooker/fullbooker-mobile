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

@RoutePage()
class ProductBasicDetailsPage extends StatelessWidget {
  const ProductBasicDetailsPage({super.key});

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
                        productBasicDetails,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        productBasicDetailsCopy,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  CustomTextInput(
                    hintText: nameYourProduct,
                    labelText: nameString,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) => validateProductName(
                      value,
                    ),
                    onChanged: (String value) {},
                    keyboardType: TextInputType.name,
                  ),
                  CustomTextInput(
                    hintText: productDescriptionCopy,
                    labelText: productDescription,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (String value) {},
                    maxLines: 3,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductLocationRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
