import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
  testNumOp();
}

void testNum() {
  test('NumUtil', () {
    _print(NumUtil.parse('0', fractionDigits: 3)); //0.0
    _print(NumUtil.parse(null, fractionDigits: 3)); //123456789012345.0
    _print(NumUtil.parse('4321.12345678', fractionDigits: 3)); //4321.123
    _print(NumUtil.parse('4321.12345678', fractionDigits: 5)); //4321.12346
    _print(NumUtil.parse('5.19', fractionDigits: 1).toInt()); //5

    _print('\n');
    _print(NumUtil.formatStr(0, fractionDigits: 3)); //0.000
    _print(NumUtil.formatStr(4321.12345678, fractionDigits: 3)); //4321.123
    _print(NumUtil.formatStr(4321.12345678, fractionDigits: 5)); //4321.12346
    _print(NumUtil.formatStr(123456789012345,
        fractionDigits: 3)); //123456789012345.000
    _print(NumUtil.formatStr(5.25, fractionDigits: 0)); //5

    _print('\n');
    _print(NumUtil.format(0, fractionDigits: 3)); //0.0
    _print(NumUtil.format(4321.12345678, fractionDigits: 3)); //4321.123
    _print(NumUtil.format(4321.12345678, fractionDigits: 5)); //4321.12346
    _print(
        NumUtil.format(123456789012345, fractionDigits: 3)); //123456789012345.0
    _print(NumUtil.format(5.25, fractionDigits: 0)); //5
  });
}

void testNumOp() {
  test('NumUtilOp', () {
    _print(NumUtil.add(null, null));
    _print(NumUtil.add(1, null));
    _print(NumUtil.add(null, 1));
    _print(NumUtil.add(1, 1));
    _print(NumUtil.addDecStr('', ''));

    // _print('10%3=${NumUtil.remainder(10, 3).toDouble()}');
    _print('5<=5 ${NumUtil.lessThanOrEqual(5, 5)}');
  });
}

_print(Object? object) {
  print(object);
}
