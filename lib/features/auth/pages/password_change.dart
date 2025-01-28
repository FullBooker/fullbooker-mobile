import 'package:flutter/material.dart';
import 'package:fullbooker/features/auth/controllers/login.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/button.dart';
import 'package:fullbooker/shared/widgets/information_modal.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';
import 'package:fullbooker/shared/widgets/text_input.dart';

class PasswordChange extends StatefulWidget {
  final String phoneNumber;

  const PasswordChange(this.phoneNumber, {super.key});

  @override
  State<StatefulWidget> createState() => PasswordChangeState();
}

class PasswordChangeState extends State<PasswordChange> {
  final _formKey = GlobalKey<FormState>();
  var errorMessage = "";
  final loginController = LoginViewModel();
  bool isLoading = false;
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool passwordChanged = false;
  bool modalOpened = false;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return InformationModal(
            title: "PASSWORD RESET SUCCESSFULLY",
            message: "You have reset your\npassword sucessfully",
            actionTitle: "Home",
            action: () => goToLogin(context),
          );
        });
  }

  void goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Login()));
  }

  void showModal(BuildContext context) {
    modalOpened = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogBuilder(context).then((_) {
        if (!context.mounted) return;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
      });
    });
  }

  void changePassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var errFuture = loginController.changePassword(
          passwordController.value.text, widget.phoneNumber);
      setState(() {
        isLoading = true;
        errorMessage = "";
      });
      errFuture.then((err) {
        setState(() {
          isLoading = false;
          if (err != null) errorMessage = err;
          if (err == null) passwordChanged = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (passwordChanged & !modalOpened) showModal(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
              child: ListView(children: [
            const PageHeader("", "Please enter a new password below"),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: StandardTextInput("Enter New Password",
                                labelPrefix: Icons.key,
                                isPassword: true,
                                validator: validatePassword,
                                controller: passwordController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: StandardTextInput("Re-enter New Password",
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
                      ],
                    ),
                  ),
                )),
          ])),
          Align(
              child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                child: Button(() => changePassword(context),
                    actionLabel: "Change Password", loading: isLoading))
          ]))
        ],
      ),
    ));
  }
}
