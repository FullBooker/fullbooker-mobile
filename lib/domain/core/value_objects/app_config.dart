import 'package:fullbooker/core/common/constants.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/shared/entities/enums.dart';

class AppConfig {
  AppConfig({
    required this.appContext,
    required this.applicationName,
    required this.sentryDsn,
    required this.databaseName,
    required this.environment,
    required this.loginEndpoint,
    required this.createAccountEndpoint,
    required this.googleSignInEndpoint,
    required this.requestOTPEndpoint,
    required this.verifyOTPEndpoint,
    required this.changePasswordEndpoint,
    required this.getProductsEndpoint,
    required this.refreshTokenEndpoint,
    required this.getProfileEndpoint,
    required this.productCategoriesEndpoint,
    required this.productSubCategoriesEndpoint,
  });

  /// The context the app is running in
  final AppContext appContext;

  /// The name of the application
  final String applicationName;

  /// The Sentry DSN (Data Source Name) for error reporting
  final String sentryDsn;

  // Local DB name
  final String databaseName;

  /// The environment ('dev', 'prod')
  final String environment;

  /// Onboarding endpoints
  final String loginEndpoint;
  final String createAccountEndpoint;
  final String googleSignInEndpoint;
  final String requestOTPEndpoint;
  final String verifyOTPEndpoint;
  final String changePasswordEndpoint;
  final String refreshTokenEndpoint;

  /// Host side endpoints
  final String getProductsEndpoint;
  final String productCategoriesEndpoint;
  final String productSubCategoriesEndpoint;

  /// Profile endpoints
  final String getProfileEndpoint;
}

final AppConfig devAppConfig = AppConfig(
  appContext: AppContext.dev,
  databaseName: kDevDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.dev.name,
  applicationName: kDevAppName,
  loginEndpoint: kDevLoginEndpoint,
  createAccountEndpoint: kDevCreateAccountEndpoint,
  googleSignInEndpoint: kDevGoogleSignInEndpoint,
  requestOTPEndpoint: kDevRequestOTPEndpoint,
  verifyOTPEndpoint: kDevVerifyOTPEndpoint,
  changePasswordEndpoint: kDevResetPasswordEndpoint,
  getProductsEndpoint: kDevProductsEndpoint,
  refreshTokenEndpoint: kDevRefreshTokenEndpoint,
  getProfileEndpoint: kDevProfileEndpoint,
  productCategoriesEndpoint: kDevProductCategoriesEndpoint,
  productSubCategoriesEndpoint: kDevProductSubCategoriesEndpoint,
);

final AppConfig prodAppConfig = AppConfig(
  appContext: AppContext.prod,
  databaseName: kProdDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.prod.name,
  applicationName: kAppName,
  loginEndpoint: kProdLoginEndpoint,
  createAccountEndpoint: kProdCreateAccountEndpoint,
  googleSignInEndpoint: kProdGoogleSignInEndpoint,
  requestOTPEndpoint: kProdRequestOTPEndpoint,
  verifyOTPEndpoint: kProdVerifyOTPEndpoint,
  changePasswordEndpoint: kProdResetPasswordEndpoint,
  getProductsEndpoint: kProdProductsEndpoint,
  refreshTokenEndpoint: kProdRefreshTokenEndpoint,
  getProfileEndpoint: kProdProfileEndpoint,
  productCategoriesEndpoint: kProdProductCategoriesEndpoint,
  productSubCategoriesEndpoint: kProdProductSubCategoriesEndpoint,
);

final AppConfig testAppConfig = AppConfig(
  appContext: AppContext.test,
  databaseName: kDevDatabaseName,
  sentryDsn: '',
  environment: AppEnvironment.dev.name,
  applicationName: kDevAppName,
  loginEndpoint: kTestLoginEndpoint,
  createAccountEndpoint: kTestCreateAccountEndpoint,
  googleSignInEndpoint: kTestGoogleSignInEndpoint,
  requestOTPEndpoint: kTestRequestOTPEndpoint,
  verifyOTPEndpoint: kTestVerifyOTPEndpoint,
  changePasswordEndpoint: kTestResetPasswordEndpoint,
  getProductsEndpoint: kTestProductsEndpoint,
  refreshTokenEndpoint: kTestRefreshTokenEndpoint,
  getProfileEndpoint: kTestProfileEndpoint,
  productCategoriesEndpoint: kTestProductCategoriesEndpoint,
  productSubCategoriesEndpoint: kTestProductSubCategoriesEndpoint,
);
