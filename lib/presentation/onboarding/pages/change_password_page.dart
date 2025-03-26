import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/change_password_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StoreConnector<AppState, ResetPasswordViewModel>(
          converter: (Store<AppState> store) =>
              ResetPasswordViewModel.fromState(store.state),
          builder: (BuildContext context, ResetPasswordViewModel vm) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      largeVerticalSizedBox,
                      SvgPicture.asset(appLogoFullSVGPath),
                      smallVerticalSizedBox,
                      Center(
                        child: Column(
                          spacing: 4,
                          children: <Widget>[
                            Text(
                              resetYourPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Text(
                              setAndConfirmPassword,
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
                              // Password
                              CustomTextInput(
                                labelText: newPasswordLabel,
                                hintText: newPasswordHint,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? password) =>
                                    validatePassword(password),
                                onChanged: (String v) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      resetPassword: v.trim(),
                                    ),
                                  );
                                },
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: const <String>[
                                  AutofillHints.newPassword,
                                ],
                                prefixIconData: HeroIcons.key,
                                suffixIconData: HeroIcons.eyeSlash,
                                suffixIconFunc: () {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      hideResetPassword: !vm.hideResetPassword,
                                    ),
                                  );
                                },
                                obscureText: vm.hideResetPassword,
                              ),

                              // Confirm password
                              CustomTextInput(
                                labelText: confirmNewPasswordLabel,
                                hintText: confirmNewPasswordHint,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? confirm) =>
                                    validateConfirmPassword(confirm, confirm),
                                onChanged: (String v) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      resetPasswordConfirm: v.trim(),
                                    ),
                                  );
                                },
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: const <String>[
                                  AutofillHints.newPassword,
                                ],
                                prefixIconData: HeroIcons.key,
                                suffixIconData: HeroIcons.eyeSlash,
                                suffixIconFunc: () {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      hideResetConfirmPassword:
                                          !vm.hideResetConfirmPassword,
                                    ),
                                  );
                                },
                                obscureText: vm.hideResetConfirmPassword,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 12,
                  children: <Widget>[
                    StoreConnector<AppState, ResetPasswordViewModel>(
                      converter: (Store<AppState> store) =>
                          ResetPasswordViewModel.fromState(store.state),
                      builder: (
                        BuildContext context,
                        ResetPasswordViewModel vm,
                      ) {
                        if (context.isWaiting(ChangePasswordAction)) {
                          return AppLoading();
                        }

                        return PrimaryButton(
                          onPressed: () {
                            context.dispatch(
                              ChangePasswordAction(
                                onError: (String error) => showAlertDialog(
                                  context: context,
                                  assetPath: loginCredentialsSVGPath,
                                  description: error,
                                ),
                                onSuccess: () async {
                                  showAlertDialog(
                                    context: context,
                                    assetPath: loginCredentialsSVGPath,
                                    title: passwordUpdated,
                                    description: passwordUpdatedCopy,
                                    onConfirm: () =>
                                        context.router.push(LoginRoute()),
                                  );

                                  await AnalyticsService().logEvent(
                                    name: changePasswordEvent,
                                    eventType: AnalyticsEventType.ONBOARDING,
                                  );
                                },
                                client:
                                    AppWrapperBase.of(context)!.customClient,
                              ),
                            );
                          },
                          child: d.right(changePasswordString),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: alreadyHaveAnAccountString,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: loginString,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.router.replace(LoginRoute()),
                          ),
                        ],
                      ),
                    ),
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
