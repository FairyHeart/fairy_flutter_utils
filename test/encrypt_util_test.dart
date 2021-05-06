import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
}

void testNum() {
  test('EncryptUtil', () {
    _print(EncryptUtil.encodeMd5('123456'));
  });
}

_print(Object? object) {
  print(object);
}
