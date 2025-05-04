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
    required this.productLocationEndpoint,
    required this.productScheduleEndpoint,
    required this.productMediaEndpoint,
    required this.productPricingEndpoint,
    required this.currenciesEndpoint,
    required this.bookingsEndpoint,
    required this.ticketsEndpoint,
    required this.validateTicketsEndpoint,
    required this.pricingOptionsEndpoint,
    required this.productPricingOptionsEndpoint,
    required this.productTransitionEndpoint,
    required this.hostsEndpoint,
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
  final String productLocationEndpoint;
  final String productScheduleEndpoint;
  final String productMediaEndpoint;
  final String productPricingEndpoint;
  final String currenciesEndpoint;
  final String bookingsEndpoint;
  final String ticketsEndpoint;
  final String validateTicketsEndpoint;
  final String pricingOptionsEndpoint;
  final String productPricingOptionsEndpoint;
  final String productTransitionEndpoint;
  final String hostsEndpoint;

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
  productLocationEndpoint: kDevLocationEndpoint,
  productScheduleEndpoint: kDevProductScheduleEndpoint,
  productMediaEndpoint: kDevMediaEndpoint,
  productPricingEndpoint: kDevPricingEndpoint,
  currenciesEndpoint: kDevCurrenciesEndpoint,
  bookingsEndpoint: kDevBookingsEndpoint,
  ticketsEndpoint: kDevTicketsEndpoint,
  validateTicketsEndpoint: kDevValidateTicketEndpoint,
  pricingOptionsEndpoint: kDevPricingOptionsEndpoint,
  productPricingOptionsEndpoint: kDevProductPricingOptionsEndpoint,
  productTransitionEndpoint: kDevProductTransitionEndpoint,
  hostsEndpoint: kDevHostsEndpoint,
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
  productLocationEndpoint: kProdLocationEndpoint,
  productScheduleEndpoint: kProdProductScheduleEndpoint,
  productMediaEndpoint: kProdMediaEndpoint,
  productPricingEndpoint: kProdPricingEndpoint,
  currenciesEndpoint: kProdCurrenciesEndpoint,
  bookingsEndpoint: kProdBookingsEndpoint,
  ticketsEndpoint: kProdTicketsEndpoint,
  validateTicketsEndpoint: kProdValidateTicketEndpoint,
  pricingOptionsEndpoint: kProdPricingOptionsEndpoint,
  productPricingOptionsEndpoint: kProdProductPricingOptionsEndpoint,
  productTransitionEndpoint: kProdProductTransitionEndpoint,
  hostsEndpoint: kProdHostsEndpoint,
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
  productLocationEndpoint: kTestLocationEndpoint,
  productScheduleEndpoint: kTestProductScheduleEndpoint,
  productMediaEndpoint: kTestMediaEndpoint,
  productPricingEndpoint: kTestPricingEndpoint,
  currenciesEndpoint: kTestCurrenciesEndpoint,
  bookingsEndpoint: kTestBookingsEndpoint,
  ticketsEndpoint: kTestTicketsEndpoint,
  validateTicketsEndpoint: kTestValidateTicketEndpoint,
  pricingOptionsEndpoint: kTestPricingOptionsEndpoint,
  productPricingOptionsEndpoint: kTestProductPricingOptionsEndpoint,
  productTransitionEndpoint: kTestProductTransitionEndpoint,
  hostsEndpoint: kProdHostsEndpoint,
);
