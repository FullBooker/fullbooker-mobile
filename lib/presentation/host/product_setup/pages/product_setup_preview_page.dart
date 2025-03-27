import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/custom_chip_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/setup_summary_item.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductSetupPreviewPage extends StatelessWidget {
  const ProductSetupPreviewPage({super.key});

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
                            whatYouNeed,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            whatYouNeedCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                      Text(
                        productCategoryAndType,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      // Selected product category and type
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Row(
                          spacing: 8,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Row(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    productZeroStateSVGPath,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      spacing: 4,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          eventsName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                        CustomChipWidget(value: kidsString),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SecondaryButton(
                                onPressed: () {},
                                child: d.right(changeString),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        whatYouNeed,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      Column(
                        spacing: 12,
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
                    ],
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductBasicDetailsRoute());
              },
              child: d.right(beginString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
