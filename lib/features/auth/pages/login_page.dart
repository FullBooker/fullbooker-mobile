import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/login_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/login_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/widgets/divider_with_text.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                SvgPicture.asset(appLogoFullSVGPath),
                smallVerticalSizedBox,
                Center(
                  child: Column(
                    spacing: 4,
                    children: <Widget>[
                      Text(
                        letsGetStarted,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      Text(
                        loginPageCopy,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                largeVerticalSizedBox,
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Email input
                      CustomTextInput(
                        hintText: emailAddressHint,
                        labelText: emailAddressString,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? email) => validateEmail(email),
                        onChanged: (String email) {
                          context.dispatch(
                            UpdateOnboardingStateAction(emailAddress: email),
                          );
                        },
                        // hintText: newTransactionAmountHint,
                        keyboardType: TextInputType.emailAddress,
                        prefixIconData: HeroIcons.envelope,
                      ),
                      mediumVerticalSizedBox,

                      // Password input
                      CustomTextInput(
                        labelText: passwordString,
                        hintText: passwordHint,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? password) =>
                            validatePassword(password),
                        onChanged: (String v) {
                          context.dispatch(
                            UpdateOnboardingStateAction(password: v.trim()),
                          );
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
                          // onTap: () => context.router.push(RequestOTPRoute()),
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
                      smallVerticalSizedBox,

                      StoreConnector<AppState, LoginPageViewModel>(
                        converter: (Store<AppState> store) =>
                            LoginPageViewModel.fromState(store.state),
                        builder: (
                          BuildContext context,
                          LoginPageViewModel snapshot,
                        ) {
                          if (context.isWaiting(LoginAction)) {
                            return AppLoading();
                          }

                          return PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.dispatch(
                                  LoginAction(
                                    onError: (String error) => showAlertDialog(
                                      context: context,
                                      assetPath: loginCredentialsSVGPath,
                                      description: error,
                                    ),
                                    onSuccess: () => context.router
                                        .navigate(HostingHomeRoute()),
                                    client: AppWrapperBase.of(context)!
                                        .customClient,
                                  ),
                                );
                              }
                            },
                            child: d.right(loginString),
                          );
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: DividerWithText(text: orString),
                      ),
                      SecondaryButton(
                        onPressed: () {
                          loginWithGoogle();
                        },
                        child: d.left(
                          Center(
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(googleIconSVGPath),
                                Text(
                                  signInWithGoogleString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
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
                          TextSpan(
                            text: dontHaveAccountString,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: createAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
