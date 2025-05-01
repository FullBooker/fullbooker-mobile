import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_category_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/core/components/custom_chip_widget.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductSubCategoryPage extends StatelessWidget {
  const ProductSubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBell: false, title: setupProductCategory),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
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
                            categoryStep2,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            productCategory,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            productCategoryCopy,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      StoreConnector<AppState, ProductSetupViewModel>(
                        converter: (Store<AppState> store) =>
                            ProductSetupViewModel.fromState(store.state),
                        builder:
                            (BuildContext context, ProductSetupViewModel vm) {
                          if (context.isWaiting(UpdateProductCategoryAction)) {
                            return AppLoading();
                          }

                          final List<ProductCategory?>? subCategories =
                              vm.subCategories;

                          if (subCategories?.isEmpty ?? true) {
                            return GenericZeroState(
                              iconPath: setupZeroStateSVGPath,
                              title: noCategoriesFound,
                              description: noCategoriesFoundCopy,
                              onCTATap: () {},
                              ctaText: tryAgain,
                            );
                          }

                          return Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children:
                                subCategories?.map((ProductCategory? current) {
                                      final bool selected =
                                          current?.id == vm.subCategory?.id;

                                      return CustomChipWidget(
                                        value: current?.name ?? '',
                                        isSelected: selected,
                                        onTap: () => context.dispatch(
                                          UpdateProductAction(
                                            selectedSubCategory: current,
                                          ),
                                        ),
                                      );
                                    }).toList() ??
                                    <Widget>[],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StoreConnector<AppState, ProductSetupViewModel>(
              converter: (Store<AppState> store) =>
                  ProductSetupViewModel.fromState(store.state),
              builder: (BuildContext context, ProductSetupViewModel vm) {
                if (context.isWaiting(UpdateProductCategoryAction)) {
                  return AppLoading();
                }

                final bool isEdit = vm.workflowState == WorkflowState.VIEW;

                return Column(
                  spacing: 12,
                  children: <Widget>[
                    PrimaryButton(
                      onPressed: () {
                        if (isEdit) {
                          context.dispatch(
                            UpdateProductCategoryAction(
                              client: AppWrapperBase.of(context)!.customClient,
                              onSuccess: () => context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              ),
                            ),
                          );
                        } else {
                          context.router.push(ProductSetupPreviewRoute());
                        }
                      },
                      child: d.right(continueString),
                    ),
                    SecondaryButton(
                      onPressed: () {
                        isEdit
                            ? context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(isEdit ? backToPreview : previousString),
                      fillColor: Colors.transparent,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
