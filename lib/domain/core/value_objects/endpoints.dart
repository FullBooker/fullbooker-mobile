// Google sign in scopes

final List<String> googleSignInScopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

///---- DEV Endpoints
const String kDevAPIBaseURL = 'https://api.dev.fullbooker.co.ke';
const String kDevLoginEndpoint = '$kDevAPIBaseURL/accounts/signin/';
const String kDevGoogleSignInEndpoint = '$kDevAPIBaseURL/accounts/google/';
const String kDevCreateAccountEndpoint = '$kDevAPIBaseURL/accounts/signup/';
// ---- Implemented
const String kDevRequestOTPEndpoint = '$kDevAPIBaseURL/accounts/otp/request';
const String kDevVerifyOTPEndpoint = '$kDevAPIBaseURL/accounts/otp/verify';
const String kDevResetPasswordEndpoint =
    '$kDevAPIBaseURL/accounts/password/reset';
const String kDevHostsEndpoint = '$kDevAPIBaseURL/hosts/';
const String kDevProductsEndpoint = '$kDevAPIBaseURL/products/';
const String kDevLocationEndpoint = '$kDevAPIBaseURL/location/';
const String kDevMediaEndpoint = '$kDevAPIBaseURL/media/';
const String kDevPricingEndpoint = '$kDevAPIBaseURL/pricing/';
const String kDevAvailabilityEndpoint = '$kDevAPIBaseURL/availability/';

///---- PROD Endpoints
const String kProdAPIBaseURL = 'https://api.fullbooker.co.ke';
const String kProdLoginEndpoint = '$kProdAPIBaseURL/accounts/signin/';
const String kProdGoogleSignInEndpoint = '$kProdAPIBaseURL/accounts/google/';
const String kProdCreateAccountEndpoint = '$kProdAPIBaseURL/accounts/signup/';
// ---- Implemented
const String kProdRequestOTPEndpoint = '$kProdAPIBaseURL/accounts/otp/request';
const String kProdVerifyOTPEndpoint = '$kProdAPIBaseURL/accounts/otp/verify';
const String kProdResetPasswordEndpoint =
    '$kProdAPIBaseURL/accounts/password/reset';
const String kProdHostsEndpoint = '$kProdAPIBaseURL/hosts/';
const String kProdProductsEndpoint = '$kProdAPIBaseURL/products/';
const String kProdLocationEndpoint = '$kProdAPIBaseURL/location/';
const String kProdMediaEndpoint = '$kProdAPIBaseURL/media/';
const String kProdPricingEndpoint = '$kProdAPIBaseURL/pricing/';
const String kProdAvailabilityEndpoint = '$kProdAPIBaseURL/availability/';

///---- TEST Endpoints
const String kTestAPIBaseURL = 'https://api.dev.fullbooker.co.ke';
const String kTestLoginEndpoint = '$kTestAPIBaseURL/accounts/signin/';
const String kTestGoogleSignInEndpoint = '$kTestAPIBaseURL/accounts/google/';
const String kTestCreateAccountEndpoint = '$kTestAPIBaseURL/accounts/signup/';
// ---- Implemented
const String kTestRequestOTPEndpoint = '$kTestAPIBaseURL/accounts/otp/request';
const String kTestVerifyOTPEndpoint = '$kTestAPIBaseURL/accounts/otp/verify';
const String kTestResetPasswordEndpoint =
    '$kTestAPIBaseURL/accounts/password/reset';
const String kTestHostsEndpoint = '$kTestAPIBaseURL/hosts/';
const String kTestProductsEndpoint = '$kTestAPIBaseURL/products/';
const String kTestLocationEndpoint = '$kTestAPIBaseURL/location/';
const String kTestMediaEndpoint = '$kTestAPIBaseURL/media/';
const String kTestPricingEndpoint = '$kTestAPIBaseURL/pricing/';
const String kTestAvailabilityEndpoint = '$kTestAPIBaseURL/availability/';
