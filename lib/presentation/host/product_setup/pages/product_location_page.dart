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
class ProductLocationPage extends StatelessWidget {
  const ProductLocationPage({super.key});

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
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            location,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            locationCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      CustomTextInput(
                        hintText: searchLocation,
                        labelText: location,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => validateProductName(
                          value,
                        ),
                        onChanged: (String value) {},
                        keyboardType: TextInputType.name,
                        prefixIconData: HeroIcons.mapPin,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            kicc,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            nairobi,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductDateTimeRouteRoute());
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
