import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_pricing.dart';
import 'package:fullbooker/domain/core/value_objects/app_bar_action.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/image_carousel_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/limited_description_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/min_zero_state.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_alert_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_schedule_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_stats_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        showBell: false,
        title: productDetailsString,
        actions: <AppBarAction>[
          AppBarAction(
            iconUrl: HeroIcons.pencil,
            onTap: () {
              context.router.push(
                ProductReviewAndSubmitRoute(
                  workflowState: WorkflowState.VIEW,
                ),
              );
            },
          ),
        ],
      ),
      body: StoreConnector<AppState, ProductDetailViewModel>(
        converter: (Store<AppState> store) =>
            ProductDetailViewModel.fromState(store.state),
        builder: (BuildContext context, ProductDetailViewModel vm) {
          final Product? product = vm.selectedProduct;

          final bool isLocationAvailable =
              product?.locations?.isNotEmpty ?? false;

          final String statusDisplay = getStatusDisplay(product: product!);
          final Color statusColor = getProductStatusColor(product: product);
          final ProductStatus productStatus = getProductStatus(product);

          return Column(
            children: <Widget>[
              ImageCarouselWidget(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  product.name ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              CustomBadgeWidget(
                                text: statusDisplay,
                                backgroundColor: statusColor,
                                textColor: statusColor,
                              ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            children: <Widget>[
                              // Location
                              if (isLocationAvailable)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 4,
                                  children: <Widget>[
                                    HeroIcon(
                                      HeroIcons.mapPin,
                                      color: AppColors.greyTextColor,
                                      size: 20,
                                    ),
                                    Text(
                                      product.locations?.first.address ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          ProductScheduleWidget(
                            workflowState: WorkflowState.VIEW,
                          ),
                          if (productStatus == ProductStatus.inReview)
                            ProductAlertWidget(
                              title: productInReview,
                              description: productInReviewCopy,
                              iconData: HeroIcons.clipboardDocumentList,
                            ),
                          LimitedDescriptionWidget(
                            name: product.name ?? UNKNOWN,
                            description: product.description ?? UNKNOWN,
                          ),
                          ProductStatsWidget(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: <Widget>[
                              Text(
                                pricing,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              if (product.pricing?.isEmpty ?? true)
                                MinZeroState(copy: noPricingOptionsString)
                              else
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: product.pricing?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final ProductPricing? current =
                                        product.pricing![index];

                                    return Container(
                                      margin: EdgeInsets.only(bottom: 12),
                                      child:
                                          PricingCardWidget(pricing: current),
                                    );
                                  },
                                ),
                            ],
                          ),
                          verySmallVerticalSizedBox,
                          SecondaryButton(
                            fillColor:
                                AppColors.redColor.withValues(alpha: .05),
                            textColor: AppColors.redColor,
                            onPressed: () => showAlertDialog(
                              context: context,
                              assetPath: deleteProductSVGPath,
                              title: '$deactivateProduct?',
                              description: deactivateProductCopy,
                              confirmText: deactivateProduct,
                              cancelText: noGoBack,
                              onConfirm: () {
                                // TODO(abiud): deactivate a product
                                context.router.maybePop();
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content: Text(comingSoonTitle),
                                    ),
                                  );
                              },
                              onCancel: () => context.router.maybePop(),
                            ),
                            child: right(deactivateProduct),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                  onPressed: () => context.router.push(ScanTicketsRoute()),
                  customRadius: 100,
                  child: left(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      children: <Widget>[
                        HeroIcon(
                          HeroIcons.camera,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          scanTickets,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
