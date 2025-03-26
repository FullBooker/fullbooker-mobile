import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/request_otp_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:dartz/dartz.dart' as d;

@RoutePage()
class RequestOTPPage extends StatefulWidget {
  const RequestOTPPage({super.key});

  @override
  State<StatefulWidget> createState() => RequestOTPPageState();
}

class RequestOTPPageState extends State<RequestOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: StoreConnector<AppState, ResetPasswordViewModel>(
                converter: (Store<AppState> store) =>
                    ResetPasswordViewModel.fromState(store.state),
                builder: (BuildContext context, ResetPasswordViewModel vm) {
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
                              resetYourPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Text(
                              requestOTPCopy,
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
                                autofillHints: const <String>[
                                  AutofillHints.email,
                                ],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? email) =>
                                    validateEmail(email),
                                onChanged: (String email) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      resetEmailAddress: email,
                                    ),
                                  );
                                },
                                // hintText: newTransactionAmountHint,
                                keyboardType: TextInputType.emailAddress,
                                prefixIconData: HeroIcons.envelope,
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
                    if (context.isWaiting(RequestOtpAction)) {
                      return AppLoading();
                    }

                    return PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.dispatch(
                            RequestOtpAction(
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: loginCredentialsSVGPath,
                                description: error,
                              ),
                              onSuccess: () =>
                                  context.router.navigate(VerifyOTPRoute()),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        }
                      },
                      child: d.right(continueString),
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
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.router.replace(LoginRoute()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
