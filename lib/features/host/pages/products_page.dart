import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/logout_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/login_view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';

@RoutePage()
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, LoginPageViewModel>(
              converter: (Store<AppState> store) =>
                  LoginPageViewModel.fromState(store.state),
              builder: (
                BuildContext context,
                LoginPageViewModel snapshot,
              ) {
                if (context.isWaiting(LogoutAction)) {
                  return AppLoading();
                }

                return GenericZeroState(
                  iconPath: productZeroStateSVGPath,
                  title: noProducts,
                  description: noProductsCopy,
                  onCTATap: () {
                    context.dispatch(
                      LogoutAction(
                        onDone: () {
                          // TODO(abiud): navigate to create product page
                        },
                      ),
                    );
                  },
                  ctaText: createProductString,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
