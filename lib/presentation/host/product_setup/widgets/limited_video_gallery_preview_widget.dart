import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_media_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_review_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/video_card.dart';
import 'package:fullbooker/presentation/host/products/widgets/min_zero_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class LimitedVideoGalleryPreviewWidget extends StatelessWidget {
  const LimitedVideoGalleryPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemSize = (MediaQuery.of(context).size.width - 32) / 4.5;

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
          return const AppLoading();
        }

        final List<ProductMedia?> videos = vm.selectedProduct?.videos
                ?.where((ProductMedia? m) => m?.mediaType == kVideoMediaType)
                .toList() ??
            <ProductMedia?>[];

        if (videos.isEmpty) {
          return const MinZeroState(copy: noVideosString);
        }

        final int extraCount = videos.length > 4 ? videos.length - 3 : 0;

        return Row(
          children: <Widget>[
            ...videos.take(3).map(
                  (ProductMedia? video) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      width: itemSize,
                      height: itemSize,
                      child: VideoCard(
                        videoUrl: video?.file ?? UNKNOWN,
                        onRemove: () {},
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
            if (extraCount > 0)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: itemSize,
                      height: itemSize,
                      child: VideoCard(
                        videoUrl: videos[3]?.file ?? UNKNOWN,
                        onRemove: () {},
                      ),
                    ),
                    Container(
                      width: itemSize,
                      height: itemSize,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .5),
                        borderRadius: BorderRadius.circular(8),
                      ),
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
