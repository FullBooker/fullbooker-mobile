import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/request_otp_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/onboarding/widgets/already_have_account_banner.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/custom_text_input.dart';
import 'package:fullbooker/shared/validators.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:dartz/dartz.dart' as d;

@RoutePage()
class RequestOTPPage extends StatefulWidget {
  const RequestOTPPage({super.key});

  @override
  State<StatefulWidget> createState() => RequestOTPPageState();
}

class RequestOTPPageState extends State<RequestOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: <Widget>[
              StoreConnector<AppState, ResetPasswordViewModel>(
                converter: ResetPasswordViewModel.fromStore,
                builder: (
                  BuildContext context,
                  ResetPasswordViewModel vm,
                ) {
                  final bool isLoading = context.isWaiting(RequestOtpAction);

                  return PrimaryButton(
                    isLoading: isLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TextInput.finishAutofillContext();

                        context.dispatch(
                          RequestOtpAction(
                            onError: (String error) => showAlertDialog(
                              context: context,
                              assetPath: loginCredentialsSVGPath,
                              description: error,
                            ),
                            onSuccess: () async {
                              await AnalyticsService().logEvent(
                                name: requestOTPEvent,
                                eventType: AnalyticsEventType.ONBOARDING,
                              );
                              return context.router.push(VerifyOTPRoute());
                            },
                            client: AppWrapperBase.of(context)!.customClient,
                          ),
                        );
                      }
                    },
                    child: d.right(continueString),
                  );
                },
              ),
              AlreadyHaveAccountWidget(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: StoreConnector<AppState, ResetPasswordViewModel>(
                  converter: ResetPasswordViewModel.fromStore,
                  builder: (BuildContext context, ResetPasswordViewModel vm) {
                    return ListView(
                      children: <Widget>[
                        largeVerticalSizedBox,
                        SvgPicture.asset(prodAppLogoFullSVGPath),
                        smallVerticalSizedBox,
                        Center(
                          child: Column(
                            spacing: 4,
                            children: <Widget>[
                              Text(
                                resetYourPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              Text(
                                requestOTPCopy,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        largeVerticalSizedBox,
                        AutofillGroup(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              spacing: 12,
                              children: <Widget>[
                                // Email input
                                CustomTextInput(
                                  hintText: emailAddressHint,
                                  labelText: emailAddressString,
                                  autofillHints: const <String>[
                                    AutofillHints.email,
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: Validators.validateEmail,
                                  textInputAction: TextInputAction.done,
                                  onChanged: (String email) {
                                    context.dispatch(
                                      UpdateOnboardingStateAction(
                                        resetEmailAddress: email,
                                      ),
                                    );
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIconData: HeroIcons.envelope,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
