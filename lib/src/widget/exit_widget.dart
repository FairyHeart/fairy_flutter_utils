import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 再按一次退出应用组件
///
/// another Fairy
///
///[child] 子控件
///[tipFunc] 提示回调
///
/// example:
/// ```dart
///       body: ExitWidget(
///           child: pages[_currentIndex],
///           tipFunc: () {
///             FlutterToast.showToast(msg: KString.cm_exit);
///           }).build(),
/// ```dart
class ExitWidget {
  final Widget child;

  final Function? tipFunc;

  DateTime? _lastPressedAt;

  ExitWidget({
    required this.child,
    this.tipFunc,
  });

  WillPopScope build() {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
          _lastPressedAt = DateTime.now();
          tipFunc?.call();
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
    );
  }
}
