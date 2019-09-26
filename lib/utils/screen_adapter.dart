import 'dart:ui';
import 'package:flutter/widgets.dart';


/// 屏幕适配
class ScreenAdapter{
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static EdgeInsets get padding => mediaQuery.padding;    // 获取安全距离

  /// 宽度
  static double width([double width]){
    if(width == null){
      return mediaQuery.size.width;
    }
    return width / 375.0 * mediaQuery.size.width;
  }

  /// 高度
  static double height(double height){
    return height / 375.0 * mediaQuery.size.width;
  }

  /// 字体大小
  static double fontSize(double fontSize){
    return (fontSize / 375.0 * mediaQuery.size.width).floorToDouble();
  }

  /// 边框宽度
  /// 括号代表该参数可不传
  static double borderWidth([double borderWidth]){
    return ( borderWidth ?? 1.0 ) / mediaQuery.devicePixelRatio;
  }
}