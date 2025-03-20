import 'package:fullbooker/shared/entities/regexes.dart';

// Login

String? validateEmail(String? email, {bool isOptional = false}) {
  final String? trimmedEmail = email?.trim();

  // If nothing was entered…
  if (trimmedEmail == null || trimmedEmail.isEmpty) {
    return isOptional ? null : 'Please enter your email address.';
  }

  final bool emailValid = validEmailRegex.hasMatch(trimmedEmail);
  if (!emailValid) return 'Please enter a valid email';
  return null;
}

String? validatePassword(String? password) {
  final String? trimmedPass = password?.trim();

  if (trimmedPass == null || trimmedPass.trim().isEmpty) {
    return 'Please enter your password.';
  }

  if (trimmedPass.length < 8) {
    return 'Password must be at least 8 characters';
  }

  return null;
}

String? validateConfirmPassword(
  String? confirmPassword,
  String? currentPassword,
) {
  final String? trimmedConfirmPass = confirmPassword?.trim();

  if (trimmedConfirmPass == null || trimmedConfirmPass.isEmpty) {
    return 'Please confirm your password.';
  }

  if (trimmedConfirmPass.length < 8) {
    return 'Confirm password must be at least 8 characters';
  }

  if (currentPassword?.trim() != trimmedConfirmPass) {
    return 'Passwords don\'t match.';
  }

  return null;
}

String? validateName(
  String? name, {
  required String fieldName,
  bool isOptional = false,
}) {
  final String? trimmedName = name?.trim();

  if (trimmedName == null || trimmedName.isEmpty) {
    return isOptional ? null : 'Please enter your $fieldName.';
  }

  if (trimmedName.length < 2) {
    return '$fieldName is too short.';
  }

  return null;
}

///------ OTHERS ------ REMOVE once done

String? validateNotEmpty(String? val, {bool isOptional = false}) {
  if (isOptional) return null;
  if (val == null || val.isEmpty) {
    return 'The value of this field is required';
  }
  return null;
}

String? validatePhoneNumber(String? number, {bool isOptional = false}) {
  if (number == null && !isOptional) return null;
  if (number == null) return 'Please enter your email';
  final bool isValidPhone = validPhoneRegex.hasMatch(number);
  if (!isValidPhone) return 'Please enter a valid phone number';
  return null;
}
