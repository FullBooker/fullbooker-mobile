import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/change_password_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/onboarding/widgets/already_have_account_banner.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/validators.dart';
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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: <Widget>[
              StoreConnector<AppState, ResetPasswordViewModel>(
                converter: ResetPasswordViewModel.fromStore,
                builder: (
                  BuildContext context,
                  ResetPasswordViewModel vm,
                ) {
                  final bool loading = context.isWaiting(ChangePasswordAction);

                  return PrimaryButton(
                    isLoading: loading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
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
                                confirmText: loginString,
                                onConfirm: () =>
                                    context.router.push(LoginRoute()),
                                showSecondary: false,
                              );

                              await AnalyticsService().logEvent(
                                name: changePasswordEvent,
                                eventType: AnalyticsEventType.ONBOARDING,
                              );
                            },
                            client: AppWrapperBase.of(context)!.customClient,
                          ),
                        );
                      }
                    },
                    child: d.right(setNewPasswordString),
                  );
                },
              ),
              AlreadyHaveAccountWidget(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: StoreConnector<AppState, ResetPasswordViewModel>(
            converter: ResetPasswordViewModel.fromStore,
            builder: (BuildContext context, ResetPasswordViewModel vm) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        largeVerticalSizedBox,
                        SvgPicture.asset(prodAppLogoFullSVGPath),
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
                                  validator: Validators.validatePassword,
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
                                  textInputAction: TextInputAction.next,
                                  suffixIconFunc: () {
                                    context.dispatch(
                                      UpdateOnboardingStateAction(
                                        hideResetPassword:
                                            !vm.hideResetPassword,
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
                                      Validators.validateConfirmPassword(
                                    confirm,
                                    confirm,
                                  ),
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
                                  textInputAction: TextInputAction.done,
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
