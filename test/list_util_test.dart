import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testNum();
}

void testNum() {
  test('ListUtil', () {
    var listA = ['b', 'a'];
    var listB = ['a', 'b'];
    _print(ListUtil.equalList(listA, listB));
  });
}

_print(Object? object) {
  print(object);
}
