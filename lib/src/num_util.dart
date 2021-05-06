import 'package:decimal/decimal.dart';

///数字工具类
///
///another Fairy
///
/// ```yaml
/// # https://github.com/dart-lang/convert
/// decimal: ">=1.0.0 <3.0.0"
/// ```

class NumUtil {

  NumUtil._();

  ///将字符串转换为数字，转换出错抛出异常
  ///
  /// [valueStr] 转换的字符串
  ///
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  ///
  /// Examples:
  /// ```dart
  /// NumUtil.parse('0', fractionDigits: 3);  //0.0
  /// NumUtil.parse(null, fractionDigits: 3); //123456789012345.0
  /// NumUtil.parse('4321.12345678', fractionDigits: 3);  //4321.123
  /// NumUtil.parse('4321.12345678', fractionDigits: 5);  //4321.12346
  /// NumUtil.parse('5.25', fractionDigits: 0));  //5
  /// ```
  static num parse(String? valueStr, {int fractionDigits = 0}) {
    if (valueStr == null || valueStr.isEmpty)
      return fractionDigits == 0
          ? 0
          : double.parse(0.toStringAsFixed(fractionDigits));
    double value = double.parse(valueStr);
    return format(value, fractionDigits: fractionDigits);
  }

  ///将字符串转换为数字，转换出错不抛出异常
  ///
  /// [numStr] 转换的字符串
  ///
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  static num tryParse(String? numStr, {int fractionDigits = 0}) {
    if (numStr == null || numStr.isEmpty)
      return fractionDigits == 0
          ? 0
          : double.parse(0.toStringAsFixed(fractionDigits));
    double? value = double.tryParse(numStr);
    return value == null
        ? double.parse(0.toStringAsFixed(fractionDigits))
        : format(value, fractionDigits: fractionDigits);
  }

  ///获取int值
  ///
  /// [defValue] 默认值
  static int parseInt(String? valueStr, {int? defValue}) {
    if (valueStr == null || valueStr.isEmpty)
      return defValue == null ? 0 : defValue;
    var newValue = int.tryParse(valueStr);
    if (newValue == null) {
      return defValue == null ? 0 : defValue;
    }
    return newValue;
  }

  ///获取int值
  ///
  /// [defValue] 默认值
  static double parseDouble(String? valueStr, {double? defValue}) {
    if (valueStr == null || valueStr.isEmpty)
      return defValue == null ? 0.0 : defValue;
    var newValue = double.tryParse(valueStr);
    if (newValue == null) {
      return defValue == null ? 0.0 : defValue;
    }
    return newValue;
  }

  ///将数字按格式输出
  ///
  /// [value]数值
  ///
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  ///
  /// Examples:
  /// ```dart
  /// NumUtil.formatStr(0, fractionDigits: 3);  //0.000
  /// NumUtil.formatStr(4321.12345678, fractionDigits: 3);  //4321.123
  /// NumUtil.formatStr(4321.12345678, fractionDigits: 5);  //4321.12346
  /// NumUtil.formatStr(123456789012345, fractionDigits: 3);  //123456789012345.000
  /// NumUtil.formatStr(5.25, fractionDigits: 0); //5
  /// ```
  static String formatStr(double? value, {int fractionDigits = 0}) {
    if (value == null)
      return fractionDigits == 0 ? '0' : 0.toStringAsFixed(fractionDigits);
    return value.toStringAsFixed(fractionDigits);
  }

  ///将数字按格式输出
  ///
  /// [value]数值
  ///
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  ///
  /// Examples:
  /// ```dart
  /// NumUtil.formatStr(0, fractionDigits: 3);  //0.0
  /// NumUtil.formatStr(4321.12345678, fractionDigits: 3);  //4321.123
  /// NumUtil.formatStr(4321.12345678, fractionDigits: 5);  //4321.12346
  /// NumUtil.formatStr(123456789012345, fractionDigits: 3);  //123456789012345.0
  /// NumUtil.formatStr(5.25, fractionDigits: 0); //5
  /// ```
  static num format(double? value, {int fractionDigits = 0}) {
    String valueStr = formatStr(value, fractionDigits: fractionDigits);
    return fractionDigits == 0 ? int.parse(valueStr) : double.parse(valueStr);
  }

