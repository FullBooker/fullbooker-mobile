import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/pages/password_reset.dart';
import 'package:fullbooker/features/auth/pages/signup.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var errors = false;

  void goToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const SignUp()));
  }

  void goToPasswordReset(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const PasswordReset()));
  }

  void login(String email, String password) {}

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 430,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text("Log in to your account"),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: StandardTextInput("Email",
                            labelPrefix: Icons.email_sharp,
                            validator: validateEmail,
                            controller: emailController)),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: StandardTextInput("Password",
                            labelPrefix: Icons.key,
                            isPassword: true,
                            validator: validatePassword,
                            controller: passwordController)),
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: "Forgot password ? Reset ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "here",
                                  style:
                                      const TextStyle(color: Color(0xf015B9FF)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => goToPasswordReset(context))
                            ])))),
                    Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Button(const Text("LOGIN"), () {})),
                    LabeledDivider(Colors.black, 15,
                        MediaQuery.of(context).size.width * 0.8, "Or"),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Button(
                            const Row(
                              children: [
                                Image(
                                    image:
                                        AssetImage("assets/icons/google.png")),
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
              ),
            ),
            Expanded(
                child: Column(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Dont have an account ?")),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child:
                      Button(const Text("SIGN UP"), () => goToSignUp(context))),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  child: RoundedDivider(height: 4, color: Colors.black))
            ]))
          ]),
        ));
  }
}
