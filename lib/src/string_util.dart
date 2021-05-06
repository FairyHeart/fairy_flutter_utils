///字符串工具类
///
///another Fairy

class StringUtil {
  ///是否为空
  ///
  /// [emptyValue] true表示空值也是空，false表示空值不认为是空
  ///
  /// Examples:
  /// ```dart
  ///     isEmpty(null);   //true
  ///     isEmpty('');     //true
  ///     isEmpty('   ');  //false
  ///     isEmpty('   ',emptyValue = true);  //true
  ///     isEmpty('null'); //false
  /// ```
  static bool isEmpty(
    String? str, {
    bool emptyValue = false,
  }) {
    if (emptyValue) {
      str = str?.trim();
    }
    return str == null || str.isEmpty;
  }

  ///是否不为空
  ///
  /// [emptyValue] true表示空值也是空，false表示空值不认为是空
  static bool isNotEmpty(
    String? str, {
    bool emptyValue = false,
  }) {
    return isEmpty(str, emptyValue: emptyValue);
  }

  /// 每隔[digit]位加[pattern]
  ///
  /// [end] true表示从尾开始
  /// [repeat] 是否重复
  static String formatDigitPattern(
    String str,
    int digit,
    String pattern, {
    bool end = false,
    bool repeat = true,
  }) {
    if (repeat) {
      if (end) {
        String temp = reverse(str);
        temp = formatDigitPattern(temp, digit, pattern, repeat: repeat);
        temp = reverse(temp);
        return temp;
      } else {
        str = str.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
          return '${match.group(0)}$pattern';
        });
        if (pattern.isNotEmpty && str.endsWith(pattern)) {
          str = str.substring(0, str.length - 1);
        }
        return str;
      }
    } else {
      if (str.length < digit) {
        return str;
      }
      if (end) {
        var before = str.substring(0, str.length - digit);
        var after = str.substring(str.length - digit, str.length);
        return '$before$pattern$after';
      } else {
        var before = str.substring(0, digit);
        var after = str.substring(digit, str.length);
        return '$before$pattern$after';
      }
    }
  }

  /// 每隔4位加空格
  ///
  /// [end] true表示从尾开始
  static String formatSpace4(
    String str, {
    bool end = false,
  }) {
    return formatDigitPattern(str, 4, ' ', end: end);
  }

  /// 每隔3三位加逗号
  ///
  /// [num] 数字
  static String formatMoneyByInt(
    int num, {
    int digit = 3,
    String pattern = ',',
  }) {
    return formatDigitPattern(num.toString(), digit, pattern, end: true);
  }

  /// 每隔3三位加逗号
  ///
  /// [num] 数字
  static String formatMoney(
    double num, {
    int digit = 3,
    String pattern = ',',
  }) {
    List<String> list = num.toString().split('.');
    String left = formatDigitPattern(list[0], digit, pattern, end: true);
    String right = list[1];
    return '$left.$right';
  }

  /// 使用[replacement]隐藏第[start]到[end]的位数
  static String hideNumber(
    String str, {
    int start = 0,
    int? end,
    String replacement = '*',
  }) {
    var buffer = StringBuffer();
    if (str.length <= 1) {
      return str.replaceRange(0, str.length, replacement);
    }
    if (end == null) {
      end = (str.length / 2).round();
    } else {
      if (end > str.length) {
        end = str.length;
      }
    }
    for (var i = 0; i < str.length; i++) {
      if (i >= end) {
        buffer.write(String.fromCharCode(str.runes.elementAt(i)));
        continue;
      }
      if (i >= start) {
        buffer.write(replacement);
        continue;
      }
      buffer.write(String.fromCharCode(str.runes.elementAt(i)));
    }
    return buffer.toString();
  }

  /// 字符串反转
  static String reverse(String str) {
    if (str.isEmpty) return '';
    // StringBuffer sb = StringBuffer();
    // for (int i = str.length - 1; i >= 0; i--) {
    //   sb.writeCharCode(str.codeUnitAt(i));
    // }
    // return sb.toString();
    return String.fromCharCodes(str.runes.toList().reversed);
  }

  ///是否相等，忽略大小写
  static bool equalsIgnoreCase(String? strA, String? strB) {
    return strA?.toLowerCase() == strB?.toLowerCase();
  }
}
