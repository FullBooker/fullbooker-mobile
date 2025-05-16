import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fullbooker/application/core/services/analytics_service.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/request_otp_action.dart';
import 'package:fullbooker/application/redux/actions/update_onboarding_state_action.dart';
import 'package:fullbooker/application/redux/actions/verify_otp_action.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/application/redux/view_models/reset_password_view_model.dart';
import 'package:fullbooker/core/common/app_router.gr.dart';
import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/core/utils/utils.dart';
import 'package:fullbooker/domain/core/value_objects/analytics_events.dart';
import 'package:fullbooker/domain/core/value_objects/app_config.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/asset_paths.dart';
import 'package:fullbooker/presentation/onboarding/widgets/already_have_account_banner.dart';
import 'package:fullbooker/presentation/shared/custom_bottom_nav_container.dart';
import 'package:fullbooker/shared/entities/enums.dart';
import 'package:fullbooker/shared/entities/spaces.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:fullbooker/shared/widgets/pin_code_text_field.dart';
import 'package:fullbooker/shared/widgets/primary_button.dart';
import 'package:fullbooker/shared/widgets/secondary_button.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:get_it/get_it.dart';

@RoutePage()
class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<StatefulWidget> createState() => VerifyOTPPageState();
}

class VerifyOTPPageState extends State<VerifyOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer timer;
  int counter = kOTPRetryTimeout;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String timerText() {
    final int minutes = counter ~/ 60;
    final int seconds = counter % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
                  final bool loading = context.isWaiting(VerifyOTPAction);

                  return PrimaryButton(
                    isLoading: loading,
                    onPressed: () {
                      context.dispatch(
                        VerifyOTPAction(
                          onError: (String error) => showAlertDialog(
                            context: context,
                            assetPath: loginCredentialsSVGPath,
                            description: error,
                          ),
                          onSuccess: () async {
                            await AnalyticsService().logEvent(
                              name: verifyOTPEvent,
                              eventType: AnalyticsEventType.ONBOARDING,
                            );
                            context.dispatch(
                              UpdateOnboardingStateAction(
                                resetPasswordOTP: UNKNOWN,
                                resetPasswordDebugOTP: UNKNOWN,
                              ),
                            );
                            context.router.push(ChangePasswordRoute());
                          },
                          client: AppWrapperBase.of(context)!.customClient,
                        ),
                      );
                    },
                    child: d.right(verifyOTPString),
                  );
                },
              ),
              AlreadyHaveAccountWidget(),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: StoreConnector<AppState, ResetPasswordViewModel>(
                  converter: ResetPasswordViewModel.fromStore,
                  builder: (BuildContext context, ResetPasswordViewModel vm) {
                    final bool showDebugOTP =
                        GetIt.I.get<AppConfig>().environment.toLowerCase() ==
                                'dev' &&
                            vm.resetPasswordDebugOTP != UNKNOWN;
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
                                resetYourPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              Text(
                                otpSentCopy(vm.resetEmailAddress),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        largeVerticalSizedBox,
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 12,
                            children: <Widget>[
                              PINInputField(
                                onDone: (String otp) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      resetPasswordOTP: otp,
                                    ),
                                  );
                                },
                                onTextChanged: (String otp) {
                                  context.dispatch(
                                    UpdateOnboardingStateAction(
                                      resetPasswordOTP: otp,
                                    ),
                                  );
                                },
                              ),
                              if (counter > 0)
                                RichText(
                                  text: TextSpan(
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: resendCodeInString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      TextSpan(
                                        text: timerText(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              else
                                StoreConnector<AppState,
                                    ResetPasswordViewModel>(
                                  converter: ResetPasswordViewModel.fromStore,
                                  builder: (
                                    BuildContext context,
                                    ResetPasswordViewModel vm,
                                  ) {
                                    if (context.isWaiting(RequestOtpAction)) {
                                      return AppLoading();
                                    }

                                    return Column(
                                      children: <Widget>[
                                        SecondaryButton(
                                          child: d.right(resentOTPString),
                                          onPressed: () {
                                            context.dispatch(
                                              RequestOtpAction(
                                                onError: (String error) {},
                                                onSuccess: () async {
                                                  await AnalyticsService()
                                                      .logEvent(
                                                    name: resendOTPEvent,
                                                    eventType:
                                                        AnalyticsEventType
                                                            .ONBOARDING,
                                                  );
                                                },
                                                client:
                                                    AppWrapperBase.of(context)!
                                                        .customClient,
                                              ),
                                            );
                                          },
                                          fillColor: Colors.transparent,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              if (showDebugOTP)
                                Text(
                                  debugOTPValue(vm.resetPasswordDebugOTP),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                            ],
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
