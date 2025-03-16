// Google sign in scopes

final List<String> googleSignInScopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

const String devAPIEndpoint = 'api.dev.fullbooker.co.ke';

const String signInEndpoint = '/accounts/signin/';
const String googleSignInEndpoint = '/accounts/google/';
const String signUpEndpoint = '/accounts/signup/';
const String requestOTPEndpoint = '/accounts/otp/request';
const String verifyOTPEndpoint = '/accounts/otp/verify';
const String resetPasswordEndpoint =  '/accounts/password/reset';