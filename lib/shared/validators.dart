String? validateEmail(String? email, {isOptional = false}) {
  if (email == null && !isOptional) return null;
  if (email == null) return "Please enter your email";
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) return "Please enter a valid email";
  return null;
}

String? validatePhoneNumber(String? number, {isOptional = false}) {
  if (number == null && !isOptional) return null;
  if (number == null) return "Please enter your email";
  bool emailValid = RegExp(r"^(?:\+?254|0)?(7|1)[0-9]{8}$").hasMatch(number);
  if (!emailValid) return "Please enter a valid phone number";
  return null;
}

String? validateName(String? name, {isOptional = false}) {
  if (name == null && !isOptional) return null;
  if (name == null) return "Please enter your user name";
  if (name.isEmpty) return "Please enter your user name";
  if (name.split(" ").length < 2) return "Please enter one or more names";
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.length < 8) {
    return "Password length too short";
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirm) {
  var passConfirm = validatePassword(password);
  if (passConfirm != null) return passConfirm;
  passConfirm = validatePassword(confirm);
  if (passConfirm != null) return passConfirm;
  if (password != confirm) return "Password donot match";
  return null;
}
