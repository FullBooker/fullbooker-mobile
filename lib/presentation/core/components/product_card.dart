import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/set_workflow_state_action.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_badge_widget.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final bool complete = isProductComplete(product: product);
    final String statusDisplay = getStatusDisplay(product: product);
    final Color statusColor = getProductStatusColor(product: product);

    return GestureDetector(
      onTap: () {
        context.dispatch(
          SetWorkflowStateAction(workflowState: WorkflowState.VIEW),
        );
        context.dispatch(UpdateHostStateAction(contextProduct: product));
        context.router.push(ProductDetailRoute());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).dividerColor.withValues(alpha: .5),
              offset: Offset(0, 8),
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image + Category
            Stack(
              children: <Widget>[
                if (product.image?.file != null)
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: product.image?.file ?? '',
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (
                        BuildContext context,
                        String url,
                        DownloadProgress progress,
                      ) =>
                          Center(child: AppLoading()),
                      errorWidget:
                          (BuildContext context, String url, Object error) =>
                              Image.asset(
                        productImageZeroState,
                        height: MediaQuery.of(context).size.height * .2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      productImageZeroState,
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: AppColors.productBadgeBackgroundColor,
                    ),
                    child: Text(
                      product.categoryName ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          product.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                      CustomBadgeWidget(
                        text: statusDisplay,
                        backgroundColor: statusColor,
                        textColor: statusColor,
                      ),
                    ],
                  ),
                  if (product.locations?.isNotEmpty ?? false)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: <Widget>[
                        HeroIcon(
                          HeroIcons.mapPin,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          size: 20,
                        ),
                        Expanded(
                          child: Text(
                            product.locations?.first.address ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  if (!complete)
                    SecondaryButton(
                      onPressed: () {
                        context.dispatch(
                          SetWorkflowStateAction(
                            workflowState: WorkflowState.CREATE,
                          ),
                        );
                        context.dispatch(
                          UpdateHostStateAction(contextProduct: product),
                        );
                        navigateToNextProductStep(
                          context: context,
                          product: product,
                        );
                      },
                      child: d.right(completeSetup),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
