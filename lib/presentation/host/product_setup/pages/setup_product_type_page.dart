import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_product_categories_action.dart';
import 'package:fullbooker/application/redux/actions/update_current_product_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/product_setup_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product_category.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/host/product_setup/widgets/product_type_item.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';

@RoutePage()
class SetupProductTypePage extends StatelessWidget {
  const SetupProductTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBell: false,
        title: setupProductType,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
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
                        builder:
                            (BuildContext context, ProductSetupViewModel vm) {
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
                                    client: AppWrapperBase.of(context)!
                                        .customClient,
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
                              final ProductCategory current =
                                  categories![index];

                              final bool selected = current.id ==
                                  vm.currentProduct?.selectedProductCategory
                                      ?.id;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ProductTypeItem(
                                  category: current,
                                  isSelected: selected,
                                  onTap: () => context.dispatch(
                                    UpdateCurrentProductAction(
                                      selectedCategory: current,
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
            PrimaryButton(
              onPressed: () {
                context.router.push(SetupProductCategoryRoute());
              },
              child: d.right(continueString),
            ),
            SecondaryButton(
              onPressed: () {
                context.router.maybePop();
              },
              child: d.right(cancelString),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
