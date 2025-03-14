import 'package:fullbooker/shared/entities/regexes.dart';

String? validateNotEmpty(String? val, {bool isOptional = false}) {
  if (isOptional) return null;
  if (val == null || val.isEmpty) {
    return 'The value of this field is required';
  }
  return null;
}

String? validateEmail(String? email, {bool isOptional = false}) {
  if (email == null && !isOptional) return null;
  if (email == null) return 'Please enter your email';
  final bool emailValid = validEmailRegex.hasMatch(email);
  if (!emailValid) return 'Please enter a valid email';
  return null;
}

String? validatePhoneNumber(String? number, {bool isOptional = false}) {
  if (number == null && !isOptional) return null;
  if (number == null) return 'Please enter your email';
  final bool isValidPhone = validPhoneRegex.hasMatch(number);
  if (!isValidPhone) return 'Please enter a valid phone number';
  return null;
}

String? validateName(String? name, {bool isOptional = false}) {
  if (name == null && !isOptional) return null;
  if (name == null) return 'Please enter your user name';
  if (name.isEmpty) return 'Please enter your user name';
  if (name.split(' ').length < 2) return 'Please enter one or more names';
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.length < 8) {
    return 'Password length too short';
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirm) {
  String? passConfirm = validatePassword(password);
  if (passConfirm != null) return passConfirm;
  passConfirm = validatePassword(confirm);
  if (passConfirm != null) return passConfirm;
  if (password != confirm) return 'Password do not match';
  return null;
}
