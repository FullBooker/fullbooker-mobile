import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_categories_action.dart';
import 'package:fullbooker/application/redux/actions/update_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/product_category_item.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class ProductCategoryPage extends StatelessWidget {
  const ProductCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: setupProductType,
        ),
        bottomNavigationBar: CustomBottomNavContainer(
          child: StoreConnector<AppState, ProductSetupViewModel>(
            converter: (Store<AppState> store) =>
                ProductSetupViewModel.fromState(store.state),
            builder: (BuildContext context, ProductSetupViewModel vm) {
              final bool isEdit = vm.workflowState == WorkflowState.VIEW;

              final bool isLoading =
                  context.isWaiting(FetchProductCategoriesAction);

              if (isLoading) {
                return SizedBox.shrink();
              }

              return Row(
                spacing: 16,
                children: <Widget>[
                  Flexible(
                    child: SecondaryButton(
                      addBorder: true,
                      onPressed: () {
                        isEdit
                            ? context.router.popUntil(
                                (Route<dynamic> route) =>
                                    route.settings.name ==
                                    ProductReviewAndSubmitRoute.name,
                              )
                            : context.router.maybePop();
                      },
                      child: d.right(isEdit ? backToPreview : cancelString),
                      fillColor: Colors.transparent,
                    ),
                  ),
                  Flexible(
                    child: PrimaryButton(
                      isLoading: isLoading,
                      onPressed: () {
                        if (vm.category?.id != UNKNOWN) {
                          context.router.push(ProductSubCategoryRoute());
                        } else {
                          showAlertDialog(
                            context: context,
                            assetPath: productZeroStateSVGPath,
                            description: selectCategoryPrompt,
                          );
                        }
                      },
                      child: d.right(continueString),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
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
                      categoryStep1,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      productType,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      productTypeCopy,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                StoreConnector<AppState, ProductSetupViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductSetupViewModel.fromState(store.state),
                  onInit: (Store<AppState> store) {
                    context.dispatch(
                      FetchProductCategoriesAction(
                        client: AppWrapperBase.of(context)!.customClient,
                      ),
                    );
                  },
                  builder: (BuildContext context, ProductSetupViewModel vm) {
                    if (context.isWaiting(FetchProductCategoriesAction)) {
                      return AppLoading();
                    }

                    final List<ProductCategory>? categories =
                        vm.productCategories;

                    if (categories?.isEmpty ?? true) {
                      return GenericZeroState(
                        iconPath: setupZeroStateSVGPath,
                        title: noCategoriesFound,
                        description: noCategoriesFoundCopy,
                        onCTATap: () {
                          context.dispatch(
                            FetchProductCategoriesAction(
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        },
                        ctaText: tryAgain,
                      );
                    }

                    return ListView.builder(
                      itemCount: categories?.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final ProductCategory current = categories![index];

                        final bool selected = current.id == vm.category?.id;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ProductCategoryItem(
                            category: current,
                            isSelected: selected,
                            onTap: () => context.dispatch(
                              UpdateProductAction(
                                selectedCategory: current,
                                selectedSubCategory: ProductCategory.initial(),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
