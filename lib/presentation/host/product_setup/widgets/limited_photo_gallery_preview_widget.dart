import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_media_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_review_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/products/widgets/min_zero_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class LimitedPhotoGalleryPreviewWidget extends StatelessWidget {
  const LimitedPhotoGalleryPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double photoSize = (MediaQuery.of(context).size.width - 32) / 4.5;

    return StoreConnector<AppState, ProductReviewViewModel>(
      converter: (Store<AppState> store) =>
          ProductReviewViewModel.fromState(store.state),
      onInit: (Store<AppState> store) => context.dispatch(
        FetchProductMediaAction(
          client: AppWrapperBase.of(context)!.customClient,
          workflowState: WorkflowState.VIEW,
        ),
      ),
      builder: (BuildContext context, ProductReviewViewModel vm) {
        if (context.isWaiting(FetchProductMediaAction)) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: const Center(child: AppLoading()),
          );
        }

        final List<ProductMedia?> media = vm.selectedProduct?.productMedia
                ?.where((ProductMedia? m) => m?.mediaType == kImageMediaType)
                .toList() ??
            <ProductMedia?>[];

        if (media.isEmpty) return const MinZeroState(copy: noImagesString);

        final int extraCount = media.length > 4 ? media.length - 3 : 0;

        return Row(
          children: <Widget>[
            ...media.take(3).map(
              (ProductMedia? m) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => context.router
                        .push(ImagePreviewRoute(imageUrl: m?.file ?? UNKNOWN)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: m?.file ?? UNKNOWN,
                        width: photoSize,
                        height: photoSize,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (
                          BuildContext context,
                          String url,
                          DownloadProgress progress,
                        ) =>
                            const Center(child: AppLoading()),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (extraCount > 0)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: media[3]?.file ?? UNKNOWN,
                      width: photoSize,
                      height: photoSize,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          Container(color: Colors.grey.shade300),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                    ),
                    Container(
                      width: photoSize,
                      height: photoSize,
                      color: Colors.black.withValues(alpha: .5),
                      child: Center(
                        child: Text(
                          '+ $extraCount',
                          style: const TextStyle(
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
        );
      },
    );
  }
}
