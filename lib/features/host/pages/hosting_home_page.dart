import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_products_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/hosting_home_view_model.dart';
import 'package:fullbooker/application/redux/view_models/profile_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/generic_zero_state.dart';
import 'package:fullbooker/presentation/core/components/profile_avatar.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';

@RoutePage()
class HostingHomePage extends StatelessWidget {
  const HostingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String name =
        context.getState<AppState>().userState?.firstName ?? 'You';

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(
        preferredSize: const Size(double.infinity, 80),
        leading: GestureDetector(
          onTap: () => context.router.push(const ProfileRoute()),
          child: StoreConnector<AppState, ProfileViewModel>(
            converter: (Store<AppState> store) =>
                ProfileViewModel.fromStore(store),
            builder: (BuildContext context, ProfileViewModel vm) {
              final String firstName = vm.user?.firstName ?? noName;
              final String lastName = vm.user?.lastName ?? noName;
              final String name = '$firstName $lastName';

              final String photoURL = vm.user?.profileURL ?? UNKNOWN;

              return ProfileAvatar(
                avatarURI: photoURL,
                displayName: name,
                aviSize: 48,
              );
            },
          ),
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: <Widget>[
            Text(
              greetings(name),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            humanizeDate(
              loadedDate: DateTime.now().toIso8601String(),
              dateTextStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
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
