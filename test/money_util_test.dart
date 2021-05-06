import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
}

void testNum() {
  test('MoneyUtil', () {
    var fen = 120;
    _print(MoneyUtil.fenToYuan(fen));
    _print(MoneyUtil.fenToYuan(fen,format: MoneyFormat.NORMAL,unit: MoneyUnit.YUAN));
    _print(MoneyUtil.fenToYuan(fen,format: MoneyFormat.END_INTEGER,unit: MoneyUnit.DOLLAR));
    _print(MoneyUtil.yuanToFen(12));
    _print(MoneyUtil.yuanWithUnit(12,format:MoneyFormat.NORMAL,unit: MoneyUnit.YUAN_ZH));
    _print(MoneyUtil.yuanWithSelfUnit(12,"NBK"));
    _print(MoneyUtil.yuanWithSelfUnit(12,"NBK",prefix: false,format: MoneyFormat.END_INTEGER));
  });
}

_print(Object? object) {
  print(object);
}
