import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/actions/select_product_status_filter_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/presentation/core/components/custom_chip_widget.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class ProductFiltersWidget extends StatelessWidget {
  const ProductFiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageViewModel>(
      converter: (Store<AppState> store) =>
          ProductsPageViewModel.fromState(store.state),
      builder: (BuildContext context, ProductsPageViewModel vm) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ...ProductStatus.values.map(
                (ProductStatus e) {
                  return CustomChipWidget(
                    isSelected: e.name == vm.selectedProductStatus.name,
                    value: e.displayName,
                    onTap: () {
                      context.dispatch(
                        SelectProductStatusFilterAction(productStatus: e),
                      );
                      context.dispatch(
                        FetchProductsAction(
                          productStatus: e,
                          client: AppWrapperBase.of(context)!.customClient,
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
    );
  }
}
