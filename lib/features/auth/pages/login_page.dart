import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/login_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/theme/app_colors.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/old_buttons.dart';
import 'package:fullbooker/shared/widgets/divider.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final bool goBackToOrigin;
  const LoginPage({super.key, this.goBackToOrigin = false});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  bool loading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loggedIn = false;

  void login(String email, String password) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // final Future<String?> errFuture = loginController.login(email, password);
      setState(() {
        loading = true;
        errorMessage = '';
      });
      // errFuture.then((String? err) {
      //   setState(() {
      //     loading = false;
      //     if (err != null) errorMessage = err;
      //     if (err == null) loggedIn = true;
      //   });
      // });
    }
  }

  void loginWithGoogle() {
    // final Future<String?> errFuture = loginController.signInWithGoogle();
    // setState(() {
    //   loading = true;
    //   errorMessage = '';
    // });
    // errFuture.then((String? err) {
    //   setState(() {
    //     loading = false;
    //     if (err != null) errorMessage = err;
    //     if (err == null) loggedIn = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StoreConnector<AppState, LoginPageViewModel>(
          converter: (Store<AppState> store) =>
              LoginPageViewModel.fromState(store.state),
          builder: (BuildContext context, LoginPageViewModel snapshot) {
            return ListView(
              children: <Widget>[
                largeVerticalSizedBox,
                Image(image: AssetImage(logoSplashImagePath)),
                largeVerticalSizedBox,
                Center(
                  child: Text(
                    letsGetStarted,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                largeVerticalSizedBox,
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextInput(
                        labelText: emailAddressString,
                        validator: (String? value) {
                          // TODO(abiud): check this email value against a regex
                          return null;
                        },
                        onChanged: (String v) {
                          // TODO(abiud): update state
                        },
                        // hintText: newTransactionAmountHint,
                        keyboardType: TextInputType.emailAddress,
                        prefixIconData: HeroIcons.envelope,
                      ),
                      mediumVerticalSizedBox,
                      CustomTextInput(
                        labelText: passwordString,
                        validator: (String? value) {
                          // TODO(abiud): check this email value against a regex
                          return null;
                        },
                        onChanged: (String v) {
                          // TODO(abiud): update state
                        },
                        // hintText: newTransactionAmountHint,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const <String>[
                          AutofillHints.password,
                        ],
                        prefixIconData: HeroIcons.key,
                        suffixIconData: HeroIcons.eyeSlash,
                        obscureText: true,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () => context.router.push(RequestOTPRoute()),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              textAlign: TextAlign.right,
                              forgotPasswordString,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: OldButton(
                          () => login(
                            emailController.value.text,
                            passwordController.value.text,
                          ),
                          actionLabel: signInString,
                          loading: loading,
                        ),
                      ),
                      LabeledDivider(
                        AppColors.inputBackgroundColor,
                        15,
                        MediaQuery.of(context).size.width * 0.8,
                        orString,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: OldButton(
                          loginWithGoogle,
                          color: const Color(0xf0F5F4F4),
                          actionLabel: signInWithGoogleString,
                          actionLabelColor: Colors.black,
                          actionLabelPrefix: const Image(
                            image: AssetImage(googleIconPath),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          const TextSpan(
                            text: dontHaveAccountString,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: signUpString,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.router.push(SignUpRoute()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
