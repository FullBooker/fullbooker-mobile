import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/components/upload_photo_zero_state.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductPhotosPage extends StatelessWidget {
  const ProductPhotosPage({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: <Widget>[
                        Text(
                          photos,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          photosCopy,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents double scroll
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        if (index ==
                            mockProductSetupImageURLs.take(6).length - 1) {
                          return UploadPhotoZeroState();
                        } else {
                          final String url = mockProductSetupImageURLs[index];

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: url,
                              progressIndicatorBuilder: (
                                BuildContext context,
                                String url,
                                DownloadProgress progress,
                              ) =>
                                  Center(child: AppLoading()),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductPricingRoute());
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
