import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:fullbooker/presentation/host/product_setup/components/pricing_card_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/image_carousel_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_alert_widget.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_detail_item_widget.dart';
import 'package:fullbooker/shared/entities/data_mocks.dart';
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
        title: productsString,
      ),
      body: StoreConnector<AppState, ProductsPageViewModel>(
        converter: (Store<AppState> store) =>
            ProductsPageViewModel.fromState(store.state),
        builder: (BuildContext context, ProductsPageViewModel vm) {
          final Product? product = vm.selectedProduct;

          final List<String?> imageURLs = <String?>[
            product?.image?.file,
            ...mockProductSetupImageURLs,
          ];

          final bool isComplete = product?.completed ?? false;
          final bool isLocationAvailable =
              product?.locations?.isNotEmpty ?? false;

          return Column(
            children: <Widget>[
              ImageCarouselWidget(imageUrls: imageURLs),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  product?.name ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              CustomBadgeWidget(
                                text: isComplete
                                    ? publishedString
                                    : inReviewString,
                                backgroundColor: getProductColor(
                                  complete: isComplete,
                                ),
                                textColor: getProductColor(
                                  complete: isComplete,
                                ),
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
                                      product?.locations?.first.address ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              // Date
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 4,
                                children: <Widget>[
                                  HeroIcon(
                                    HeroIcons.calendar,
                                    color: AppColors.greyTextColor,
                                    size: 20,
                                  ),
                                  humanizeDate(
                                    loadedDate:
                                        product?.availability?.start ?? '',
                                    dateTextStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    to,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  humanizeDate(
                                    loadedDate:
                                        product?.availability?.end ?? '',
                                    dateTextStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),

                              // Time
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 4,
                                children: <Widget>[
                                  HeroIcon(
                                    HeroIcons.clock,
                                    color: AppColors.greyTextColor,
                                    size: 20,
                                  ),
                                  formatTime(
                                    time: product?.availability?.startTime,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    to,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  formatTime(
                                    time: product?.availability?.endTime,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ProductAlertWidget(
                            title: productInReview,
                            description: productInReviewCopy,
                            iconData: HeroIcons.clipboardDocumentList,
                          ),
                          verySmallVerticalSizedBox,
                          Text(
                            stats,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: <Widget>[
                              Text(
                                totalRevenue,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'KES 300, 000',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          ProductDetailItemWidget(
                            text: bookings,
                            value: '300',
                            onTap: () =>
                                context.router.push(ProductBookingsRoute()),
                          ),
                          Text(
                            pricing,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          PricingCardWidget(
                            ticketType: vip,
                            maxTickets: 300,
                            price: 3000,
                            svgIconPath: vvipTicketIconSVGPath,
                            // onAddOrEdit: () {},
                          ),
                          PricingCardWidget(
                            ticketType: vvip,
                            maxTickets: 20,
                            price: 5000,
                            svgIconPath: vvipTicketIconSVGPath,
                            // onAddOrEdit: () {},
                          ),
                          SecondaryButton(
                            fillColor: AppColors.redColor.withValues(alpha: .1),
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
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(comingSoonTitle),
                        ),
                      );
                  },
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