  ///是否为0
  static bool isZero(num? value) {
    return value == null || value == 0;
  }

  /// 加 (精确相加,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static double add(num? a, num? b) {
    return addDec(a, b).toDouble();
  }

  /// 减 (精确相减,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static double subtract(num? a, num? b) {
    return subtractDec(a, b).toDouble();
  }

  /// 乘 (精确相乘,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static double multiply(num? a, num? b) {
    return multiplyDec(a, b).toDouble();
  }

  /// 除 (精确相除,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]
  static double divide(num? a, num b) {
    return divideDec(a, b).toDouble();
  }

  /// 加 (精确相加,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static Decimal addDec(num? a, num? b) {
    return addDecStr(a.toString(), b.toString());
  }

  /// 减 (精确相减,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static Decimal subtractDec(num? a, num? b) {
    return subtractDecStr(a.toString(), b.toString());
  }

  /// 乘 (精确相乘,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]如果值为null默认当作0处理
  static Decimal multiplyDec(num? a, num? b) {
    return multiplyDecStr(a.toString(), b.toString());
  }

  /// 除 (精确相除,防止精度丢失).
  ///
  /// [a]如果值为null默认当作0处理
  ///
  /// [b]
  static Decimal divideDec(num? a, num b) {
    return divideDecStr(a.toString(), b.toString());
  }

  /// 加
  static Decimal addDecStr(String? a, String? b) {
    if (a == null || a.isEmpty || a == 'null') {
      a = '0';
    }
    if (b == null || b.isEmpty || b == 'null') {
      b = '0';
    }
    return Decimal.parse(a) + Decimal.parse(b);
  }

  /// 减
  static Decimal subtractDecStr(String? a, String? b) {
    if (a == null || a.isEmpty || a == 'null') {
      a = '0';
    }
    if (b == null || b.isEmpty || b == 'null') {
      b = '0';
    }
    return Decimal.parse(a) - Decimal.parse(b);
  }

  /// 乘
  static Decimal multiplyDecStr(String? a, String? b) {
    if (a == null || a.isEmpty || a == 'null') {
      a = '0';
    }
    if (b == null || b.isEmpty || b == 'null') {
      b = '0';
    }
    return Decimal.parse(a) * Decimal.parse(b);
  }

  /// 除
  static Decimal divideDecStr(String? a, String b) {
    if (a == null || a.isEmpty || a == 'null') {
      a = '0';
    }
    return Decimal.parse(a) / Decimal.parse(b);
  }

  /// 余数
  static Decimal remainder(num a, num b) {
    return remainderDecStr(a.toString(), b.toString());
  }

  /// [a]是否小于[b]
  static bool lessThan(num a, num b) {
    return lessThanDecStr(a.toString(), b.toString());
  }

  /// [a]是否小于或者等于[b]
  static bool lessThanOrEqual(num a, num b) {
    return lessThanOrEqualDecStr(a.toString(), b.toString());
  }

  /// [a]是否大于[b]
  static bool greaterThan(num a, num b) {
    return greaterThanDecStr(a.toString(), b.toString());
  }

  /// [a]是否大于或者等于[b]
  static bool greaterOrEqual(num a, num b) {
    return greaterOrEqualDecStr(a.toString(), b.toString());
  }

  /// 余数
  static Decimal remainderDecStr(String a, String b) {
    return Decimal.parse(a) % Decimal.parse(b);
  }

  /// [a]是否小于[b]
  static bool lessThanDecStr(String a, String b) {
    return Decimal.parse(a) < Decimal.parse(b);
  }

  /// [a]是否小于或者等于[b]
  static bool lessThanOrEqualDecStr(String a, String b) {
    return Decimal.parse(a) <= Decimal.parse(b);
  }

  /// [a]是否大于[b]
  static bool greaterThanDecStr(String a, String b) {
    return Decimal.parse(a) > Decimal.parse(b);
  }

  /// [a]是否大于或者等于[b]
  static bool greaterOrEqualDecStr(String a, String b) {
    return Decimal.parse(a) >= Decimal.parse(b);
  }
}
