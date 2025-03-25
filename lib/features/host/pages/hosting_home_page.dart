import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/hosting_home_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';

@RoutePage()
class HostingHomePage extends StatelessWidget {
  const HostingHomePage({super.key});

  // TODO(abiud): cleanup this code
  // bool hasLoaded = false;
  // ProductViewModel productsController = ProductViewModel();

  @override
  // void initState() {
  //   super.initState();
  //   productsController.repository
  //       .post(<String, Object?>{}, hostsEndpoint).then((dynamic host) {
  //     productsController.repository.pullMultiple(
  //       1,
  //       100,
  //       processResponseAsPage: true,
  //       filters: <String, dynamic>{'host': host['id']},
  //     ).then((List<Product> products_) {
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         if (products_.isEmpty) {
  //           setState(() => hasLoaded = true);
  //           return;
  //         }

  //         context.router.push(HostProductSummaryRoute(host: host['id']));
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              builder: (
                BuildContext context,
                HostingHomeViewModel snapshot,
              ) {
                if (context.isWaiting(FetchProductsAction)) {
                  return AppLoading();
                }

                return GenericZeroState(
                  iconPath: productZeroStateSVGPath,
                  title: comingSoonTitle,
                  description: comingSoonCopy,
                  onCTATap: null,
                  ctaText: logoutString,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
