import 'dart:ui' as ui show window;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///屏幕工具类
///
///another Fairy
class ScreenUtil {
  ScreenUtil._();

  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _screenDensity = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomBarHeight = 0.0;
  static double _appBarHeight = 0.0;
  static late Orientation _orientation;
  static bool init = false;

  /// 当前MediaQueryData
  static MediaQueryData getMediaQuery() {
    return MediaQueryData.fromWindow(ui.window);
  }

  static void _init() {
    if (!init) {
      MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _screenDensity = mediaQuery.devicePixelRatio;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = mediaQuery.padding.bottom;
      _appBarHeight = kToolbarHeight;
      _orientation = mediaQuery.orientation;
      init = true;
    }
  }

  ///获取屏幕的宽度
  static double getScreenWidth() {
    _init();
    return _screenWidth;
  }

  ///获取屏幕的高度
  static double getScreenHeight() {
    _init();
    return _screenHeight;
  }

  /// 当前屏幕 像素密度
  static double getScreenDensity() {
    _init();
    return _screenDensity;
  }

  ///获取app bar高度
  static double getAppBarHeight() {
    _init();
    return _appBarHeight;
  }

  /// 当前状态栏高度
  static double getStatusBarHeight() {
    _init();
    return _statusBarHeight;
  }

  /// 当前BottomBar高度
  static double getBottomBarHeight() {
    _init();
    return _bottomBarHeight;
  }

  /// 设备方向(portrait, landscape)
  static Orientation getOrientation() {
    _init();
    return _orientation;
  }

  /// 是否竖屏
  static bool isPortrait() {
    _init();
    return Orientation.portrait == _orientation;
  }

  /// 是否横屏
  static bool isLandscape() {
    _init();
    return Orientation.landscape == _orientation;
  }

  /// 设置竖屏
  static void setPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  /// 设置横屏
  static void setLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}
