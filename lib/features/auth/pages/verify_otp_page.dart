import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/auth/controllers/old_login_controller.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

@RoutePage()
class VerifyOTPPage extends StatefulWidget {
  final String phoneNumber;
  const VerifyOTPPage(this.phoneNumber, {super.key});

  @override
  State<StatefulWidget> createState() => VerifyOTPPageState();
}

class VerifyOTPPageState extends State<VerifyOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  final OldLoginViewModel loginController = OldLoginViewModel();
  String pin = '';
  bool otpVerified = false;
  bool isLoading = false;
  late Timer timer;
  int counter = 120;

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
      _formKey.currentState!.save();
      final Future<String?> errFuture =
          loginController.validateOtp(pin, widget.phoneNumber);
      setState(() {
        isLoading = true;
        errorMessage = '';
      });
      errFuture.then((String? err) {
        setState(() {
          isLoading = false;
          if (err != null) errorMessage = err;
          if (err == null) otpVerified = true;
        });
      });
    }
  }

  void resendOTP(BuildContext context) {
    final Future<String?> errFuture =
        loginController.resetPassword(widget.phoneNumber);
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    errFuture.then((String? err) {
      setState(() {
        isLoading = false;
        if (err != null) errorMessage = err;
      });
    });
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
    // TODO(abiud): this is wrong. change it in another refactor
    if (otpVerified) {
      context.router
          .replace(ChangePasswordRoute(phoneNumber: widget.phoneNumber));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        PageHeader(
                          '',
                          otpSentCopy(widget.phoneNumber),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: OtpPinField(
                            fieldHeight: 80,
                            fieldWidth: 80,
                            onSubmit: onPinChange,
                            onChange: onPinChange,
                            otpPinFieldDecoration:
                                OtpPinFieldDecoration.defaultPinBoxDecoration,
                            otpPinFieldStyle: OtpPinFieldStyle(
                              fieldBorderRadius: 20,
                              activeFieldBorderColor:
                                  Theme.of(context).primaryColor,
                              filledFieldBorderColor:
                                  Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: (counter > 0)
                                ? RichText(
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: resendCodeInString,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        TextSpan(
                                          text: timerText(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: resentOTPString,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => resendOTP(context),
                                    ),
                                  ),
                          ),
                        ),
                        Center(
                          child: (errorMessage == '')
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    errorMessage,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
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
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
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
    );
  }
}
