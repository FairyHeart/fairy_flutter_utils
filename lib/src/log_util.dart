import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter/material.dart';

///日志工具类
///
///another Fairy
class XLog {
  XLog._();

  ///是否是debug模式
  static bool _debugMode = debug;

  static String? _tag;

  ///初始化
  ///[isDebug] 是否为debug模式，默认自动获取
  ///[tag] 日志tag
  static void init(
    bool isDebug, {
    String? tag,
  }) {
    _debugMode = isDebug;
    _tag = tag;
  }

  static void print(
    Object? message, {
    String? tag,
  }) {
    if (_debugMode) {
      if (StringUtil.isEmpty(tag)) {
        tag = _tag;
      }
      if (StringUtil.isEmpty(tag)) {
        debugPrint('${message?.toString()}');
      } else {
        debugPrint('$tag | ${message?.toString()}');
      }
    }
  }
}
