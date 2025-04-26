import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/fetch_profile_action.dart';
import 'package:fullbooker/application/redux/actions/logout_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/profile_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/core/components/profile_avatar.dart';
import 'package:fullbooker/presentation/profile/widgets/profile_list_item.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/bottom_nav_bar.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final String appVersion = const String.fromEnvironment(
    APPVERSION,
    defaultValue: kDevBuild,
  );

  final String appName =
      GetIt.I.get<AppConfig>().applicationName.split(' ').first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: CustomAppBar(title: profileString),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: <Widget>[
              Column(
                spacing: 12,
                children: <Widget>[
                  StoreConnector<AppState, ProfileViewModel>(
                    converter: (Store<AppState> store) =>
                        ProfileViewModel.fromStore(store),
                    onInit: (Store<AppState> store) {
                      context.dispatch(
                        FetchProfileAction(
                          client: AppWrapperBase.of(context)!.customClient,
                        ),
                      );
                    },
                    builder: (BuildContext context, ProfileViewModel vm) {
                      if (context.isWaiting(FetchProfileAction)) {
                        return SizedBox(height: 200, child: AppLoading());
                      }

                      final String name = vm.fullName;
                      final String email = vm.user?.emailAddress ?? '';
                      final String profileURL = vm.user?.profileURL ?? UNKNOWN;

                      return Column(
                        spacing: 12,
                        children: <Widget>[
                          Center(
                            child: ProfileAvatar(
                              displayName: name,
                              aviSize: 100,
                              avatarURI: profileURL,
                            ),
                          ),
                          Center(
                            child: Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                          Center(
                            child: Text(
                              email,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          verySmallVerticalSizedBox,
                        ],
                      );
                    },
                  ),

                  // Switch to hosting banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: <Widget>[
                        Text(
                          switchToUser(appName),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Text(
                          switchToUserCopy,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        verySmallVerticalSizedBox,
                        PrimaryButton(
                          customHeight: 56,
                          customRadius: 100,
                          child: d.left(
                            Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                HeroIcon(
                                  HeroIcons.arrowsUpDown,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Text(
                                  switchToUser(appName),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text(comingSoonTitle),
                                ),
                              );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Settings items
                  Column(
                    children: <Widget>[
                      ProfileListItem(
                        iconData: HeroIcons.clipboardDocumentList,
                        title: termsOfService,
                        body: termsOfServiceCopy,
                        onTap: () =>
                            context.router.push(TermsAndConditionsRoute()),
                      ),

                      // TODO(abiud): return this when the API is available
                      // The API should take and accessToken, currentPassword, newPass and confirmPass
                      // ProfileListItem(
                      //   iconData: HeroIcons.key,
                      //   title: changePassword,
                      //   body: changePasswordCopyShort,
                      //   onTap: () => context.router.push(UpdatePasswordRoute()),
                      // ),
                    ],
                  ),
                ],
              ),
              smallVerticalSizedBox,
              StoreConnector<AppState, ProfileViewModel>(
                converter: (Store<AppState> store) =>
                    ProfileViewModel.fromStore(store),
                builder: (BuildContext context, ProfileViewModel vm) {
                  if (context.isWaiting(LogoutAction())) {
                    return const AppLoading();
                  }

                  return SecondaryButton(
                    onPressed: () async {
                      await context.dispatch(
                        LogoutAction(
                          onDone: () => context.router.pushAndPopUntil(
                            const LoginRoute(),
                            predicate: (Route<dynamic> route) => false,
                          ),
                        ),
                      );
                    },
                    child: d.right(logoutString),
                  );
                },
              ),
              veryLargeVerticalSizedBox,
              Column(
                spacing: 8,
                children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}
