import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/create_account_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/create_account_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/onboarding/widgets/already_have_account_banner.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_phone_number_input.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:heroicons/heroicons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

@RoutePage()
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<StatefulWidget> createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  final String appVersion = const String.fromEnvironment(
    APPVERSION,
    defaultValue: kDevBuild,
  );

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
              StoreConnector<AppState, CreateAccountViewModel>(
                converter: (Store<AppState> store) =>
                    CreateAccountViewModel.fromState(store.state),
                builder: (
                  BuildContext context,
                  CreateAccountViewModel vm,
                ) {
                  if (context.isWaiting(CreateAccountAction)) {
                    return AppLoading();
                  }

                  return PrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.dispatch(
                          CreateAccountAction(
                            onError: (String error) => showAlertDialog(
                              context: context,
                              assetPath: loginCredentialsSVGPath,
                              description: error,
                            ),
                            onSuccess: () async {
                              showAlertDialog(
                                context: context,
                                assetPath: loginCredentialsSVGPath,
                                title: accountCreated,
                                description: accountCreatedCopy,
                                confirmText: continueString,
                                onConfirm: () =>
                                    context.router.navigate(HostingHomeRoute()),
                              );

                              await AnalyticsService().logEvent(
                                name: createAccountEvent,
                                eventType: AnalyticsEventType.ONBOARDING,
                              );
                            },
                            client: AppWrapperBase.of(context)!.customClient,
                          ),
                        );
                      }
                    },
                    child: d.right(createAccount),
                  );
                },
              ),
              AlreadyHaveAccountWidget(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StoreConnector<AppState, CreateAccountViewModel>(
            converter: (Store<AppState> store) =>
                CreateAccountViewModel.fromState(store.state),
            builder: (BuildContext context, CreateAccountViewModel vm) {
              return ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  largeVerticalSizedBox,
                  SvgPicture.asset(prodAppLogoFullSVGPath),
                  smallVerticalSizedBox,
                  Center(
                    child: Column(
                      spacing: 4,
                      children: <Widget>[
                        Text(
                          letsGetStarted,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        Text(
                          signupPageCopy,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 12,
                      children: <Widget>[
                        // First name
                        CustomTextInput(
                          hintText: firstNameHint,
                          labelText: firstNameString,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => Validators.validateName(
                            value,
                            fieldName: firstNameString.toLowerCase(),
                          ),
                          onChanged: (String value) {
                            context.dispatch(
                              UpdateOnboardingStateAction(firstName: value),
                            );
                          },
                          keyboardType: TextInputType.name,
                          prefixIconData: HeroIcons.user,
                        ),

                        // Last name
                        CustomTextInput(
                          hintText: lastNameHint,
                          labelText: lastNameString,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => Validators.validateName(
                            value,
                            fieldName: lastNameString.toLowerCase(),
                          ),
                          onChanged: (String value) {
                            context.dispatch(
                              UpdateOnboardingStateAction(lastName: value),
                            );
                          },
                          keyboardType: TextInputType.name,
                          prefixIconData: HeroIcons.user,
                        ),

                        // Email input
                        CustomTextInput(
                          hintText: emailAddressHint,
                          labelText: emailAddressString,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.validateEmail,
                          onChanged: (String email) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                newEmailAddress: email,
                              ),
                            );
                          },
                          keyboardType: TextInputType.emailAddress,
                          prefixIconData: HeroIcons.envelope,
                        ),

                        // Phone number input
                        CustomPhoneInput(
                          labelText: phonNumberString,
                          onInputChanged: (PhoneNumber phone) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                newPhone: phone.phoneNumber,
                              ),
                            );
                          },
                        ),

                        // Password
                        CustomTextInput(
                          labelText: passwordString,
                          hintText: passwordHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.validatePassword,
                          onChanged: (String v) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                newPassword: v.trim(),
                              ),
                            );
                          },
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: const <String>[
                            AutofillHints.password,
                          ],
                          prefixIconData: HeroIcons.key,
                          suffixIconData: HeroIcons.eyeSlash,
                          suffixIconFunc: () {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                hideNewPassword: !vm.hideNewPassword,
                              ),
                            );
                          },
                          obscureText: vm.hideNewPassword,
                        ),

                        // Confirm password
                        CustomTextInput(
                          labelText: confirmPasswordString,
                          hintText: confirmPasswordHint,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? confirm) =>
                              Validators.validateConfirmPassword(
                            confirm,
                            confirm,
                          ),
                          onChanged: (String v) {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                newConfirmPassword: v.trim(),
                              ),
                            );
                          },
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: const <String>[
                            AutofillHints.password,
                          ],
                          prefixIconData: HeroIcons.key,
                          suffixIconData: HeroIcons.eyeSlash,
                          suffixIconFunc: () {
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                hideNewConfirmPassword:
                                    !vm.hideNewConfirmPassword,
                              ),
                            );
                          },
                          obscureText: vm.hideNewConfirmPassword,
                        ),
                      ],
                    ),
                  ),
                  largeVerticalSizedBox,
                  largeVerticalSizedBox,
                  largeVerticalSizedBox,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
