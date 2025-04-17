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
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: (Store<AppState> store) =>
          ProductDetailViewModel.fromState(store.state),
      onInit: (Store<AppState> store) => context.dispatch(
        FetchProductMediaAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      ),
      builder: (BuildContext context, ProductDetailViewModel vm) {
        if (context.isWaiting(FetchProductMediaAction)) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Center(
              child: AppLoading(),
            ),
          );
        }

        final List<ProductMedia?>? images = vm.selectedProduct?.productMedia;

        if (images?.isEmpty ?? true) {
          return GestureDetector(
            onTap: () => context.router.push(
              ImagePreviewRoute(
                imageUrl: productImageZeroState,
                isOffline: true,
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
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .25,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayCurve: Curves.easeInOut,
                viewportFraction: 1.0,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() => _currentIndex = index);
                },
              ),
              items: images?.map((ProductMedia? image) {
                if (image?.file != null) {
                  final String imageUrl = image?.file ?? UNKNOWN;

                  return GestureDetector(
                    onTap: () => context.router
                        .push(ImagePreviewRoute(imageUrl: imageUrl)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (BuildContext context, String url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (BuildContext context, String url, Object error) =>
                              const Icon(Icons.error),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => context.router.push(
                      ImagePreviewRoute(
                        imageUrl: productImageZeroState,
                        isOffline: true,
                      ),
                    ),
                    child: Image.asset(
                      productImageZeroState,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(images?.length ?? 0, (int index) {
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
