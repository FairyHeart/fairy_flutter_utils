import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  _timeUtilTest();
  _testFormat();
}

_timeUtilTest() {
  test('TimeUtils', () {
    _print(TimeUtil.nowMilliseconds);
    _print(TimeUtil.nowMicroseconds);

    _print('\n');
    _print(TimeUtil.format(TimeUtil.parseDataTime('2012-02-27')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('2012-02-27 13:27:00')));
    _print(TimeUtil.format(
        TimeUtil.parseDataTime('2012-02-27 13:27:00.123456789z')));
    _print(TimeUtil.format(
        TimeUtil.parseDataTime('2012-02-27 13:27:00,123456789z')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('20120227 13:27:00')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('20120227T132700')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('20120227')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('+20120227')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('2012-02-27T14Z')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('2012-02-27T14+00:00')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('-123450101 00:00:00 Z')));
    _print(TimeUtil.format(TimeUtil.parseDataTime('2002-02-27T14:00:00-0500')));
    // _print(TimeUtil.format(TimeUtil.parseDataTime('2021年04月23日 17时46分50秒')));

    _print(TimeUtil.getWeekDay(TimeUtil.now));
    _print(TimeUtil.isLeapYearByDateTime(TimeUtil.now));
    var dateA = TimeUtil.parseDataTime('2021-04-23 12:01:01');
    var dateB = TimeUtil.now;
    _print('isSameDay ${TimeUtil.isSameDay(dateA, dateB)}');
    _print('isSameMonth ${TimeUtil.isSameMonth(dateA, dateB)}');
    _print('isSameYear ${TimeUtil.isSameYear(dateA, dateB)}');
    _print(
        'isToday ${TimeUtil.isToday(dateA.millisecondsSinceEpoch)} ${TimeUtil.isToday(dateB.millisecondsSinceEpoch)}');
    _print('isYesterday ${TimeUtil.isYesterday(dateA, dateB)}');
    _print('getDayOfYear ${TimeUtil.getDayOfYear(dateB)}');
    _print('getDaysInMonth ${TimeUtil.getDaysInMonth(2021, 5)}');
    _print(TimeUtil.getMilliseconds(TimeUtil.nowMilliseconds));
    _print(TimeUtil.getStartDateTimeOfToDay(ofDay: 1).toString());
    _print(TimeUtil.getEndDateTimeOfToDay(ofDay: -1).toString());
    _print(TimeUtil.getStartDateTimeOfToMonth(ofMonth: -1).toString());
    _print(TimeUtil.getEndDateTimeOfToMonth(ofMonth: 1).toString());
  });
}

_testFormat() {
  test('TimeUtils.format', () {
    _print('\n');
    var time = TimeUtil.now;
    _print(TimeUtil.format(time, dateFormat: DateFormat.DEFAULT));
    _print(TimeUtil.format(time, dateFormat: DateFormat.NORMAL));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE));
    _print(TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH_DAY));
    _print(TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH));
    _print(TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY));
    _print(TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE));
    _print(TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE_SECOND));
    _print(TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE));

    _print('\n');
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_DEFAULT));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_NORMAL));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_YEAR_MONTH_DAY));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_YEAR_MONTH));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_MONTH_DAY));
    _print(
        TimeUtil.format(time, dateFormat: DateFormat.ZH_MONTH_DAY_HOUR_MINUTE));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_HOUR_MINUTE_SECOND));
    _print(TimeUtil.format(time, dateFormat: DateFormat.ZH_HOUR_MINUTE));

    _print('\n');
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.DEFAULT, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.NORMAL, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH_DAY, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.MONTH_DAY, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.HOUR_MINUTE_SECOND, dateSeparate: '/'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.HOUR_MINUTE, dateSeparate: '/'));

    _print('\n');
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_DEFAULT, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_NORMAL, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE,
        timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_YEAR_MONTH_DAY, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_YEAR_MONTH, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_MONTH_DAY, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_MONTH_DAY_HOUR_MINUTE, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_HOUR_MINUTE_SECOND, timeSeparate: ':'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.ZH_HOUR_MINUTE, timeSeparate: ':'));

    _print('\n');
    _print(
      TimeUtil.format(time,
          dateFormat: DateFormat.DEFAULT, dateSeparate: '/', timeSeparate: '|'),
    );
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.NORMAL, dateSeparate: '/', timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH_DAY,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.YEAR_MONTH,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.MONTH_DAY,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.HOUR_MINUTE_SECOND,
        dateSeparate: '/',
        timeSeparate: '|'));
    _print(TimeUtil.format(time,
        dateFormat: DateFormat.HOUR_MINUTE,
        dateSeparate: '/',
        timeSeparate: '|'));
  });
}

_print(Object? object) {
  print(object);
}
