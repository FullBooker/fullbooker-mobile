import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/actions/logout_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/profile_view_model.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/profile_avatar.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String appVersion = const String.fromEnvironment(
    APPVERSION,
    defaultValue: kDevBuild,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(title: profileString),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StoreConnector<AppState, ProfileViewModel>(
          converter: (Store<AppState> store) =>
              ProfileViewModel.fromStore(store),
          builder: (BuildContext context, ProfileViewModel vm) {
            final String name =
                getFullName(vm.user?.firstName, vm.user?.lastName);
            final String email = vm.user?.emailAddress ?? '';

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    spacing: 12,
                    children: <Widget>[
                      Center(
                        child: ProfileAvatar(
                          displayName: name,
                          aviSize: 120,
                          avatarURI: '',
                        ),
                      ),
                      Center(
                        child: Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Center(
                        child: Text(
                          email,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 12,
                  children: <Widget>[
                    Column(
                      spacing: 8,
                      children: <Widget>[
                        Text(
                          madeByString,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          copyright(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          appVersionFormat(appVersion),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    if (context.isWaiting(LogoutAction()))
                      const AppLoading()
                    else
                      SecondaryButton(
                        onPressed: () async {
                          await context.dispatch(
                            LogoutAction(),
                          );
                        },
                        child: d.right(logoutString),
                      ),
                    smallVerticalSizedBox,
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
