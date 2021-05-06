import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TimerUtil', () {
    var timer = TimerUtil(callback: (timer) {
      _print(timer.toString());
    });
    timer.startTimer();
  });
}

_print(Object? object) {
  print(object);
}
