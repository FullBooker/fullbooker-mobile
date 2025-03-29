import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/entities/host_product_response.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:heroicons/heroicons.dart';

class NewProductCard extends StatelessWidget {
  const NewProductCard({super.key, required this.product});

  final HostProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: mockProductSetupImageURLs.first,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: CustomBadgeWidget(
                  text: product.name.split(' ').last,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    CustomBadgeWidget(
                      text: 'Published',
                      color: AppColors.greenColor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
                          product.locations.first.address,
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
                        Text(
                          product.availability.start,
                          style: Theme.of(context).textTheme.bodyMedium,
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
                        Text(
                          '${product.availability.startTime} - ${product.availability.endTime}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
