import 'package:fairy_flutter_utils/src/enum/money_format.dart';
import 'package:fairy_flutter_utils/src/enum/money_unit.dart';
import 'package:fairy_flutter_utils/src/num_util.dart';

///货币工具类
///
///another Fairy

class MoneyUtil {
  static const String YUAN = '¥';
  static const String YUAN_ZH = '元';
  static const String DOLLAR = '\$';

  MoneyUtil._();

  /// 分转元
  ///
  /// [fen]具体值
  ///
  /// [format]输出格式
  ///
  /// [unit]添加单位
  static String fenToYuan(
    int? fen, {
    MoneyFormat format = MoneyFormat.NORMAL,
    MoneyUnit unit = MoneyUnit.NORMAL,
  }) {
    String moneyStr;
    double yuan = NumUtil.divide(fen, 100);
    switch (format) {
      case MoneyFormat.NORMAL:
        moneyStr = yuan.toStringAsFixed(2);
        break;
      case MoneyFormat.END_INTEGER:
        if (fen == null) {
          fen = 0;
        }
        if (fen % 100 == 0) {
          moneyStr = yuan.toInt().toString();
        } else if (fen % 10 == 0) {
          moneyStr = yuan.toStringAsFixed(1);
        } else {
          moneyStr = yuan.toStringAsFixed(2);
        }
        break;
    }
    return _withUnit(moneyStr, unit);
  }

  /// 分转元
  ///
  /// [fenStr]具体值
  ///
  /// [format]输出格式
  ///
  /// [unit]添加单位
  static String fenToYuanByStr(
    String fenStr, {
    MoneyFormat format = MoneyFormat.NORMAL,
    MoneyUnit unit = MoneyUnit.NORMAL,
  }) {
    int amount = int.parse(fenStr);
    return fenToYuan(amount, format: format, unit: unit);
  }

  /// 元转分
  ///
  /// [yuan]
  static int yuanToFen(double yuan) {
    return yuanToFenByStr(yuan.toString());
  }

  /// 元转分
  ///
  /// [yuan]
  static int yuanToFenByStr(String yuanStr) {
    return NumUtil.multiplyDecStr(yuanStr, '100').toInt();
  }

  /// 元拼接单位
  ///
  /// [yuan]
  ///
  /// [format]
  ///
  /// [unit]
  static String yuanWithUnit(
    double yuan, {
    MoneyFormat? format,
    MoneyUnit unit = MoneyUnit.NORMAL,
  }) {
    if (format == null) {
      return _withUnit(yuan.toString(), unit);
    } else {
      int fen = yuanToFen(yuan);
      return fenToYuan(fen, format: format, unit: unit);
    }
  }

  /// 元拼接单位
  ///
  /// [yuan]
  ///
  /// [format]
  ///
  /// [unit] 自定义单位
  ///
  /// [prefix]单位是否添加到前面,默认前面
  static String yuanWithSelfUnit(
    double yuan,
    String unit, {
    MoneyFormat? format,
    bool prefix = true,
  }) {
    if (format == null) {
      if (prefix) {
        return '$unit${yuan.toString()}';
      } else {
        return '${yuan.toString()}$yuan';
      }
    } else {
      int fen = yuanToFen(yuan);
      if (prefix) {
        return '$unit${fenToYuan(fen, format: format, unit: MoneyUnit.NORMAL)}';
      } else {
        return '${fenToYuan(fen, format: format, unit: MoneyUnit.NORMAL)}$unit';
      }
    }
  }

  /// 拼接单位.
  static String _withUnit(String moneyStr, MoneyUnit unit) {
    switch (unit) {
      case MoneyUnit.YUAN:
        moneyStr = YUAN + moneyStr;
        break;
      case MoneyUnit.YUAN_ZH:
        moneyStr = moneyStr + YUAN_ZH;
        break;
      case MoneyUnit.DOLLAR:
        moneyStr = DOLLAR + moneyStr;
        break;
      default:
        break;
    }
    return moneyStr;
  }
}
