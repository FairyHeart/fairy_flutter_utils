import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarUtil {
  StatusBarUtil._();

  ///设置状态栏颜色
  ///[statusBarColor] 默认去掉半透明背景颜色
  static void setStatusBarColor(
    BuildContext context, {
    Color statusBarColor = Colors.transparent,
  }) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      SystemUiOverlayStyle _style =
          SystemUiOverlayStyle(statusBarColor: statusBarColor);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
  }
}
