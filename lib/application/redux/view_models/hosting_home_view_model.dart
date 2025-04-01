import 'package:async_redux/async_redux.dart';
import 'package:fullbooker/application/redux/states/app_state.dart';
import 'package:fullbooker/domain/core/entities/product.dart';

class HostingHomeViewModel extends Vm {
  HostingHomeViewModel({
    required this.emailAddress,
    required this.password,
    required this.hidePassword,
    required this.products,
  }) : super(equals: <Object?>[emailAddress, password, hidePassword, products]);

  final String? emailAddress;
  final String? password;
  final bool hidePassword;
  final List<Product>? products;

  static HostingHomeViewModel fromState(AppState state) {
    return HostingHomeViewModel(
      emailAddress: state.onboardingState?.emailAddress,
      password: state.onboardingState?.password,
      hidePassword: state.onboardingState!.hidePassword,
      products: state.hostState?.products ?? <Product>[],
    );
  }
}
