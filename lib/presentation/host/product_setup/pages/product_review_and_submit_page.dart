import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_single_product_action.dart';
import 'package:fullbooker/application/redux/actions/submit_product_for_review_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_review_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/limited_photo_gallery_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/limited_video_gallery_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/location_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/preview_header_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/product_category_item.dart';
import 'package:fullbooker/presentation/host/products/widgets/min_zero_state.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_alert_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_schedule_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductReviewAndSubmitPage extends StatelessWidget {
  const ProductReviewAndSubmitPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchSingleProductAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupEvent,
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: StoreConnector<AppState, ProductReviewViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductReviewViewModel.fromState(store.state),
                  onInit: (Store<AppState> store) {
                    context.dispatch(
                      FetchSingleProductAction(
                        client: AppWrapperBase.of(context)!.customClient,
                      ),
                    );
                  },
                  builder: (BuildContext context, ProductReviewViewModel vm) {
                    if (context.isWaiting(FetchSingleProductAction)) {
                      return AppLoading();
                    }

                    final Product? product = vm.product;

                    final String? name = product?.name;
                    final String? description = product?.description;
                    final bool isLocationAvailable =
                        product?.locations?.isNotEmpty ?? false;

                    final ProductStatus productStatus =
                        getProductStatus(product!);

                    return ListView(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: <Widget>[
                                Text(
                                  reviewAndSubmit,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  reviewCopy,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            if (productStatus == ProductStatus.review)
                              ProductAlertWidget(
                                title: productInReview,
                                description: productInReviewCopy,
                                iconData: HeroIcons.clipboardDocumentList,
                              ),

                            Divider(),

                            // Category and type
                            PreviewHeaderWidget(
                              title: categoryAndType,
                              onEdit: () {
                                context.router.push(ProductCategoryRoute());
                              },
                            ),

                            ProductCategoryItem(
                              category: ProductCategory.initial().copyWith(
                                name: product.categoryName,
                                description: product.subcategoryName,
                              ),
                            ),

                            Divider(),

                            // Basic details
                            PreviewHeaderWidget(
                              title: basicDetails,
                              onEdit: () {
                                context.dispatch(
                                  UpdateHostStateAction(
                                    contextProduct: product,
                                  ),
                                );
                                context.router.push(ProductBasicDetailsRoute());
                              },
                            ),

                            Column(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                if (name != null &&
                                    name.isNotEmpty &&
                                    name != UNKNOWN)
                                  Text(
                                    product.name ?? UNKNOWN,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                if (description != null &&
                                    description.isNotEmpty &&
                                    description != UNKNOWN)
                                  Text(
                                    description,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                              ],
                            ),

                            Divider(),

                            // Location
                            PreviewHeaderWidget(
                              title: location,
                              onEdit: () =>
                                  context.router.push(ProductLocationRoute()),
                            ),

                            if (isLocationAvailable)
                              LocationPreviewWidget(
                                location: product.locations?.first,
                                readOnly: true,
                              )
                            else
                              MinZeroState(copy: noLocationProvided),

                            // Date and time
                            Divider(),
                            PreviewHeaderWidget(
                              title: dateAndTime,
                              onEdit: () {
                                context.router.push(ProductScheduleRoute());
                              },
                            ),
                            if ((product.scheduleID ?? UNKNOWN) != UNKNOWN)
                              ProductScheduleWidget(),
                            Divider(),

                            // Photos
                            PreviewHeaderWidget(
                              title: photosString,
                              onEdit: () {
                                context.dispatch(
                                  UpdateHostStateAction(
                                    contextProduct: product,
                                  ),
                                );
                                context.router.push(const ProductPhotosRoute());
                              },
                            ),
                            LimitedPhotoGalleryPreviewWidget(),
                            Divider(),

                            // Videos
                            PreviewHeaderWidget(
                              title: videosString,
                              onEdit: () {
                                context.dispatch(
                                  UpdateHostStateAction(
                                    contextProduct: product,
                                  ),
                                );
                                context.router.push(const ProductVideosRoute());
                              },
                            ),
                            LimitedVideoGalleryPreviewWidget(),
                            Divider(),

                            // Pricing
                            PreviewHeaderWidget(
                              title: pricing,
                              onEdit: () {
                                context.dispatch(
                                  UpdateHostStateAction(
                                    contextProduct: product,
                                  ),
                                );
                                context.router
                                    .push(const ProductPricingRoute());
                              },
                            ),

                            if (product.pricing?.isEmpty ?? true)
                              MinZeroState(copy: noPricingOptionsString)
                            else
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: product.pricing?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final ProductPricing? current =
                                      product.pricing![index];

                                  return Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    child: PricingCardWidget(pricing: current),
                                  );
                                },
                              ),

                            Divider(),

                            InkWell(
                              splashColor: Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(8),
                              highlightColor: Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: .1),
                              onTap: () {
                                context.dispatch(
                                  UpdateProductAction(
                                    termsAccepted: !vm.product!.termsAccepted!,
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Checkbox(
                                    value: vm.product!.termsAccepted ?? false,
                                    onChanged: (bool? value) {
                                      context.dispatch(
                                        UpdateProductAction(
                                          termsAccepted: value,
                                        ),
                                      );
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        children: <InlineSpan>[
                                          TextSpan(text: iHaveAccepted),
                                          TextSpan(
                                            text: termsOfService,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                context.router.push(
                                                  TermsAndConditionsRoute(),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              StoreConnector<AppState, ProductReviewViewModel>(
                converter: (Store<AppState> store) =>
                    ProductReviewViewModel.fromState(store.state),
                builder: (BuildContext context, ProductReviewViewModel vm) {
                  if (context.isWaiting(SubmitProductForReviewAction)) {
                    return AppLoading();
                  }
                  final Product? product = vm.product;

                  final ProductStatus status = getProductStatus(product!);

                  if (status != ProductStatus.draft) return SizedBox.shrink();

                  return Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PrimaryButton(
                        onPressed: () {
                          context.dispatch(
                            SubmitProductForReviewAction(
                              client: AppWrapperBase.of(context)!.customClient,
                              onSuccess: () => showAlertDialog(
                                context: context,
                                assetPath: productSetupSuccessSVGPath,
                                title: productSubmit,
                                description: productSubmitCopy,
                                confirmText: backToProducts,
                                cancelText: viewProduct,
                                onConfirm: () => context.router.popUntil(
                                  (Route<dynamic> route) =>
                                      route.settings.name ==
                                      ProductDetailRoute.name,
                                ),
                                onCancel: () {
                                  context.dispatch(
                                    UpdateHostStateAction(
                                      contextProduct: product,
                                    ),
                                  );
                                  context.router.popUntil(
                                    (Route<dynamic> route) =>
                                        route.settings.name ==
                                        ProductDetailRoute.name,
                                  );
                                },
                              ),
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: productZeroStateSVGPath,
                                description: error,
                              ),
                            ),
                          );
                        },
                        child: d.right(submitString),
                      ),
                      SecondaryButton(
                        onPressed: () => context.router.maybePop(),
                        child: d.right(backString),
                        fillColor: Colors.transparent,
                      ),
                      verySmallVerticalSizedBox,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
