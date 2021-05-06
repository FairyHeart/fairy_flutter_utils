import 'package:fairy_flutter_utils/src/enum/date_format.dart';
import 'package:flutter/material.dart';

///日期工具类
///
///another Fairy

class TimeUtil {
  TimeUtil._();

  ///获取当前时间-毫秒
  static int get nowMilliseconds => DateTime.now().millisecondsSinceEpoch;

  ///获取当前时间-微妙
  static int get nowMicroseconds => DateTime.now().microsecondsSinceEpoch;

  ///获取当前时间-DateTime
  static DateTime get now => DateTime.now();

  ///通过[milliseconds]毫秒获取时间DateTime对象
  static DateTime getDataTimeByMilliseconds(int milliseconds,
      {bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }

  ///通过[microseconds]微秒获取时间DateTime对象
  static DateTime getDataTimeByMicroseconds(int microseconds,
      {bool isUtc = false}) {
    return DateTime.fromMicrosecondsSinceEpoch(microseconds, isUtc: isUtc);
  }

  /// 格式化日期转时间
  ///
  /// 只支持下面几种时间类型，不支持类型返回null:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  static DateTime? tryParseDataTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return null;
    }
    var dateTime = DateTime.tryParse(dateStr);
    return dateTime;
  }

  ///格式化日期转时间戳-毫秒
  static int parseDataTimeMilliseconds(String dateStr) {
    return parseDataTime(dateStr).millisecondsSinceEpoch;
  }

  ///格式化日期转时间戳-微秒
  static int parseDataTimeMicroseconds(String dateStr) {
    return parseDataTime(dateStr).microsecondsSinceEpoch;
  }

  /// 格式化日期转时间
  ///
  /// 只支持下面几种时间类型，不支持类型抛出异常:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  static DateTime parseDataTime(String dateStr) {
    var dateTime = DateTime.parse(dateStr);
    return dateTime;
  }

  /// 时间戳(毫秒)格式化
  ///
  /// [milliseconds] 毫秒时间戳
  ///
  /// [dateFormat] 格式化类型
  ///
  /// [dateSeparate] 日期分隔符
  ///
  /// [timeSeparate] 时间分隔符
  static String formatByMilliseconds(
    int? milliseconds, {
    DateFormat dateFormat = DateFormat.NORMAL,
    String? dateSeparate,
    String? timeSeparate,
    bool isUtc = false,
  }) {
    if (milliseconds == null || milliseconds == 0) {
      return '';
    }
    var dateTime = getDataTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return format(dateTime,
        dateFormat: dateFormat,
        dateSeparate: dateSeparate,
        timeSeparate: timeSeparate);
  }

  /// 时间戳(毫秒)格式化
  ///
  /// [microseconds] 毫秒时间戳
  ///
  /// [dateFormat] 格式化类型
  ///
  /// [dateSeparate] 日期分隔符
  ///
  /// [timeSeparate] 时间分隔符
  static String formatByMicroseconds(
    int? microseconds, {
    DateFormat dateFormat = DateFormat.NORMAL,
    String? dateSeparate,
    String? timeSeparate,
    bool isUtc = false,
  }) {
    if (microseconds == null || microseconds == 0) {
      return '';
    }
    var dateTime = getDataTimeByMicroseconds(microseconds, isUtc: isUtc);
    return format(dateTime,
        dateFormat: dateFormat,
        dateSeparate: dateSeparate,
        timeSeparate: timeSeparate);
  }

  /// 日期格式化
  ///
  /// [dateTime] 毫秒时间戳
  ///
  /// [dateFormat] 格式化类型
  ///
  /// [dateSeparate] 日期分隔符
  ///
  /// [timeSeparate] 时间分隔符
  ///
  ///
  /// * `TimeUtil.format(time, dateFormat: DateFormat.DEFAULT) -> 2021-04-23 16:56:19.961`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.NORMAL) -> 2021-04-23 16:56:19`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE) -> 2021-04-23 16:56`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH_DAY) -> 2021-04-23`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH) -> 2021-04`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY) -> 04-23`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE) -> 04-23 16:56`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE_SECOND) -> 16:56:19`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE) -> 16:56`
  ///
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_DEFAULT) -> 2021年04月23日 16时56分19秒961毫秒`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_NORMAL) -> 2021年04月23日 16时56分19秒`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE) -> 2021年04月23日 16时56分`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_YEAR_MONTH_DAY) -> 2021年04月23日`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_YEAR_MONTH) -> 2021年04月`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_MONTH_DAY) -> 04月23日`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_MONTH_DAY_HOUR_MINUTE) -> 04月23日 16时56分`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_HOUR_MINUTE_SECOND) -> 16时56分19秒`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.ZH_HOUR_MINUTE) -> 16时56分`
  ///
  /// * `TimeUtil.format(time, dateFormat: DateFormat.DEFAULT, dateSeparate: '/') -> 2021/04/23 17:24:38.960387`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.NORMAL, dateSeparate: '/') -> 2021/04/23 17:24:38`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE, dateSeparate: '/') -> 2021/04/23 17:24`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH_DAY, dateSeparate: '/') -> 2021/04/23`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.YEAR_MONTH, dateSeparate: '/') -> 2021/04`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY, dateSeparate: '/') -> 04/23`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE, dateSeparate: '/') -> 04/23 17:24`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE_SECOND, dateSeparate: '/') -> 17:24:38`
  /// * `TimeUtil.format(time, dateFormat: DateFormat.HOUR_MINUTE, dateSeparate: '/') -> 17:24`
  ///
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_DEFAULT, timeSeparate: ':') -> 2021年04月23日 17:24:38.960387`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_NORMAL, timeSeparate: ':') -> 2021年04月23日 17:24:38`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE, timeSeparate: ':') -> 2021年04月23日 17:24`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_YEAR_MONTH_DAY, timeSeparate: ':') -> 2021年04月23日`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_YEAR_MONTH, timeSeparate: ':') -> 2021年04月`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_MONTH_DAY, timeSeparate: ':') -> 04月23日`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_MONTH_DAY_HOUR_MINUTE, timeSeparate: ':') -> 04月23日 17:24`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_HOUR_MINUTE_SECOND, timeSeparate: ':') -> 17:24:38`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.ZH_HOUR_MINUTE, timeSeparate: ':') -> 17:24`
  ///
  /// * `TimeUtil.format(time,dateFormat: DateFormat.DEFAULT, dateSeparate: '/', timeSeparate: '|') -> 2021/04/23 17|24|38.960387`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.NORMAL, dateSeparate: '/', timeSeparate: '|') -> 2021/04/23 17|24|38`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE, dateSeparate: '/', timeSeparate: '|') -> 2021/04/23 17|24`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.YEAR_MONTH_DAY, dateSeparate: '/', timeSeparate: '|') -> 2021/04/23`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.YEAR_MONTH, dateSeparate: '/', timeSeparate: '|') -> 2021/04`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.MONTH_DAY, dateSeparate: '/', timeSeparate: '|') -> 04/23`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.MONTH_DAY_HOUR_MINUTE, dateSeparate: '/', timeSeparate: '|') -> 04/23 17|24`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.HOUR_MINUTE_SECOND, dateSeparate: '/', timeSeparate: '|') -> 17|24|38`
  /// * `TimeUtil.format(time,dateFormat: DateFormat.HOUR_MINUTE, dateSeparate: '/', timeSeparate: '|') -> 17|24`
  ///
  static String format(
    DateTime? dateTime, {
    DateFormat dateFormat = DateFormat.NORMAL,
    String? dateSeparate,
    String? timeSeparate,
  }) {
    if (dateTime == null) {
      return '';
    }
    String dateStr = dateTime.toString();
    bool isSelfSeparate =
        dateSeparate?.isNotEmpty == true && timeSeparate?.isNotEmpty == true;
    if (isSelfSeparate) {
      return _formatSelfDateTime(
          dateStr, dateFormat, dateSeparate, timeSeparate);
    }
    if (_isZHFormat(dateFormat)) {
      dateStr = _formatZHDateTime(dateStr, dateFormat, timeSeparate);
    } else {
      dateStr =
          _formatDateTime(dateStr, dateFormat, dateSeparate, timeSeparate);
    }
    return dateStr;
  }

  ///[milliseconds]是星期几
  ///
  ///Returns 1,2,3,4,5,6,7
  static int getWeekDayByMilliseconds(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = getDataTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getWeekDay(dateTime);
  }

  ///[dateTime]是星期几
  ///
  ///Returns 1,2,3,4,5,6,7
  static int getWeekDay(DateTime dateTime) {
    return dateTime.weekday;
  }

  /// [dateTime]在今年的第几天
  static int getDayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + DateUtils.getDaysInMonth(year, i);
    }
    return days;
  }

  ///获取某月的最大天数
  static int getDaysInMonth(int year, int month) {
    return DateUtils.getDaysInMonth(year, month);
  }

  ///获取[milliseconds]中的时分秒毫秒之和
  ///
  ///Returns 总共毫秒数
  static int getMilliseconds(int milliseconds) {
    var date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    var millSecond = date.millisecond;
    var second = 1000 * date.second;
    var minute = 1000 * 60 * date.minute;
    var hour = 1000 * 60 * 60 * date.hour;
    return millSecond + second + minute + hour;
  }

  ///获取几天前[ofDay]的开始时间
  ///
  /// [ofDay]0 = 当天
  ///
  ///Returns 毫秒
  static int getStartDateTimeMillisecondsOfToDay({int ofDay = 0}) {
    return getStartDateTimeOfToDay(ofDay: ofDay).millisecondsSinceEpoch;
  }

  ///获取几天前[ofDay]的开始时间
  ///
  /// [ofDay] 0 = 当天
  ///
  ///Returns DateTime
  static DateTime getStartDateTimeOfToDay({int ofDay = 0}) {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day + ofDay, 0, 0, 0, 0, 0);
  }

  ///获取某天的结束时间
  ///
  /// [ofDay] 0 = 当天
  static int getEndDateTimeMillisecondsOfToDay({int ofDay = 0}) {
    return getEndDateTimeOfToDay(ofDay: ofDay).millisecondsSinceEpoch;
  }

  ///获取某天的结束时间
  ///
  /// [ofDay] 0 = 当天
  static DateTime getEndDateTimeOfToDay({int ofDay = 0}) {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day + ofDay, 23, 59, 59, 999, 999);
  }

  ///获取本月的开始时间
  ///
  /// [ofMonth] 0 = 当月
  static DateTime getStartDateTimeOfToMonth({int ofMonth = 0}) {
    var now = DateTime.now();
    return DateTime(now.year, now.month + ofMonth, 1, 0, 0, 0, 0, 0);
  }

  ///获取本月的结束时间
  ///
  /// [ofMonth] 0 = 当月
  static DateTime getEndDateTimeOfToMonth({int ofMonth = 0}) {
    var now = DateTime.now();
    return DateTime(now.year, now.month + ofMonth + 1, 1, 23, 59, 59, 999, 999)
        .add(Duration(days: -1));
  }

  ///获取开始营业时间
  ///
  ///[startTime] 营业开始时间（时分秒毫秒之和）
  ///
  ///[endTime] 营业结束时间（时分秒毫秒之和）
  ///
  ///[ofDay] 天数，0当天
  static int getStartBusinessTime(int startTime, int endTime, {int ofDay = 0}) {
    return _getBusinessTime(startTime, endTime, ofDay: ofDay) + startTime;
  }

  ///获取开始营业时间
  ///
  ///[startTime] 营业开始时间（时分秒毫秒之和）
  ///
  ///[endTime] 营业结束时间（时分秒毫秒之和）
  ///
  ///[ofDay] 天数，0当天
  static int getEndBusinessTime(int startTime, int endTime, {int ofDay = 0}) {
    return _getBusinessTime(startTime, endTime, ofDay: ofDay) + endTime;
  }

  ///相差多少个月
  ///
  /// [startDate] 开始时间
  ///
  /// [endDate] 结束时间
  static int monthDelta(DateTime startDate, DateTime endDate) {
    return DateUtils.monthDelta(startDate, endDate);
  }

  ///判断是否为闰年
  ///
  /// [dateTime]日期
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  ///判断是否为闰年
  ///
  /// [year]年份
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// 是否同日
  ///
  /// [dateA] 第一个日期
  ///
  /// [dateB] 第二个日期
  static bool isSameDay(DateTime? dateA, DateTime? dateB) {
    return DateUtils.isSameDay(dateA, dateB);
  }

  /// 是否同月
  ///
  /// [dateA] 第一个日期
  ///
  /// [dateB] 第二个日期
  static bool isSameMonth(DateTime? dateA, DateTime? dateB) {
    return DateUtils.isSameMonth(dateA, dateB);
  }

  /// 是否同年
  ///
  /// [dateA] 第一个日期
  ///
  /// [dateB] 第二个日期
  static bool isSameYear(DateTime? dateA, DateTime? dateB) {
    return dateA?.year == dateB?.year;
  }

  /// 是否是今天
  ///
  /// [milliseconds]日期时间戳-毫秒
  static bool isToday(int? milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// 是否是昨天
  ///
  /// [dateTime] 验证的时间
  ///
  /// [locDateTime] 校验的时间
  ///
  /// Returns bool
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (isSameYear(dateTime, locDateTime)) {
      int spDay = getDayOfYear(locDateTime) - getDayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  ///获取营业时间
  ///
  ///[startTime]开始时间戳
  ///
  ///[endTime]结束时间戳
  ///
  ///[ofDay]0当天
  ///
  ///Returns 营业开始的时间
  static int _getBusinessTime(int startTime, int endTime, {int ofDay = 0}) {
    int startT = getStartDateTimeMillisecondsOfToDay(ofDay: ofDay) + startTime;
    int endT = getStartDateTimeMillisecondsOfToDay(ofDay: ofDay) + endTime;
    if (isSameDay(
        getDataTimeByMilliseconds(startT), getDataTimeByMilliseconds(endT))) {
      return getStartDateTimeMillisecondsOfToDay(ofDay: ofDay);
    } else {
      //同一天，并且现在的时间比营业结束时间小
      int now = DateTime.now().millisecondsSinceEpoch;
      if (now <= endT &&
          isSameDay(getDataTimeByMilliseconds(now),
              getDataTimeByMilliseconds(endTime))) {
        return getStartDateTimeMillisecondsOfToDay(ofDay: -1 + ofDay);
      } else {
        return getStartDateTimeMillisecondsOfToDay(ofDay: ofDay);
      }
    }
  }

  /// 是否显示中文类型时间格式
  ///
  /// Returns DateTime
  static bool _isZHFormat(DateFormat format) {
    return format == DateFormat.ZH_DEFAULT ||
        format == DateFormat.ZH_NORMAL ||
        format == DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE ||
        format == DateFormat.ZH_YEAR_MONTH_DAY ||
        format == DateFormat.ZH_YEAR_MONTH ||
        format == DateFormat.ZH_MONTH_DAY ||
        format == DateFormat.ZH_MONTH_DAY_HOUR_MINUTE ||
        format == DateFormat.ZH_HOUR_MINUTE_SECOND ||
        format == DateFormat.ZH_HOUR_MINUTE;
  }

  /// 日期转换为中文显示格式
  static String _formatZHDateTime(
      String time, DateFormat format, String? timeSeparate) {
    time = _convertToZHDateTimeString(time, timeSeparate);
    switch (format) {
      case DateFormat.ZH_NORMAL: //yyyy年MM月dd日 HH时mm分ss秒
        time = time.substring(
            0,
            'yyyy年MM月dd日 HH时mm分ss秒'.length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy年MM月dd日 HH时mm分
        time = time.substring(
            0,
            'yyyy年MM月dd日 HH时mm分'.length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_YEAR_MONTH_DAY: //yyyy年MM月dd日
        time = time.substring(0, 'yyyy年MM月dd日'.length);
        break;
      case DateFormat.ZH_YEAR_MONTH: //yyyy年MM月
        time = time.substring(0, 'yyyy年MM月'.length);
        break;
      case DateFormat.ZH_MONTH_DAY: //MM月dd日
        time = time.substring('yyyy年'.length, 'yyyy年MM月dd日'.length);
        break;
      case DateFormat.ZH_MONTH_DAY_HOUR_MINUTE: //MM月dd日 HH时mm分
        time = time.substring(
            'yyyy年'.length,
            'yyyy年MM月dd日 HH时mm分'.length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_HOUR_MINUTE_SECOND: //HH时mm分ss秒
        time = time.substring(
            'yyyy年MM月dd日 '.length,
            'yyyy年MM月dd日 HH时mm分ss秒'.length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_HOUR_MINUTE: //HH时mm分
        time = time.substring(
            'yyyy年MM月dd日 '.length,
            'yyyy年MM月dd日 HH时mm分'.length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      default:
        break;
    }
    return time;
  }

  /// 日期转换为英文显示格式
  static String _formatDateTime(String time, DateFormat format,
      String? dateSeparate, String? timeSeparate) {
    switch (format) {
      case DateFormat.NORMAL: //yyyy-MM-dd HH:mm:ss
        time = time.substring(0, 'yyyy-MM-dd HH:mm:ss'.length);
        break;
      case DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy-MM-dd HH:mm
        time = time.substring(0, 'yyyy-MM-dd HH:mm'.length);
        break;
      case DateFormat.YEAR_MONTH_DAY: //yyyy-MM-dd
        time = time.substring(0, 'yyyy-MM-dd'.length);
        break;
      case DateFormat.YEAR_MONTH: //yyyy-MM
        time = time.substring(0, 'yyyy-MM'.length);
        break;
      case DateFormat.MONTH_DAY: //MM-dd
        time = time.substring('yyyy-'.length, 'yyyy-MM-dd'.length);
        break;
      case DateFormat.MONTH_DAY_HOUR_MINUTE: //MM-dd HH:mm
        time = time.substring('yyyy-'.length, 'yyyy-MM-dd HH:mm'.length);
        break;
      case DateFormat.HOUR_MINUTE_SECOND: //HH:mm:ss
        time =
            time.substring('yyyy-MM-dd '.length, 'yyyy-MM-dd HH:mm:ss'.length);
        break;
      case DateFormat.HOUR_MINUTE: //HH:mm
        time = time.substring('yyyy-MM-dd '.length, 'yyyy-MM-dd HH:mm'.length);
        break;
      default:
        break;
    }
    time = _dateTimeSeparate(time, dateSeparate, timeSeparate);
    return time;
  }

  /// 日期转换为自定义格式显示
  static String _formatSelfDateTime(String time, DateFormat format,
      String? dateSeparate, String? timeSeparate) {
    switch (format) {
      case DateFormat.NORMAL: //yyyy-MM-dd HH:mm:ss
      case DateFormat.ZH_NORMAL: //yyyy年MM月dd日 HH时mm分ss秒
        time = time.substring(0, 'yyyy-MM-dd HH:mm:ss'.length);
        break;
      case DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy-MM-dd HH:mm
      case DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE:
        time = time.substring(0, 'yyyy-MM-dd HH:mm'.length);
        break;
      case DateFormat.YEAR_MONTH_DAY: //yyyy-MM-dd
      case DateFormat.ZH_YEAR_MONTH_DAY:
        time = time.substring(0, 'yyyy-MM-dd'.length);
        break;
      case DateFormat.YEAR_MONTH: //yyyy-MM
      case DateFormat.ZH_YEAR_MONTH:
        time = time.substring(0, 'yyyy-MM'.length);
        break;
      case DateFormat.MONTH_DAY: //MM-dd
      case DateFormat.ZH_MONTH_DAY:
        time = time.substring('yyyy-'.length, 'yyyy-MM-dd'.length);
        break;
      case DateFormat.MONTH_DAY_HOUR_MINUTE: //MM-dd HH:mm
      case DateFormat.ZH_MONTH_DAY_HOUR_MINUTE:
        time = time.substring('yyyy-'.length, 'yyyy-MM-dd HH:mm'.length);
        break;
      case DateFormat.HOUR_MINUTE_SECOND: //HH:mm:ss
      case DateFormat.ZH_HOUR_MINUTE_SECOND:
        time =
            time.substring('yyyy-MM-dd '.length, 'yyyy-MM-dd HH:mm:ss'.length);
        break;
      case DateFormat.HOUR_MINUTE: //HH:mm
      case DateFormat.ZH_HOUR_MINUTE:
        time = time.substring('yyyy-MM-dd '.length, 'yyyy-MM-dd HH:mm'.length);
        break;
      default:
        break;
    }
    time = _dateTimeSeparate(time, dateSeparate, timeSeparate);
    return time;
  }

  static String _dateTimeSeparate(
      String time, String? dateSeparate, String? timeSeparate) {
    if (dateSeparate != null && dateSeparate.isNotEmpty) {
      time = time.replaceAll('-', dateSeparate);
    }
    if (timeSeparate != null && timeSeparate.isNotEmpty) {
      time = time.replaceAll(':', timeSeparate);
    }
    return time;
  }

  /// 转换为中文显示
  static String _convertToZHDateTimeString(String time, String? timeSeparate) {
    time = time.replaceFirst('-', '年');
    time = time.replaceFirst('-', '月');
    time = time.replaceFirst(' ', '日 ');
    if (timeSeparate == null || timeSeparate.isEmpty) {
      time = time.replaceFirst(':', '时');
      time = time.replaceFirst(':', '分');
      time = time.replaceFirst('.', '秒');
      time = time + '毫秒';
    } else {
      time = time.replaceAll(':', timeSeparate);
    }
    return time;
  }

  ///补齐两位小数
  static String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
