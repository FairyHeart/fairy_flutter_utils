import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
}

void testNum() {
  test('MoneyUtil', () {
    _print(RegexUtil.isMobileSimple('16657135763'));
    _print(RegexUtil.isTel('07377443431'));
    _print(RegexUtil.isEmail('425529516@126.com'));
    _print(RegexUtil.isURL('http://www.baidu.com'));
    _print(RegexUtil.isZh('http://www.baidu.com独立'));
    _print(RegexUtil.isDate('2021-01-12'));
    _print(RegexUtil.isIP('192.168.0.0'));
    _print(RegexUtil.isPassword('httpwwwba36',regex: RegexUtil.regexPwd));
  });
}

_print(Object? object) {
  print(object);
}
