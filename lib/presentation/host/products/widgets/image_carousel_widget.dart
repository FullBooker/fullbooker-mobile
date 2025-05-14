import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_media_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class ImageCarouselWidget extends StatefulWidget {
  const ImageCarouselWidget({super.key});

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double customHeight = MediaQuery.of(context).size.height * .25;

    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: ProductDetailViewModel.fromStore,
      onInit: (Store<AppState> store) {
        context.dispatch(
          FetchProductMediaAction(
            client: AppWrapperBase.of(context)!.customClient,
          ),
        );
      },
      builder: (BuildContext context, ProductDetailViewModel vm) {
        if (context.isWaiting(FetchProductMediaAction)) {
          return SizedBox(
            height: customHeight,
            child: Center(
              child: AppLoading(),
            ),
          );
        }

        final List<ProductMedia?> images = vm.selectedProduct?.photos
                ?.where(
                  (ProductMedia? element) =>
                      element?.mediaType == kImageMediaType,
                )
                .toList() ??
            <ProductMedia?>[];

        final List<String?> photoUrls =
            images.map((ProductMedia? e) => e?.file).toList();

        if (images.isEmpty) {
          return GestureDetector(
            onTap: () => context.router.push(
              ImagePreviewRoute(
                imageUrl: productImageZeroState,
                isOffline: true,
                imageUrls: photoUrls,
              ),
            ),
            child: Image.asset(
              productImageZeroState,
              fit: BoxFit.cover,
            ),
          );
        }

        return Column(
          spacing: 12,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final ProductMedia? image = images[index];
                if (image?.file != null) {
                  final String imageUrl = image?.file ?? UNKNOWN;

                  return GestureDetector(
                    onTap: () => context.router.push(
                      ImagePreviewRoute(
                        imageUrl: imageUrl,
                        imageUrls: photoUrls,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      progressIndicatorBuilder: (
                        BuildContext context,
                        String url,
                        DownloadProgress progress,
                      ) =>
                          Center(child: AppLoading()),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => context.router.push(
                      ImagePreviewRoute(
                        imageUrl: productImageZeroState,
                        isOffline: true,
                        imageUrls: const <String>[productImageZeroState],
                      ),
                    ),
                    child: Image.asset(
                      productImageZeroState,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
              options: CarouselOptions(
                height: customHeight,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayCurve: Curves.easeInOut,
                viewportFraction: 1.0,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() => _currentIndex = index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(images.length, (int index) {
                final bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).dividerColor,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
