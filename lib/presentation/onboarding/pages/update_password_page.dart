import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/change_password_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/update_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:heroicons/heroicons.dart';

@RoutePage()
class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => UpdatePasswordPageState();
}

class UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: changePassword, showBell: false),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StoreConnector<AppState, UpdatePasswordViewModel>(
          converter: (Store<AppState> store) =>
              UpdatePasswordViewModel.fromState(store.state),
          builder: (
            BuildContext context,
            UpdatePasswordViewModel vm,
          ) {
            if (context.isWaiting(ChangePasswordAction)) {
              return AppLoading();
            }

            return PrimaryButton(
              onPressed: () => context.dispatch(
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
                      onConfirm: () => context.router.push(LoginRoute()),
                      showSecondary: false,
                    );

                    await AnalyticsService().logEvent(
                      name: changePasswordEvent,
                      eventType: AnalyticsEventType.ONBOARDING,
                    );
                  },
                  client: AppWrapperBase.of(context)!.customClient,
                ),
              ),
              child: d.right(changePassword),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StoreConnector<AppState, UpdatePasswordViewModel>(
          converter: (Store<AppState> store) =>
              UpdatePasswordViewModel.fromState(store.state),
          builder: (BuildContext context, UpdatePasswordViewModel vm) {
            return Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: <Widget>[
                    Text(
                      resetYourPassword,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      setAndConfirmPassword,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 12,
                      children: <Widget>[
                        // Old Password
                        CustomTextInput(
                          labelText: currentPasswordLabel,
                          hintText: currentPasswordHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? password) =>
                              validatePassword(password),
                          onChanged: (String v) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                currentPassword: v.trim(),
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
                                hideCurrentPassword: !vm.hideCurrentPassword,
                              ),
                            );
                          },
                          obscureText: vm.hideCurrentPassword,
                        ),

                        // New Password
                        CustomTextInput(
                          labelText: newPasswordLabel,
                          hintText: newPasswordHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? password) =>
                              validatePassword(password),
                          onChanged: (String v) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                changePassword: v.trim(),
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
                                hideChangePassword: !vm.hideChangePassword,
                              ),
                            );
                          },
                          obscureText: vm.hideChangePassword,
                        ),

                        // Confirm new password
                        CustomTextInput(
                          labelText: confirmNewPasswordLabel,
                          hintText: confirmNewPasswordHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? confirm) =>
                              validateConfirmPassword(confirm, confirm),
                          onChanged: (String v) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                changePasswordConfirm: v.trim(),
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
                                hideChangeConfirmPassword:
                                    !vm.hideChangeConfirmPassword,
                              ),
                            );
                          },
                          obscureText: vm.hideChangeConfirmPassword,
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
    );
  }
}
