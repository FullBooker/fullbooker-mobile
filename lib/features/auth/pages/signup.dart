import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/features/consumer/pages/landing_page.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/standard_nav_bar.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';
import 'package:fullbooker/shared/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final LoginViewModel loginController = LoginViewModel();
  bool isLoading = false;
  String errorMessage = '';
  bool signedUp = false;

  void goToLogIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<Login>(
        builder: (BuildContext context) => const Login(),
      ),
    );
  }

  void signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final Future<String?> errFuture = loginController.signup(
        emailController.value.text,
        phoneNumberController.value.text,
        '${nameController.value.text} ${lastNameController.value.text}',
        passwordController.value.text,
      );
      String? errOuter;
      setState(() {
        isLoading = true;
        errorMessage = '';
      });
      errFuture.then((String? err) {
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

  void goToEventsSummary(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<LandingPage>(builder: (_) => const LandingPage()),
      );
    });
  }

  void loginWithGoogle() {
    final Future<String?> errFuture = loginController.signInWithGoogle();
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    errFuture.then((String? err) {
      setState(() {
        isLoading = false;
        if (err != null) errorMessage = err;
        if (err == null) signedUp = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (signedUp) goToEventsSummary(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signedUp) goToEventsSummary(context);

    return Scaffold(
      appBar: const StandardNavBar(
        showSearchBar: false,
        iconsColor: Colors.black,
        pageTitle: 'WELCOME',
        showRightAction: false,
        height: 36,
        tileFontSize: 20,
        titleFontWeight: FontWeight.w900,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: PageHeader(
                '',
                'Sign Up',
                headerPadding: 10,
                headerTopPadding: 0,
                pageTitleBottomPadding: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'First Name',
                          labelPrefix: Icons.person,
                          validator: validateNotEmpty,
                          controller: nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'Last Name',
                          labelPrefix: Icons.person,
                          validator: validateNotEmpty,
                          controller: lastNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'Email Address',
                          labelPrefix: Icons.email_sharp,
                          validator: validateEmail,
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'Phone Number',
                          labelPrefix: Icons.phone,
                          validator: validatePhoneNumber,
                          controller: phoneNumberController,
                          maxLength: 13,
                          formatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'Password',
                          labelPrefix: Icons.key,
                          isPassword: true,
                          validator: validatePassword,
                          controller: passwordController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StandardTextInput(
                          'Confirm Password',
                          labelPrefix: Icons.key,
                          isPassword: true,
                          controller: confirmController,
                          validator: (String? password) =>
                              validateConfirmPassword(
                            password,
                            passwordController.value.text,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Button(
                          () => signup(context),
                          loading: isLoading,
                          actionLabel: 'Sign Up',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: LabeledDivider(
                          Colors.black,
                          15,
                          MediaQuery.of(context).size.width * 0.8,
                          'Or',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Button(
                          loginWithGoogle,
                          color: const Color(0xf0F5F4F4),
                          actionLabel: 'Sign up with Google',
                          actionLabelPrefix: const Image(
                            image: AssetImage('assets/icons/google.png'),
                          ),
                          actionLabelColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          const TextSpan(
                            text: 'Already have an account ? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(color: Color(0xf015B9FF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => goToLogIn(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
