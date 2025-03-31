import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_carousel_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_detail_item_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        showBell: false,
        title: productsString,
      ),
      body: Column(
        children: <Widget>[
          ProductCarouselWidget(imageUrls: mockProductSetupImageURLs),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 12,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              mockProduct?.name ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          CustomBadgeWidget(
                            text: 'Published',
                            backgroundColor: AppColors.greenColor,
                            textColor: AppColors.greenColor,
                          ),
                        ],
                      ),
                      Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        children: <Widget>[
                          // Location
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: <Widget>[
                              HeroIcon(
                                HeroIcons.mapPin,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Text(
                                mockProduct?.locations.first.address ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          // Date
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: <Widget>[
                              HeroIcon(
                                HeroIcons.calendar,
                                color: Colors.grey,
                                size: 20,
                              ),
                              humanizeDate(
                                loadedDate: mockProduct!.availability.start,
                                dateTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                to,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              humanizeDate(
                                loadedDate: mockProduct!.availability.end,
                                dateTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),

                          // Time
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: <Widget>[
                              HeroIcon(
                                HeroIcons.clock,
                                color: Colors.grey,
                                size: 20,
                              ),
                              formatTime(
                                rawTime: mockProduct!.availability.startTime,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                to,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              formatTime(
                                rawTime: mockProduct!.availability.endTime,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      verySmallVerticalSizedBox,
                      ProductDetailItemWidget(
                        text: bookings,
                        value: '300',
                        onTap: () {},
                      ),
                      ProductDetailItemWidget(
                        text: payments,
                        value: 'KES 300, 000',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SecondaryButton(
              fillColor: AppColors.redColor.withValues(alpha: .1),
              textColor: AppColors.redColor,
              onPressed: () {},
              child: right(deactivateProduct),
            ),
          ),
        ],
      ),
    );
  }
}
