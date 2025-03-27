import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/custom_chip_widget.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class SetupProductCategoryPage extends StatelessWidget {
  const SetupProductCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupProductCategory,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
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
                            categoryStep2,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            productCategory,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            productCategoryCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      CustomTextInput(
                        hintText: searchProductCopy,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String email) {},
                        prefixIconData: HeroIcons.magnifyingGlass,
                      ),
                      Text(
                        showingResultsFor(kidsString),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Wrap(
                        runSpacing: 12,
                        children: const <Widget>[
                          CustomChipWidget(
                            value: kidsString,
                            isSelected: true,
                          ),
                          CustomChipWidget(
                            value: safari,
                          ),
                          CustomChipWidget(
                            value: gym,
                          ),
                          CustomChipWidget(
                            value: concert,
                          ),
                          CustomChipWidget(
                            value: wineAndDine,
                          ),
                          CustomChipWidget(
                            value: hiking,
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
                context.router.push(ProductSetupPreviewRoute());
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
