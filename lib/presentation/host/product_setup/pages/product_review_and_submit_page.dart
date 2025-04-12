import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_location.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/components/location_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/preview_header_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/product_type_item.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductReviewAndSubmitPage extends StatelessWidget {
  const ProductReviewAndSubmitPage({super.key});

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
                            reviewAndSubmit,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            reviewCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Divider(),

                      // Category and type
                      PreviewHeaderWidget(
                        title: categoryAndType,
                        onEdit: () {},
                      ),

                      ProductTypeItem(
                        category: ProductCategory.initial().copyWith(
                          name: activities,
                          description: activitiesString,
                        ),
                        isSelected: true,
                        onTap: () {},
                      ),

                      Divider(),

                      // Basic details
                      PreviewHeaderWidget(
                        title: basicDetails,
                        onEdit: () {},
                      ),
                      Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            testEventName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            testProductDescription,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Divider(),

                      // Location
                      PreviewHeaderWidget(
                        title: location,
                        onEdit: () {},
                      ),

                      LocationPreviewWidget(
                        // TODO(abiud): replace this dynamically from the product details object
                        location: ProductLocation.initial().copyWith(
                          lat: '-1.288939',
                          long: '36.8201716',
                          address: 'KICC',
                          city: 'Nairobi',
                        ),
                        readOnly: true,
                      ),

                      // Date and time
                      Divider(),
                      PreviewHeaderWidget(
                        title: dateAndTime,
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

                      // Photos
                      PreviewHeaderWidget(
                        title: photos,
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

                      // Pricing
                      PreviewHeaderWidget(
                        title: pricing,
                        onEdit: () {},
                      ),
                      PricingCardWidget(
                        ticketType: vip,
                        price: 2000,
                        maxTickets: 300,
                        svgIconPath: standardTicketIconSVGPath,
                      ),
                      PricingCardWidget(
                        ticketType: standard,
                        price: 2000,
                        maxTickets: 300,
                        svgIconPath: standardTicketIconSVGPath,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            smallVerticalSizedBox,
            PrimaryButton(
              onPressed: () => showAlertDialog(
                context: context,
                assetPath: productSetupSuccessSVGPath,
                title: productSubmit,
                description: productSubmitCopy,
                confirmText: backToProducts,
                cancelText: viewProduct,
                onConfirm: () {
                  context.router.popAndPush(ProductsRoute());
                },
                onCancel: () {
                  context.router.maybePop();
                  // TODO(abiud): navigate to product detail page
                },
              ),
              child: d.right(submitString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
            verySmallVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
