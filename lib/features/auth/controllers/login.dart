import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/core/repository.dart';
import 'package:fullbooker/core/view_model.dart';
import 'package:fullbooker/features/auth/models/login.dart';

class LoginViewModel extends BaseViewModel<Token> {
  late CRUDRepository<Token> _repository;
  @override
  CRUDRepository<Token> get repository => _repository;
  @override
  set repository(CRUDRepository<Token> repository) => _repository = repository;

  LoginViewModel() {
    repository = CRUDRepository<Token>("accounts", TokenSerializer());
  }

  Future<String?> login(String email, String password) async {
    try {
      var data = {"phone_number": email, "password": password};
      var res =
          await _repository.post(data, "/accounts/signin/", withHeaders: false);
      switch (res.runtimeType) {
        case Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, "access_token");
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } catch (exception) {
      return "We couldn’t sign you in. Please check that your email and password"
          " are correct.";
    }

    return null;
  }

  Future<String?> signInWithGoogle() async {
    try {
      var account = await googleSignIn.signIn();
      if (account == null) return "Please choose a Google account to proceed";
      var auth = await account.authentication;
      var data = {"access_token": auth.accessToken};
      var res =
          await _repository.post(data, "/accounts/google/", withHeaders: false);
      switch (res.runtimeType) {
        case Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, "access");
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } catch (e) {
      return "Oops! Something went wrong on our end, please try again";
    }

    return null;
  }

  Future<String?> signup(
      String email, String phonNumber, String name, String password) async {
    var names = name.split(" ");
    String firstName = names[0];
    String lastName = names[1];
    var data = {
      "phone_number": phonNumber,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
    };
    try {
      var res = await _repository.post(data, "/accounts/signup/");
      switch (res.runtimeType) {
        case Token val:
          await repository.store.set(res);
          currentToken = val;
        default:
          await repository.store.setData(res, "access_token");
          currentToken =
              TokenSerializer().fromJson(res as Map<String, Object?>);
      }
    } on Exception catch (exception) {
      return "$exception";
    }
    return null;
  }

  Future<String?> resetPassword(String phone) async {
    var data = {"identifier": phone};
    try {
      await _repository.post(data, "/accounts/otp/request");
    } catch (exception) {
      return "Please verify that the number you entered is correct";
    }
    return null;
  }

  Future<String?> validateOtp(String otp, String phone) async {
    var data = {"identifier": phone, "otp": otp};

    try {
      await _repository.post(data, "/accounts/otp/verify");
    } catch (exc) {
      return "We could not verify that OTP, please try again";
    }
    return null;
  }

  Future<String?> changePassword(String newPassword, String phoneNumber) async {
    var data = {"identifier": phoneNumber, "password": newPassword};

    try {
      await _repository.post(data, "/accounts/password/reset");
    } catch (exc) {
      return "Please verify that your password is not too common";
    }

    return null;
  }
}
