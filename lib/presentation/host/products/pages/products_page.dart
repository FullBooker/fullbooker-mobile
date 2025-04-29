import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/actions/reset_current_product_action.dart';
import 'package:fullbooker/application/redux/actions/set_workflow_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/products_page_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/core/components/product_card.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    context.dispatch(
      FetchProductsAction(
        client: AppWrapperBase.of(context)!.customClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        showBell: false,
        title: productsString,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.dispatchAll(
            <ReduxAction<AppState>>[
              ResetCurrentProductAction(),
              SetWorkflowStateAction(workflowState: WorkflowState.CREATE),
            ],
          );
          context.router.push(ProductCategoryRoute());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16),
          child: HeroIcon(
            HeroIcons.plus,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: <Widget>[
                StoreConnector<AppState, ProductsPageViewModel>(
                  converter: (Store<AppState> store) =>
                      ProductsPageViewModel.fromState(store.state),
                  onInit: (Store<AppState> store) {
                    context.dispatch(
                      FetchProductsAction(
                        client: AppWrapperBase.of(context)!.customClient,
                      ),
                    );
                  },
                  builder: (BuildContext context, ProductsPageViewModel vm) {
                    if (context.isWaiting(FetchProductsAction)) {
                      return AppLoading();
                    }

                    final List<Product?>? products = vm.products;

                    if (products?.isEmpty ?? true) {
                      return GenericZeroState(
                        iconPath: productZeroStateSVGPath,
                        title: noProducts,
                        description: noProductsCopy,
                        onCTATap: () {
                          context.router.push(ProductCategoryRoute());
                        },
                        ctaText: createProductString,
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Product? product = products![index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ProductCard(product: product!),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
