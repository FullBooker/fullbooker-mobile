import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final loginController = LoginViewModel();
  bool isLoading = false;
  String errorMessage = "";
  bool signedUp = false;

  void goToLogIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }

  void signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var errFuture = loginController.signup(
          emailController.value.text,
          phoneNumberController.value.text,
          nameController.value.text,
          passwordController.value.text);
      String? errOuter;
      setState(() {
        isLoading = true;
        errorMessage = "";
      });
      errFuture.then((err) {
        setState(() {
          isLoading = false;
          if (err != null) errorMessage = err;
          if (err == null) signedUp = true;
        });
        errOuter = err;
      });
      if (errOuter == null && signedUp) goToLogIn(context);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (signedUp) goToLogIn(context);
    });
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
                child: PageHeader("Welcome", "Sign Up")),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: StandardTextInput("Name",
                                labelPrefix: Icons.person,
                                validator: validateName,
                                controller: nameController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: StandardTextInput("Email Address",
                                labelPrefix: Icons.email_sharp,
                                validator: validateEmail,
                                controller: emailController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: StandardTextInput("Phone Number",
                                labelPrefix: Icons.phone,
                                validator: validatePhoneNumber,
                                controller: phoneNumberController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: StandardTextInput("Password",
                                labelPrefix: Icons.key,
                                isPassword: true,
                                validator: validatePassword,
                                controller: passwordController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: StandardTextInput("Confirm Password",
                                labelPrefix: Icons.key,
                                isPassword: true,
                                controller: confirmController,
                                validator: (password) =>
                                    validateConfirmPassword(password,
                                        passwordController.value.text))),
                        Center(
                            child: (errorMessage == "")
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(errorMessage,
                                        style: const TextStyle(
                                            color: Colors.red)))),
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Button(() => signup(context),
                                loading: isLoading, actionLabel: "Sign Up")),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: LabeledDivider(Colors.black, 15,
                              MediaQuery.of(context).size.width * 0.8, "Or"),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Button(
                              () {},
                              color: const Color(0xf0F5F4F4),
                              actionLabel: "Sign in with google",
                              actionLabelPrefix: const Image(
                                  image: AssetImage("assets/icons/google.png")),
                              actionLabelColor: Colors.black,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Button(
                              () {},
                              color: const Color(0xf0F5F4F4),
                              actionLabel: "Sign in with facebook",
                              actionLabelPrefix: const Image(
                                  image:
                                      AssetImage("assets/icons/facebook.png")),
                              actionLabelColor: Colors.black,
                            ))
                      ],
                    ),
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
                      ]))))
            ]))
          ]),
        ));
  }
}
