import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/request_otp.dart';
import 'package:fullbooker/features/auth/pages/signup.dart';
import 'package:fullbooker/features/events/pages/summary.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';

class Login extends StatefulWidget {
  final bool goBackToOrigin;
  const Login({super.key, this.goBackToOrigin = false});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final loginController = LoginViewModel();
  String errorMessage = "";
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool logedIn = false;

  void goToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const SignUp()));
  }

  void goToPasswordReset(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const RequestOtp()));
  }

  void goToEventsSummary(BuildContext context) {
    if (widget.goBackToOrigin) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.pop(context));
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const EventsSummary()));
    });
  }

  void login(String email, String password) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var errFuture = loginController.login(email, password);
      setState(() {
        loading = true;
        errorMessage = "";
      });
      errFuture.then((err) {
        setState(() {
          loading = false;
          if (err != null) errorMessage = err;
          if (err == null) logedIn = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (logedIn) goToEventsSummary(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            const PageHeader("Welcome", "Sign in to your account"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: StandardTextInput("Phone Number",
                            labelPrefix: Icons.phone,
                            validator: validatePhoneNumber,
                            controller: emailController)),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: StandardTextInput("Password",
                            labelPrefix: Icons.key,
                            isPassword: true,
                            validator: validatePassword,
                            controller: passwordController)),
                    Center(
                        child: (errorMessage == "")
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(errorMessage,
                                    style:
                                        const TextStyle(color: Colors.red)))),
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: "Forgot password ? ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "Reset here",
                                  style:
                                      const TextStyle(color: Color(0xf015B9FF)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => goToPasswordReset(context))
                            ])))),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Button(
                            () => login(emailController.value.text,
                                passwordController.value.text),
                            actionLabel: "Sign In",
                            loading: loading)),
                    LabeledDivider(Colors.black, 15,
                        MediaQuery.of(context).size.width * 0.8, "Or"),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Button(() {},
                            color: const Color(0xf0F5F4F4),
                            actionLabel: "Sign in with google",
                            actionLabelColor: Colors.black,
                            actionLabelPrefix: const Image(
                                image: AssetImage("assets/icons/google.png")))),
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Button(() {},
                            color: const Color(0xf0F5F4F4),
                            actionLabel: "Sign in with Facebook",
                            actionLabelColor: Colors.black,
                            actionLabelPrefix: const Image(
                                image:
                                    AssetImage("assets/icons/facebook.png"))))
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Dont have an account ? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(color: Color(0xf015B9FF)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => goToSignUp(context))
                  ]),
                ),
              ),
            )
          ]),
        ));
  }
}
