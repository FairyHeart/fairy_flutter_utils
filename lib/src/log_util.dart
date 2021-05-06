import 'package:fairy_flutter_utils/fairy_flutter_utils.dart';
import 'package:flutter/material.dart';

class XLog {
  XLog._();

  ///是否是debug模式
  static bool _debugMode = false;

  static String? _tag;

  ///初始化
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
