import 'dart:math';

String randomString({int length = 6}) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

double randomDouble({double max = 2000}) {
  Random rnd = Random();
  return rnd.nextDouble();
}

int randomInt({int max = 2000}) {
  Random rnd = Random();
  return rnd.nextInt(max);
}
