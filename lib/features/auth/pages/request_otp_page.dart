import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/create_account_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/login_view_model.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/divider_with_text.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/old_text_inputs.dart';
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
  bool isLoading = false;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // final OldLoginViewModel loginController = OldLoginViewModel();
  String errorMessage = '';
  bool resetRequestSuccessful = false;
  late String otpChannel;

  void requestOTP(BuildContext context) {
    // _formKey.currentState!.save();
    // if (phoneNumberController.value.text.isEmpty &&
    //     emailController.value.text.isEmpty) {
    //   setState(() {
    //     errorMessage = enterPhoneOrEmailString;
    //   });
    //   return;
    // }

    // otpChannel = phoneNumberController.value.text.isEmpty
    //     ? emailController.value.text
    //     : phoneNumberController.value.text;

    // final Future<String?> errFuture = loginController.resetPassword(otpChannel);
    // setState(() {
    //   isLoading = true;
    //   errorMessage = '';
    //   otpChannel = otpChannel;
    // });
    // errFuture.then((String? err) {
    //   setState(() {
    //     isLoading = false;
    //     otpChannel = otpChannel;
    //     if (err != null) errorMessage = err;
    //     if (err == null) resetRequestSuccessful = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (resetRequestSuccessful) {
      context.router.replace(VerifyOTPRoute(phoneNumber: otpChannel));
    }

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
                      Form(
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
                              validator: (String? email) =>
                                  validateEmail(email),
                              onChanged: (String email) {
                                context.dispatch(
                                  UpdateOnboardingStateAction(
                                    emailAddress: email,
                                  ),
                                );
                              },
                              // hintText: newTransactionAmountHint,
                              keyboardType: TextInputType.emailAddress,
                              prefixIconData: HeroIcons.envelope,
                            ),
                            Center(
                              child: (errorMessage.isEmpty)
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        errorMessage,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
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
                    if (context.isWaiting(CreateAccountAction)) {
                      return AppLoading();
                    }

                    return PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.dispatch(
                            CreateAccountAction(
                              onError: (String error) => showAlertDialog(
                                context: context,
                                assetPath: loginCredentialsSVGPath,
                                description: error,
                              ),
                              onSuccess: () =>
                                  context.router.navigate(HostingHomeRoute()),
                              client: AppWrapperBase.of(context)!.customClient,
                            ),
                          );
                        }
                      },
                      child: d.right(createAccount),
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
