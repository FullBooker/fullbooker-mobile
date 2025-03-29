import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/components/preview_header_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/pricing_card_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductReviewAndPublishPage extends StatelessWidget {
  const ProductReviewAndPublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double photoSize = (MediaQuery.of(context).size.width - 32) / 4.5;
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
                            reviewAndPublish,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            reviewCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Divider(),
                      PreviewHeaderWidget(
                        title: basicDetails,
                        copy: basicDetailsCopy,
                        onEdit: () {},
                      ),
                      Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            testEventName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            testProductDescription,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Divider(),
                      PreviewHeaderWidget(
                        title: location,
                        copy: locationCopy,
                        onEdit: () {},
                      ),
                      Text(
                        testLocation,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Divider(),
                      PreviewHeaderWidget(
                        title: dateAndTime,
                        copy: dateAndTimeCopy,
                        onEdit: () {},
                      ),
                      Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8,
                            children: <Widget>[
                              HeroIcon(HeroIcons.calendar, size: 20),
                              Text(
                                testDate,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8,
                            children: <Widget>[
                              HeroIcon(HeroIcons.clock, size: 20),
                              Text(
                                testTime,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      PreviewHeaderWidget(
                        title: photos,
                        copy: photosAdded(15),
                        onEdit: () {},
                      ),
                      Row(
                        children: <Widget>[
                          ...mockProductSetupImageURLs.take(3).map(
                            (String url) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: url,
                                    width: photoSize,
                                    height: photoSize,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (
                                      BuildContext context,
                                      String url,
                                      DownloadProgress progress,
                                    ) =>
                                        Center(child: AppLoading()),
                                  ),
                                ),
                              );
                            },
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: mockProductSetupImageURLs.last,
                                  width: photoSize,
                                  height: photoSize,
                                  fit: BoxFit.cover,
                                  placeholder: (
                                    BuildContext context,
                                    String url,
                                  ) =>
                                      Container(color: Colors.grey.shade300),
                                  errorWidget: (
                                    BuildContext context,
                                    String url,
                                    Object error,
                                  ) =>
                                      const Icon(Icons.error),
                                ),
                                Container(
                                  width: photoSize,
                                  height: photoSize,
                                  color: Colors.black.withValues(alpha: 0.5),
                                  child: const Center(
                                    child: Text(
                                      '+ 12',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      PreviewHeaderWidget(
                        title: pricing,
                        copy: pricingCopy,
                        onEdit: () {},
                      ),
                      PricingCardWidget(
                        ticketType: vip,
                        price: 2000,
                        maxTickets: 300,
                        svgIconPath: regularTicketIconSVGPath,
                      ),
                      PricingCardWidget(
                        ticketType: standard,
                        price: 2000,
                        maxTickets: 300,
                        svgIconPath: regularTicketIconSVGPath,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            smallVerticalSizedBox,
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductPricingRoute());
              },
              child: d.right(publishString),
            ),
            SecondaryButton(
              onPressed: () {
                context.router.maybePop();
              },
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
            verySmallVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
