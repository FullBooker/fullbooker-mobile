import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/features/auth/pages/validated_otp.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

class RequestOtp extends StatefulWidget {
  const RequestOtp({super.key});

  @override
  State<StatefulWidget> createState() => RequestOtpState();
}

class RequestOtpState extends State<RequestOtp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final LoginViewModel loginController = LoginViewModel();
  String errorMessage = '';
  bool resetRequestSuccessful = false;
  late String otpChannel;

  void goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<Login>(
        builder: (BuildContext context) => const Login(),
      ),
    );
  }

  void goToOTP(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<ValidatedOtp>(
          builder: (_) => ValidatedOtp(otpChannel),
        ),
      );
    });
  }

  void requestOTP(BuildContext context) {
    _formKey.currentState!.save();
    if (phoneNumberController.value.text.isEmpty &&
        emailController.value.text.isEmpty) {
      setState(() {
        errorMessage = 'Please enter either your email or phone number';
      });
      return;
    }

    otpChannel = phoneNumberController.value.text.isEmpty
        ? emailController.value.text
        : phoneNumberController.value.text;

    final Future<String?> errFuture = loginController.resetPassword(otpChannel);
    setState(() {
      isLoading = true;
      errorMessage = '';
      otpChannel = otpChannel;
    });
    errFuture.then((String? err) {
      setState(() {
        isLoading = false;
        otpChannel = otpChannel;
        if (err != null) errorMessage = err;
        if (err == null) resetRequestSuccessful = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (resetRequestSuccessful) goToOTP(context);

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
                        const PageHeader(
                          '',
                          'Please provide email or phone number\nto reset your password',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: StandardTextInput(
                            'Email',
                            labelPrefix: Icons.email_sharp,
                            validator: (String? email) =>
                                validateEmail(email, isOptional: true),
                            controller: emailController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: LabeledDivider(
                            Colors.black,
                            18,
                            MediaQuery.of(context).size.width * .8,
                            'Or',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: StandardTextInput(
                            'Phone Number',
                            labelPrefix: Icons.phone,
                            validator: (String? number) =>
                                validatePhoneNumber(number, isOptional: true),
                            controller: phoneNumberController,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Center(
                          child: (errorMessage == '')
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    errorMessage,
                                    style: const TextStyle(color: Colors.red),
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
                    () => requestOTP(context),
                    actionLabel: 'Continue',
                    loading: isLoading,
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
                            text: 'Go back to ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'login',
                            style: const TextStyle(color: Color(0xf015B9FF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToLogin(context),
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
