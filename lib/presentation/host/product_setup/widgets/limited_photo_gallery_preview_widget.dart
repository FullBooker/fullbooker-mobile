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
  const LimitedPhotoGalleryPreviewWidget({
    super.key,
    required this.workflowState,
  });

  final WorkflowState workflowState;

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

        final List<ProductMedia?> photos =
            vm.selectedProduct?.photos ?? <ProductMedia?>[];
        final List<String?> photoUrls =
            photos.map((ProductMedia? e) => e?.file).toList();

        if (photos.isEmpty) return const MinZeroState(copy: noImagesString);

        final int extraCount = photos.length > 4 ? photos.length - 3 : 0;

        return Row(
          children: <Widget>[
            ...photoUrls.take(3).map(
              (String? url) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => context.router.push(
                      ImagePreviewRoute(
                        imageUrl: url ?? UNKNOWN,
                        imageUrls: photoUrls,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: url ?? UNKNOWN,
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
                      imageUrl: photos[3]?.file ?? UNKNOWN,
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
