String? validateEmail(String? email) {
  if (email == null) return "Please enter your email";
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) return "Please enter a valid email";
  return null;
}

String? validateName(String? name) {
  if (name == null) return "Please enter your user name";
  if (name.isEmpty) return "Please enter your user name";
  if (name.split(" ").length < 2) return "Please enter one or more names";
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.length < 6) {
    return "Password length too short";
  }

  return null;
}
