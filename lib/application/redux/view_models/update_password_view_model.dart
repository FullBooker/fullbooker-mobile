import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class UpdatePasswordViewModel extends Vm {
  UpdatePasswordViewModel({
    required this.currentPassword,
    required this.changePassword,
    required this.changePasswordConfirm,
    required this.hideCurrentPassword,
    required this.hideChangePassword,
    required this.hideChangeConfirmPassword,
  }) : super(
          equals: <Object?>[
            currentPassword,
            changePassword,
            changePasswordConfirm,
            hideCurrentPassword,
            hideChangePassword,
            hideChangeConfirmPassword,
          ],
        );

  final String currentPassword;
  final String changePassword;
  final String changePasswordConfirm;
  final bool hideCurrentPassword;
  final bool hideChangePassword;
  final bool hideChangeConfirmPassword;

  static UpdatePasswordViewModel fromState(AppState state) {
    return UpdatePasswordViewModel(
      currentPassword: state.onboardingState?.currentPassword ?? '',
      changePassword: state.onboardingState?.changePassword ?? '',
      changePasswordConfirm: state.onboardingState!.changePasswordConfirm,
      hideCurrentPassword: state.onboardingState!.hideCurrentPassword,
      hideChangePassword: state.onboardingState!.hideChangePassword,
      hideChangeConfirmPassword:
          state.onboardingState!.hideChangeConfirmPassword,
    );
  }
}
