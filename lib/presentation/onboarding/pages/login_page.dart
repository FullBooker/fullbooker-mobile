import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/login_action.dart';
import 'package:fullbooker/application/redux/actions/sign_in_with_google_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/login_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/divider_with_text.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String appVersion = const String.fromEnvironment(
    APPVERSION,
    defaultValue: kDevBuild,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: StoreConnector<AppState, LoginPageViewModel>(
                converter: LoginPageViewModel.fromStore,
                builder: (BuildContext context, LoginPageViewModel vm) {
                  return ListView(
                    children: <Widget>[
                      largeVerticalSizedBox,
                      SvgPicture.asset(appLogoFullSVGPath),
                      smallVerticalSizedBox,
                      Center(
                        child: Column(
                          spacing: 4,
                          children: <Widget>[
                            Text(
                              welcomeString,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Text(
                              loginPageCopy,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      largeVerticalSizedBox,
                      AutofillGroup(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            spacing: 12,
                            children: <Widget>[
                              // Email input
                              CustomTextInput(
                                hintText: emailAddressHint,
                                labelText: emailAddressString,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: Validators.validateEmail,
                                onChanged: (String email) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      emailAddress: email,
                                    ),
                                  );
                                },
                                keyboardType: TextInputType.emailAddress,
                                prefixIconData: HeroIcons.envelope,
                                textInputAction: TextInputAction.next,
                                autofillHints: const <String>[
                                  AutofillHints.email,
                                ],
                              ),

                              // Password input
                              CustomTextInput(
                                labelText: passwordString,
                                hintText: passwordHint,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: Validators.validatePassword,
                                onChanged: (String v) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      password: v.trim(),
                                    ),
                                  );
                                },
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: const <String>[
                                  AutofillHints.password,
                                ],
                                prefixIconData: HeroIcons.key,
                                suffixIconData: HeroIcons.eyeSlash,
                                textInputAction: TextInputAction.done,
                                suffixIconFunc: () {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      hidePassword: !vm.hidePassword,
                                    ),
                                  );
                                },
                                obscureText: vm.hidePassword,
                                suffixIconActive: vm.hidePassword,
                              ),
                              SecondaryButton(
                                fillColor: Colors.transparent,
                                onPressed: () =>
                                    context.router.push(RequestOTPRoute()),
                                child: d.left(
                                  Text(
                                    textAlign: TextAlign.right,
                                    forgotPasswordString,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),

                              StoreConnector<AppState, LoginPageViewModel>(
                                converter: LoginPageViewModel.fromStore,
                                builder: (
                                  BuildContext context,
                                  LoginPageViewModel snapshot,
                                ) {
                                  final bool isLoading =
                                      context.isWaiting(LoginAction);

                                  return PrimaryButton(
                                    isLoading: isLoading,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        TextInput.finishAutofillContext();
                                        context.dispatch(
                                          LoginAction(
                                            onError: (String error) =>
                                                showAlertDialog(
                                              context: context,
                                              assetPath:
                                                  loginCredentialsSVGPath,
                                              description: error,
                                            ),
                                            onSuccess: () async {
                                              context.router
                                                  .navigate(HostingHomeRoute());
                                              await AnalyticsService().logEvent(
                                                name: loginEvent,
                                                eventType: AnalyticsEventType
                                                    .ONBOARDING,
                                              );
                                            },
                                            client: AppWrapperBase.of(context)!
                                                .customClient,
                                          ),
                                        );
                                      }
                                    },
                                    child: d.right(loginString),
                                  );
                                },
                              ),

                              SecondaryButton(
                                onPressed: () => context.router
                                    .replace(CreateAccountRoute()),
                                child: d.right(createAccount),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: DividerWithText(text: orString),
                              ),

                              StoreConnector<AppState, LoginPageViewModel>(
                                converter: LoginPageViewModel.fromStore,
                                builder: (
                                  BuildContext context,
                                  LoginPageViewModel snapshot,
                                ) {
                                  final bool isLoading =
                                      context.isWaiting(SignInWithGoogleAction);

                                  return SecondaryButton(
                                    isLoading: isLoading,
                                    onPressed: () {
                                      context.dispatch(
                                        SignInWithGoogleAction(
                                          onError: (String error) =>
                                              showAlertDialog(
                                            context: context,
                                            assetPath: loginCredentialsSVGPath,
                                            description: error,
                                          ),
                                          onSuccess: () async {
                                            await AnalyticsService().logEvent(
                                              name: signInWithGoogleEvent,
                                              eventType:
                                                  AnalyticsEventType.ONBOARDING,
                                            );

                                            return context.router
                                                .navigate(HostingHomeRoute());
                                          },
                                          client: AppWrapperBase.of(context)!
                                              .customClient,
                                        ),
                                      );
                                    },
                                    child: d.left(
                                      Center(
                                        child: Row(
                                          spacing: 8,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(googleIconSVGPath),
                                            Text(
                                              signInWithGoogleString,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Text(
              appVersionFormat(appVersion),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
