import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_media_action.dart';
import 'package:fullbooker/application/redux/actions/upload_product_photos_action.dart';
import 'package:fullbooker/application/redux/actions/remove_product_photo_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_media.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/upload_media_zero_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductPhotosPage extends StatelessWidget {
  const ProductPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: setupEvent),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: StoreConnector<AppState, ProductSetupViewModel>(
        converter: (Store<AppState> store) =>
            ProductSetupViewModel.fromState(store.state),
        builder: (BuildContext context, ProductSetupViewModel vm) {
          final bool isEditing = vm.workflowState == WorkflowState.VIEW;

          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              spacing: 16,
              children: <Widget>[
                Flexible(
                  child: SecondaryButton(
                    addBorder: true,
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
                    fillColor: Colors.white,
                  ),
                ),
                Flexible(
                  child: PrimaryButton(
                    onPressed: () {
                      if (isEditing) {
                        context.router.popUntil(
                          (Route<dynamic> route) =>
                              route.settings.name ==
                              ProductReviewAndSubmitRoute.name,
                        );
                      } else {
                        context.router.push(ProductVideosRoute());
                      }
                    },
                    child: d.right(continueString),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: StoreConnector<AppState, ProductSetupViewModel>(
          converter: (Store<AppState> store) =>
              ProductSetupViewModel.fromState(store.state),
          onInit: (Store<AppState> store) => context.dispatch(
            FetchProductMediaAction(
              client: AppWrapperBase.of(context)!.customClient,
            ),
          ),
          builder: (BuildContext context, ProductSetupViewModel vm) {
            final List<ProductMedia?> productPhotos =
                vm.photos ?? <ProductMedia>[];

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
                        photosString,
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
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: productPhotos.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == productPhotos.length) {
                        if (context.isWaiting(<Type>[
                          UploadProductPhotosAction,
                          RemoveProductPhotoAction,
                        ])) {
                          return AppLoading();
                        }
                        return UploadMediaZeroState(
                          mediaType: UploadMediaType.PHOTO,
                          onTap: () async {
                            final FilePickerResult? result =
                                await pickMediaFiles(
                              type: UploadMediaType.PHOTO,
                            );

                            if (result != null && result.files.isNotEmpty) {
                              context.dispatch(
                                UploadProductPhotosAction(
                                  pickedPhotoFiles: result.files,
                                  client:
                                      AppWrapperBase.of(context)!.customClient,
                                ),
                              );
                            }
                          },
                        );
                      }

                      final ProductMedia? item = productPhotos[index];
                      final bool isLoading = item?.file == UNKNOWN;

                      return Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          if (isLoading)
                            const Center(
                              child: CircularProgressIndicator(),
                            )
                          else
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: item?.file ?? '',
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (
                                  BuildContext context,
                                  String url,
                                  DownloadProgress progress,
                                ) =>
                                    Center(child: AppLoading()),
                              ),
                            ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: GestureDetector(
                              onTap: () => StoreProvider.dispatch<AppState>(
                                context,
                                RemoveProductPhotoAction(
                                  photo: item!,
                                  client:
                                      AppWrapperBase.of(context)!.customClient,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: .6),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(8),
                                child: HeroIcon(
                                  HeroIcons.xMark,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
