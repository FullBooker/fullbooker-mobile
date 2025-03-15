import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/features/auth/controllers/login_controller.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final bool goBackToOrigin;
  const LoginPage({super.key, this.goBackToOrigin = false});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginViewModel loginController = LoginViewModel();
  String errorMessage = '';
  bool loading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loggedIn = false;

  void login(String email, String password) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final Future<String?> errFuture = loginController.login(email, password);
      setState(() {
        loading = true;
        errorMessage = '';
      });
      errFuture.then((String? err) {
        setState(() {
          loading = false;
          if (err != null) errorMessage = err;
          if (err == null) loggedIn = true;
        });
      });
    }
  }

  void loginWithGoogle() {
    final Future<String?> errFuture = loginController.signInWithGoogle();
    setState(() {
      loading = true;
      errorMessage = '';
    });
    errFuture.then((String? err) {
      setState(() {
        loading = false;
        if (err != null) errorMessage = err;
        if (err == null) loggedIn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            const Center(
              child: Text(
                'WELCOME',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const PageHeader(
              '',
              'Sign in to your account',
              pageDescriptionPadding: 0,
              headerTopPadding: 0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: StandardTextInput(
                        'Phone Number',
                        labelPrefix: Icons.phone,
                        validator: validatePhoneNumber,
                        controller: emailController,
                        maxLength: 13,
                        formatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: StandardTextInput(
                        'Password',
                        labelPrefix: Icons.key,
                        isPassword: true,
                        validator: validatePassword,
                        controller: passwordController,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: RichText(
                          text: TextSpan(
                            children: <InlineSpan>[
                              const TextSpan(
                                text: 'Forgot password ? ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Reset here',
                                style:
                                    const TextStyle(color: Color(0xf015B9FF)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      context.router.push(RequestOTPRoute()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Button(
                        () => login(
                          emailController.value.text,
                          passwordController.value.text,
                        ),
                        actionLabel: 'Sign In',
                        loading: loading,
                      ),
                    ),
                    LabeledDivider(
                      Colors.black,
                      15,
                      MediaQuery.of(context).size.width * 0.8,
                      'Or',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Button(
                        loginWithGoogle,
                        color: const Color(0xf0F5F4F4),
                        actionLabel: 'Sign in with Google',
                        actionLabelColor: Colors.black,
                        actionLabelPrefix: const Image(
                          image: AssetImage('assets/icons/google.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(
                        text: 'Dont have an account ? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(color: Color(0xf015B9FF)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.router.push(SignUpRoute()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
