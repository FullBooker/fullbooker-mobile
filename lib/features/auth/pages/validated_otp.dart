import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';
import 'package:fullbooker/features/auth/pages/password_change.dart';
import 'package:fullbooker/features/auth/pages/request_otp.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class ValidatedOtp extends StatefulWidget {
  final String phoneNumber;
  const ValidatedOtp(this.phoneNumber, {super.key});

  @override
  State<StatefulWidget> createState() => ValidatedOtpState();
}

class ValidatedOtpState extends State<ValidatedOtp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  final LoginViewModel loginController = LoginViewModel();
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

  void goToPasswordChange(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<PasswordChange>(
          builder: (_) => PasswordChange(widget.phoneNumber),
        ),
      );
    });
  }

  void goToRequestOtp(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<RequestOtp>(
          builder: (BuildContext context) => const RequestOtp(),
        ),
      );
    });
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
    if (otpVerified) goToPasswordChange(context);
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
                          'An OTP code has been sent to\n${widget.phoneNumber}',
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
                            otpPinFieldStyle: const OtpPinFieldStyle(
                              fieldBorderRadius: 20,
                              activeFieldBorderColor: Color(0xf0AE4808),
                              filledFieldBorderColor: Color(0xf0AE4808),
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
                                        const TextSpan(
                                          text: 'Resend code in ',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: timerText(),
                                          style: const TextStyle(
                                            color: Color(0xfff55E00),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: 'Resend OTP code',
                                      style: const TextStyle(
                                        color: Color(0xf015B9FF),
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
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
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
                  Button(
                    () => validateOTP(context),
                    loading: isLoading,
                    actionLabel: 'Continue',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 8,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          const TextSpan(
                            text: 'Use a different ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'email / phone number',
                            style: const TextStyle(color: Color(0xf015B9FF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToRequestOtp(context),
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
