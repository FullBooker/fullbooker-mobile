import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/upload_product_media_action.dart';
import 'package:fullbooker/application/redux/actions/remove_product_media_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product_image.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/components/upload_photo_zero_state.dart';
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
              child: StoreConnector<AppState, ProductSetupViewModel>(
                converter: (Store<AppState> store) =>
                    ProductSetupViewModel.fromState(store.state),
                builder: (BuildContext context, ProductSetupViewModel vm) {
                  final List<ProductImage> media =
                      vm.productMedia ?? <ProductImage>[];

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
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: media.length +
                              1, // Add 1 for UploadPhotoZeroState
                          itemBuilder: (BuildContext context, int index) {
                            if (index == media.length) {
                              return UploadPhotoZeroState(
                                onTap: () async {
                                  final FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    type: FileType.custom,
                                    allowedExtensions: kAllowedMediaExtensions,
                                  );

                                  if (result != null &&
                                      result.files.isNotEmpty) {
                                    context.dispatch(
                                      UploadProductMediaAction(
                                        pickedFiles: result.files,
                                        client: AppWrapperBase.of(context)!
                                            .customClient,
                                      ),
                                    );
                                  }
                                },
                              );
                            }

                            final ProductImage item = media[index];
                            final bool isLoading = item.file == UNKNOWN;

                            return Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                if (isLoading)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                else
                                  CachedNetworkImage(
                                    imageUrl: item.file ?? '',
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => const AppLoading(),
                                  ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () =>
                                        StoreProvider.dispatch<AppState>(
                                      context,
                                      RemoveProductMediaAction(item),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
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
            PrimaryButton(
              onPressed: () {
                context.router.push(ProductPricingRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
