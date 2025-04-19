import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_stats_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_detail_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/entities/product_stats.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/products/widgets/product_detail_item_widget.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';

class ProductStatsWidget extends StatelessWidget {
  const ProductStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductDetailViewModel>(
      converter: (Store<AppState> store) =>
          ProductDetailViewModel.fromState(store.state),
      onInit: (Store<AppState> store) => context.dispatch(
        FetchProductStatsAction(
          client: AppWrapperBase.of(context)!.customClient,
        ),
      ),
      builder: (BuildContext context, ProductDetailViewModel vm) {
        if (context.isWaiting(FetchProductStatsAction)) {
          return AppLoading();
        }

        final Product? product = vm.selectedProduct;

        final ProductStats? stats = product?.stats;

        if (stats == null) {
          return SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: <Widget>[
            Text(
              statsString,
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
                  'KES ${stats.revenue}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
            ProductDetailItemWidget(
              text: bookings,
              onTap: () => context.router.push(ProductBookingsRoute()),
              value: stats.bookings,
            ),
          ],
        );
      },
    );
  }
}
