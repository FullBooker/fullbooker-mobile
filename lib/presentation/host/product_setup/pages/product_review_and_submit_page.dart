import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_review_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/host/product_setup/widgets/limited_photo_gallery_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/location_preview_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/preview_header_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/product_type_item.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_schedule_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductReviewAndSubmitPage extends StatelessWidget {
  const ProductReviewAndSubmitPage({super.key, required this.workflowState});

  final WorkflowState workflowState;

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
              child: StoreConnector<AppState, ProductReviewViewModel>(
                converter: (Store<AppState> store) =>
                    ProductReviewViewModel.fromState(store.state),
                builder: (BuildContext context, ProductReviewViewModel vm) {
                  final Product? product = workflowState == WorkflowState.CREATE
                      ? vm.currentProduct
                      : vm.selectedProduct;

                  final String? name = product?.name;
                  final String? description = product?.description;
                  final bool isLocationAvailable =
                      product?.locations?.isNotEmpty ?? false;

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
                          Divider(),

                          // Category and type
                          PreviewHeaderWidget(
                            title: categoryAndType,
                            onEdit: () {},
                          ),

                          ProductTypeItem(
                            category: ProductCategory.initial().copyWith(
                              name: activities,
                              description: activitiesString,
                            ),
                            isSelected: true,
                            onTap: () {},
                          ),

                          Divider(),

                          // // Basic details
                          // PreviewHeaderWidget(
                          //   title: basicDetails,
                          //   onEdit: () {},
                          // ),
                          // Column(
                          //   spacing: 4,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: <Widget>[
                          //     if (name != null &&
                          //         name.isNotEmpty &&
                          //         name != UNKNOWN)
                          //       Text(
                          //         product?.name ?? UNKNOWN,
                          //         style: Theme.of(context).textTheme.titleSmall,
                          //       ),
                          //     if (description != null &&
                          //         description.isNotEmpty &&
                          //         description != UNKNOWN)
                          //       Text(
                          //         description,
                          //         style: Theme.of(context).textTheme.bodyMedium,
                          //       ),
                          //   ],
                          // ),

                          // Divider(),

                          // Location
                          // PreviewHeaderWidget(
                          //   title: location,
                          //   onEdit: () {},
                          // ),

                          // if (isLocationAvailable)
                          //   LocationPreviewWidget(
                          //     location: product?.locations?.first,
                          //     readOnly: true,
                          //   ),

                          // // Date and time
                          // Divider(),
                          // PreviewHeaderWidget(
                          //   title: dateAndTime,
                          //   onEdit: () {},
                          // ),

                          // if ((product?.scheduleID ?? UNKNOWN) != UNKNOWN)
                          //   ProductScheduleWidget(),

                          // Divider(),

                          // Photos
                          PreviewHeaderWidget(
                            title: photos,
                            onEdit: () {},
                          ),

                          LimitedPhotoGalleryPreviewWidget(),

                          Divider(),

                          // Pricing
                          PreviewHeaderWidget(
                            title: pricing,
                            onEdit: () {},
                          ),
                          PricingCardWidget(
                            ticketTier: vip,
                            price: 2000,
                            maxTickets: 300,
                            svgIconPath: standardTicketIconSVGPath,
                          ),
                          PricingCardWidget(
                            ticketTier: standard,
                            price: 2000,
                            maxTickets: 300,
                            svgIconPath: standardTicketIconSVGPath,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            smallVerticalSizedBox,
            PrimaryButton(
              onPressed: () => showAlertDialog(
                context: context,
                assetPath: productSetupSuccessSVGPath,
                title: productSubmit,
                description: productSubmitCopy,
                confirmText: backToProducts,
                cancelText: viewProduct,
                onConfirm: () {
                  context.router.popAndPush(ProductsRoute());
                },
                onCancel: () {
                  context.router.maybePop();
                  // TODO(abiud): navigate to product detail page
                },
              ),
              child: d.right(submitString),
            ),
            SecondaryButton(
              onPressed: () => context.router.maybePop(),
              child: d.right(previousString),
              fillColor: Colors.transparent,
            ),
            verySmallVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
