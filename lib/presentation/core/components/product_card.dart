import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final bool complete = product.completed ?? false;

    return GestureDetector(
      onTap: () {
        context.dispatch(UpdateHostStateAction(selectedProduct: product));
        context.router.push(ProductDetailRoute());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).dividerColor.withValues(alpha: .5),
              offset: Offset(0, 8),
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image + Category
            Stack(
              children: <Widget>[
                if (product.image?.file != null)
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: product.image?.file ?? '',
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    productImageZeroState,
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: CustomBadgeWidget(
                    text: product.name?.split(' ').last ?? '',
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          product.name ?? '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      CustomBadgeWidget(
                        text: complete ? publishedString : draftString,
                        backgroundColor: complete
                            ? AppColors.greenColor
                            : AppColors.greyTextColor,
                        textColor: complete
                            ? AppColors.greenColor
                            : AppColors.greyTextColor,
                      ),
                    ],
                  ),
                  if (complete)
                    Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: <Widget>[
                        // Location
                        if (product.locations?.isNotEmpty ?? false)
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
                                product.locations?.first.address ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        // Date
                        if (product.availability != null)
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
                                loadedDate: product.availability?.start ?? '',
                                dateTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                to,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              humanizeDate(
                                loadedDate: product.availability?.end ?? '',
                                dateTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),

                        // Time
                        if (product.availability != null)
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
                                rawTime: product.availability?.startTime,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                to,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              formatTime(
                                rawTime: product.availability?.endTime,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                      ],
                    )
                  else
                    SecondaryButton(
                      onPressed: () {
                        context.dispatch(
                          UpdateHostStateAction(currentProduct: product),
                        );
                        context.router.push(const ProductLocationRoute());
                        // navigateToNextProductStep(
                        //   context: context,
                        //   product: product,
                        // );
                      },
                      child: d.right(completeSetup),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
