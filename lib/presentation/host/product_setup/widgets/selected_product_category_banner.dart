import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

class SelectedProductCategoryBanner extends StatelessWidget {
  const SelectedProductCategoryBanner({
    super.key,
    this.readOnly = true,
  });

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductSetupViewModel>(
      converter: (Store<AppState> store) =>
          ProductSetupViewModel.fromState(store.state),
      builder: (
        BuildContext context,
        ProductSetupViewModel vm,
      ) {
        final bool isEdit = vm.workflowState == WorkflowState.VIEW;
        final Product? product =
            isEdit ? vm.selectedProduct : vm.currentProduct;

        final String selectedCategory = product?.categoryName ?? UNKNOWN;

        final String selectedSubCategory = product?.subcategoryName ?? UNKNOWN;

        if (selectedCategory == UNKNOWN || selectedSubCategory == UNKNOWN) {
          return SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      selectedCategory,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      selectedSubCategory,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
              if (!readOnly)
                Flexible(
                  flex: 3,
                  child: SecondaryButton(
                    customWidth: MediaQuery.of(context).size.width / 2,
                    onPressed: () {
                      context.router.push(ProductCategoryRoute());
                    },
                    child: d.right(changeString),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
