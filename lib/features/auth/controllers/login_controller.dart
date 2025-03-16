import 'package:fullbooker/config/environments.dart';
import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/domain/core/value_objects/endpoints.dart';
import 'package:fullbooker/features/auth/models/login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends BaseViewModel<Token> {
  late CRUDRepository<Token> _repository;
  @override
  CRUDRepository<Token> get repository => _repository;
  @override
  set repository(CRUDRepository<Token> repository) => _repository = repository;

  LoginViewModel() {
    repository = CRUDRepository<Token>('accounts', TokenSerializer());
  }

  Future<String?> login(String email, String password) async {
    try {
      final Map<String, String> data = <String, String>{
        'phone_number': email,
        'password': password,
      };
      final dynamic res =
          await _repository.post(data, signInEndpoint, withHeaders: false);
      switch (res.runtimeType) {
        case final Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, 'access_token');
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } catch (exception) {
      return 'We couldn’t sign you in. Please check that your email and password'
          ' are correct.';
    }

    return null;
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GetIt.I.get<GoogleSignIn>();
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) return 'Please choose a Google account to proceed';
      final GoogleSignInAuthentication auth = await account.authentication;
      final Map<String, String?> data = <String, String?>{
        'access_token': auth.accessToken,
      };

      final dynamic res = await _repository.post(
        data,
        googleSignInEndpoint,
        withHeaders: false,
      );
      switch (res.runtimeType) {
        case final Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, 'access');
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } catch (e) {
      return genericErrorString;
    }

    return null;
  }

  Future<String?> signup(
    String email,
    String phonNumber,
    String name,
    String password,
  ) async {
    final List<String> names = name.split(' ');
    final String firstName = names[0];
    final String lastName = names[1];
    final Map<String, String> data = <String, String>{
      'phone_number': phonNumber,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
    };
    try {
      final dynamic res = await _repository.post(data, signUpEndpoint);
      switch (res.runtimeType) {
        case final Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, 'access_token');
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } on Exception catch (exception) {
      return '$exception';
    }
    return null;
  }

  Future<String?> resetPassword(String phone) async {
    final Map<String, String> data = <String, String>{'identifier': phone};
    try {
      await _repository.post(data, requestOTPEndpoint);
    } catch (exception) {
      return verifyNumberString;
    }
    return null;
  }

  Future<String?> validateOtp(String otp, String phone) async {
    final Map<String, String> data = <String, String>{
      'identifier': phone,
      'otp': otp,
    };

    try {
      await _repository.post(data, verifyOTPEndpoint);
    } catch (exc) {
      return weCouldNotVerifyOTPString;
    }
    return null;
  }

  Future<String?> changePassword(String newPassword, String phoneNumber) async {
    final Map<String, String> data = <String, String>{
      'identifier': phoneNumber,
      'password': newPassword,
    };

    try {
      await _repository.post(data, resetPasswordEndpoint);
    } catch (exc) {
      return passwordTooCommonString;
    }

    return null;
  }
}
