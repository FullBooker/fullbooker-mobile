import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/pin_code_text_field.dart';

@RoutePage()
class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<StatefulWidget> createState() => VerifyOTPPageState();
}

class VerifyOTPPageState extends State<VerifyOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  // final OldLoginViewModel loginController = OldLoginViewModel();
  String pin = '';
  bool otpVerified = false;
  bool isLoading = false;
  late Timer timer;
  int counter = 120;

  // TODO(abiud): temp: remove this
  final String phoneNumber = '1234';

  void onPinChange(String pin_) {
    if (pin_.length == 4) pin = pin_;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String timerText() {
    final int minutes = counter ~/ 60;
    final int seconds = counter % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void validateOTP(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState!.save();
      // final Future<String?> errFuture =
      //     loginController.validateOtp(pin, phoneNumber);
      // setState(() {
      //   isLoading = true;
      //   errorMessage = '';
      // });
      // errFuture.then((String? err) {
      //   setState(() {
      //     isLoading = false;
      //     if (err != null) errorMessage = err;
      //     if (err == null) otpVerified = true;
      //   });
      // });
    }
  }

  void resendOTP(BuildContext context) {
    // final Future<String?> errFuture =
    //     loginController.resetPassword(phoneNumber);
    // setState(() {
    //   isLoading = true;
    //   errorMessage = '';
    // });
    // errFuture.then((String? err) {
    //   setState(() {
    //     isLoading = false;
    //     if (err != null) errorMessage = err;
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                              otpSentCopy(vm.resetEmailAddress),
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
                            PINInputField(
                              onDone: (String otp) {
                                context.dispatch(
                                  UpdateOnboardingStateAction(
                                    resetPasswordOTP: otp,
                                  ),
                                );
                              },
                              onTextChanged: (String otp) {
                                context.dispatch(
                                  UpdateOnboardingStateAction(
                                    resetPasswordOTP: otp,
                                  ),
                                );
                              },
                            ),
                            if (counter > 0)
                              RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: resendCodeInString,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextSpan(
                                      text: timerText(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              RichText(
                                text: TextSpan(
                                  text: resentOTPString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => resendOTP(context),
                                ),
                              ),
                            Center(
                              child: (errorMessage == '')
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        errorMessage,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: <Widget>[
                    OldButton(
                      () => validateOTP(context),
                      loading: isLoading,
                      actionLabel: continueString,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: useDifferentString,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: emailOrPhoneString,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    context.router.replace(RequestOTPRoute()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
