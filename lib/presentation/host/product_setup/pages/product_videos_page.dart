import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_media_action.dart';
import 'package:fullbooker/application/redux/actions/remove_product_video_action.dart';
import 'package:fullbooker/application/redux/actions/upload_product_videos_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/upload_media_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/video_card.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductVideosPage extends StatelessWidget {
  const ProductVideosPage({super.key});

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
              child: StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                onInit: (Store<AppState> store) => context.dispatch(
                  FetchProductMediaAction(
                    client: AppWrapperBase.of(context)!.customClient,
                  ),
                ),
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  final List<ProductMedia?> videos =
                      vm.videos ?? <ProductMedia>[];

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: <Widget>[
                            Text(
                              videosString,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              videosCopy,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: videos.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == videos.length) {
                              if (context.isWaiting(<Type>[
                                UploadProductVideosAction,
                                RemoveProductVideoAction,
                              ])) {
                                return AppLoading();
                              }

                              return UploadMediaZeroState(
                                mediaType: UploadMediaType.VIDEO,
                                onTap: () async {
                                  final FilePickerResult? result =
                                      await pickMediaFiles(
                                    type: UploadMediaType.VIDEO,
                                  );

                                  if (result != null &&
                                      result.files.isNotEmpty) {
                                    context.dispatch(
                                      UploadProductVideosAction(
                                        pickedVideoFiles: result.files,
                                        client: AppWrapperBase.of(context)!
                                            .customClient,
                                      ),
                                    );
                                  }
                                },
                              );
                            }

                            final ProductMedia? item = videos[index];

                            return VideoCard(
                              videoUrl: item?.file ?? '',
                              onRemove: () {
                                context.dispatch(
                                  RemoveProductVideoAction(
                                    video: item!,
                                    client: AppWrapperBase.of(context)!
                                        .customClient,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            StoreConnector<AppState, ProductSetupViewModel>(
              converter: (Store<AppState> store) =>
                  ProductSetupViewModel.fromState(store.state),
              builder: (BuildContext context, ProductSetupViewModel vm) {
                final bool isEditing = vm.workflowState == WorkflowState.VIEW;

                return Column(
                  spacing: 12,
                  children: <Widget>[
                    PrimaryButton(
                      onPressed: () {
                        if (isEditing) {
                          context.router.popUntil(
                            (Route<dynamic> route) =>
                                route.settings.name ==
                                ProductReviewAndSubmitRoute.name,
                          );
                        } else {
                          context.router.push(ProductModeOfAccessRoute());
                        }
                      },
                      child: d.right(continueString),
                    ),
                    SecondaryButton(
                      onPressed: () {
                        isEditing
                            ? context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(
                        isEditing ? backToPreview : previousString,
                      ),
                      fillColor: Colors.transparent,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
