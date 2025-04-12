import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/hosting_home_view_model.dart';
import 'package:fullbooker/application/redux/view_models/profile_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/entities/product.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/core/components/product_card.dart';
import 'package:fullbooker/presentation/core/components/profile_avatar.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';

@RoutePage()
class HostingHomePage extends StatelessWidget {
  const HostingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        preferredSize: const Size(double.infinity, 80),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => context.router.push(const ProfileRoute()),
            child: StoreConnector<AppState, ProfileViewModel>(
              converter: (Store<AppState> store) =>
                  ProfileViewModel.fromStore(store),
              builder: (BuildContext context, ProfileViewModel vm) {
                final String photoURL = vm.user?.profileURL ?? UNKNOWN;

                return ProfileAvatar(
                  avatarURI: photoURL,
                  displayName: vm.fullName,
                  aviSize: 48,
                );
              },
            ),
          ),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              welcomeString,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            StoreConnector<AppState, ProfileViewModel>(
              converter: (Store<AppState> store) =>
                  ProfileViewModel.fromStore(store),
              builder: (BuildContext context, ProfileViewModel vm) {
                return Text(
                  vm.fullName,
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 12,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).dividerColor.withValues(alpha: .5),
                    offset: Offset(0, 8),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      homeNudgeImagePath,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.height * .18,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: Column(
                        spacing: 8,
                        children: <Widget>[
                          Text(
                            homeNudgeCopy,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          PrimaryButton(
                            onPressed: () =>
                                context.router.push(SetupProductTypeRoute()),
                            child: right(setupNow),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StoreConnector<AppState, HostingHomeViewModel>(
              converter: (Store<AppState> store) =>
                  HostingHomeViewModel.fromState(store.state),
              onInit: (Store<AppState> store) {
                context.dispatch(
                  FetchProductsAction(
                    client: AppWrapperBase.of(context)!.customClient,
                  ),
                );
              },
              builder: (BuildContext context, HostingHomeViewModel vm) {
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
                      context.router.push(SetupProductTypeRoute());
                    },
                    ctaText: createProductString,
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
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
    );
  }
}
