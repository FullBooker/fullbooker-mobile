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

String? validateProductName(
  String? name, {
  bool isOptional = false,
}) {
  final String? trimmedName = name?.trim();

  if (trimmedName == null || trimmedName.isEmpty) {
    return isOptional ? null : 'Please name your product';
  }

  if (trimmedName.length < 3) {
    return 'Product name is too short.';
  }

  return null;
}

String? validateAmount(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Amount is required';
  }

  final double? parsed = double.tryParse(value);
  if (parsed == null) {
    return 'Please enter a valid amount';
  }

  if (parsed < 150) {
    return 'Amount must be at least 150';
  }

  if (parsed > 1000000) {
    return 'Amount must not exceed 1,000,000';
  }

  return null;
}

String? validateMaxTickets(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter max tickets';
  }

  final int? parsed = int.tryParse(value);
  if (parsed == null) {
    return 'Enter a valid number';
  }

  if (parsed < 1) {
    return 'At least one ticket is required';
  }

  if (parsed > 100000) {
    return 'Tickets must not exceed 10,000';
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
