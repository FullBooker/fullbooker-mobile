RegExp validEmailRegex = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);

RegExp validPhoneRegex = RegExp(r'^(?:\+?254|0)?[0-9]\d{8}$');

RegExp cleanSRIDRegex = RegExp(r'[\(][-?0-9.]+\s[-?0-9.]+[\)]');
