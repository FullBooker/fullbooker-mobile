import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/selected_product_category_banner.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/setup_summary_item.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductSetupPreviewPage extends StatelessWidget {
  const ProductSetupPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: setupEvent),
      bottomNavigationBar: CustomBottomNavContainer(
        child: Row(
          spacing: 16,
          children: <Widget>[
            Flexible(
              child: SecondaryButton(
                addBorder: true,
                onPressed: () => context.router.maybePop(),
                child: d.right(previousString),
                fillColor: Colors.transparent,
              ),
            ),
            Flexible(
              child: PrimaryButton(
                onPressed: () =>
                    context.router.push(ProductBasicDetailsRoute()),
                child: d.right(beginString),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: <Widget>[
                  Text(
                    whatYouNeed,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    whatYouNeedCopy,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productCategoryAndType,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SelectedProductCategoryBanner(readOnly: false),
                ],
              ),
              Text(
                whatYouNeed,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(
                spacing: 16,
                children: const <Widget>[
                  SetupSummaryItem(
                    stepNumber: 1,
                    title: basicDetails,
                    description: basicDetailsCopy,
                  ),
                  SetupSummaryItem(
                    stepNumber: 2,
                    title: location,
                    description: locationCopy,
                  ),
                  SetupSummaryItem(
                    stepNumber: 3,
                    title: dateAndTime,
                    description: dateAndTimeCopy,
                  ),
                  SetupSummaryItem(
                    stepNumber: 4,
                    title: media,
                    description: mediaCopy,
                  ),
                  SetupSummaryItem(
                    stepNumber: 5,
                    title: pricing,
                    description: pricingCopy,
                  ),
                  SetupSummaryItem(
                    stepNumber: 6,
                    title: review,
                    description: reviewCopy,
                  ),
                ],
              ),
              largeVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
