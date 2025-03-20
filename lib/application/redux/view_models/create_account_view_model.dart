import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';

class CreateAccountViewModel extends Vm {
  CreateAccountViewModel({
    required this.firstName,
    required this.lastName,
    required this.newEmailAddress,
    required this.newPassword,
    required this.hideNewPassword,
    required this.newConfirmPassword,
    required this.hideNewConfirmPassword,
  }) : super(
          equals: <Object?>[
            firstName,
            lastName,
            newEmailAddress,
            newPassword,
            hideNewPassword,
            newConfirmPassword,
            hideNewConfirmPassword,
          ],
        );

  final String firstName;
  final String lastName;
  final String newEmailAddress;
  final String newPassword;
  final bool hideNewPassword;
  final String newConfirmPassword;
  final bool hideNewConfirmPassword;

  static CreateAccountViewModel fromState(AppState state) {
    return CreateAccountViewModel(
      firstName: state.onboardingState?.firstName ?? '',
      lastName: state.onboardingState?.lastName ?? '',
      newEmailAddress: state.onboardingState?.newEmailAddress ?? '',
      newPassword: state.onboardingState?.newPassword ?? '',
      hideNewPassword: state.onboardingState?.hideNewPassword ?? true,
      newConfirmPassword: state.onboardingState?.newConfirmPassword ?? '',
      hideNewConfirmPassword:
          state.onboardingState?.hideNewConfirmPassword ?? true,
    );
  }
}
