import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
}

void testNum() {
  test('StringUtil', () {
    _print(StringUtil.isEmpty(null)); //true
    _print(StringUtil.isEmpty('')); //true
    _print(StringUtil.isEmpty('   ')); //false
    _print(StringUtil.isEmpty('   ', emptyValue: true)); //true
    _print(StringUtil.isEmpty('null')); //false
    _print(StringUtil.formatDigitPattern('text1234', 3, ' '));
    _print(StringUtil.formatDigitPattern('text1234', 3, ' ', end: true));
    _print(StringUtil.formatDigitPattern('text1234', 3, ' ', repeat: false));
    _print(StringUtil.formatDigitPattern('text1234', 3, ' ',
        end: true, repeat: false));
    _print(StringUtil.formatSpace4('text1234'));
    _print(StringUtil.formatMoney(123456789.123456));
    _print(StringUtil.formatMoneyByInt(123456789));
    _print(StringUtil.hideNumber('16657135766',
        start: 3, end: 7, replacement: '*'));
    _print(StringUtil.reverse('abcde'));
  });
}

_print(Object? object) {
  print(object);
}
