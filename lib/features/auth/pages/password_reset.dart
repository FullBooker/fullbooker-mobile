import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';

class RequestForEmail extends StatelessWidget {
  const RequestForEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
                height: 165,
                width: double.infinity,
                child: Column(children: [
                  Text("PASSWORD RESET",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Image(image: AssetImage("assets/logo_splash.png"))
                ]))),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: StandardTextInput("Email Address",
                labelPrefix: Icons.email_sharp)),
      ]),
    );
  }
}

enum ResetMode { RequestContact, SelectOptions }

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<StatefulWidget> createState() => PassWordResetState();
}

class PassWordResetState extends State<PasswordReset> {
  void goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(children: const [
            Expanded(flex: 1, child: RequestForEmail()),
          ]),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(children: [
                  Button(const Text("Request OTP"), () {}),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Go back to ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "login",
                            style: const TextStyle(color: Color(0xf015B9FF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToLogin(context))
                      ]),
                    ),
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                      child: RoundedDivider(height: 4, color: Colors.black))
                ])))
      ],
    ));
  }
}
