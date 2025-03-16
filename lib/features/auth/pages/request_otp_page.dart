import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/features/auth/controllers/login_controller.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

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
  final LoginViewModel loginController = LoginViewModel();
  String errorMessage = '';
  bool resetRequestSuccessful = false;
  late String otpChannel;

  void requestOTP(BuildContext context) {
    _formKey.currentState!.save();
    if (phoneNumberController.value.text.isEmpty &&
        emailController.value.text.isEmpty) {
      setState(() {
        errorMessage = enterPhoneOrEmailString;
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
    if (resetRequestSuccessful) {
      context.router.replace(VerifyOTPRoute(phoneNumber: otpChannel));
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
                        const PageHeader(
                          '',
                          enterPhoneOrEmailCopy,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: StandardTextInput(
                            emailString,
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
                            orString,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: StandardTextInput(
                            phonNumberString,
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
                          child: (errorMessage.isEmpty)
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
                    actionLabel: continueString,
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
                            text: goBackToString,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: loginString.toLowerCase(),
                            style: const TextStyle(
                              color: AppColors.customBlueColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.router.replace(LoginRoute()),
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
