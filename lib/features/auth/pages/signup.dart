import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  void goToLogIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                    height: 165,
                    width: double.infinity,
                    child: Column(children: [
                      Text("WELCOME",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Image(image: AssetImage("assets/logo_splash.png"))
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 515,
                  child: Column(
                    children: [
                      const Text("Sign up"),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: StandardTextInput("Name",
                              labelPrefix: Icons.person,
                              validator: validateName)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: StandardTextInput("Email Address",
                              labelPrefix: Icons.email_sharp,
                              validator: validateEmail)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: StandardTextInput("Password",
                              labelPrefix: Icons.key,
                              isPassword: true,
                              validator: validatePassword)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: StandardTextInput("Confirm Password",
                              labelPrefix: Icons.key,
                              isPassword: true,
                              validator: validatePassword)),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Button(const Text("SIGN UP"), () {})),
                      LabeledDivider(Colors.black, 15,
                          MediaQuery.of(context).size.width * 0.8, "Or"),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Button(
                              const Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/icons/google.png")),
                                  Text("Login with google",
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                              () {},
                              color: const Color(0xf0FEF3ED))),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Button(
                              const Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/icons/facebook.png")),
                                  Text("Login with Facebook",
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                              () {},
                              color: const Color(0xf0FEF3ED)))
                    ],
                  ),
                )),
            Expanded(
                child: Column(children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Already have an account ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Login",
                            style: const TextStyle(color: Color(0xf015B9FF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToLogIn(context))
                      ])))),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  child: RoundedDivider(height: 4, color: Colors.black))
            ]))
          ]),
        ));
  }
}
