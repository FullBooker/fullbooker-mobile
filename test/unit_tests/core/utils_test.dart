import 'package:flutter_test/flutter_test.dart';
import 'package:fullbooker/core/utils/utils.dart';

void main() {
  group('getInitials', () {
    test('handles initials in the input', () {
      expect(getInitials(''), ''); // empty
      expect(getInitials('John'), 'J'); // single word
      expect(getInitials('John Doe'), 'JD'); // 2 words
      expect(getInitials('John Michael Doe'), 'JM'); // more than 2
      expect(getInitials('  John   Doe  '), 'JD'); // spaces
      expect(getInitials('john doe'), 'JD');
      expect(getInitials('John #Doe'), 'J#'); // non alphabetic
      expect(getInitials('J'), 'J'); // single char
      expect(getInitials('A B C D'), 'AB'); // initials with more than 2 chars
    });
  });
}
