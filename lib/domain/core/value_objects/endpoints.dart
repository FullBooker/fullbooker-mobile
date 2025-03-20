// Google sign in scopes

final List<String> googleSignInScopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

const String devAPIBaseURL = 'https://api.dev.fullbooker.co.ke';

const String loginEndpoint = '$devAPIBaseURL/accounts/signin/';
const String googleSignInEndpoint = '$devAPIBaseURL/accounts/google/';
const String signUpEndpoint = '/accounts/signup/';
const String requestOTPEndpoint = '/accounts/otp/request';
const String verifyOTPEndpoint = '/accounts/otp/verify';
const String resetPasswordEndpoint = '/accounts/password/reset';
const String hostsEndpoint = '/hosts/';
const String productsEndpoint = '/products/';
const String locationEndpoint = '/location/';
const String mediaEndpoint = '/media/';
const String pricingEndpoint = '/pricing/';
const String availabilityEndpoint = '/availability/';
