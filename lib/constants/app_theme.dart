import 'package:flutter/material.dart';


/// 主体
final ThemeData themeData = new ThemeData(
  /// 页面切换效果，统一使用IOS风格的“左右切换”效果
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    },
  ),

  scaffoldBackgroundColor: AppColors.greyF4, // Scaffold背景色
  primaryColor: AppColors.primaryRed, // 主要色
  primarySwatch: Colors.red, // 主题色

  /// 可滚动区域边界的波浪颜色、checkbox默认颜色
  accentColor: AppColors.primaryRed,

  /// 导航器颜色
  indicatorColor: AppColors.primaryRed,

  tabBarTheme: TabBarTheme(
    labelColor: AppColors.primaryRed,
    unselectedLabelColor: AppColors.grey43,
    indicatorSize: TabBarIndicatorSize.label,
  ),

  /// 禁用“材质”，“波纹”效果，目前有bug暂不设置
  /// splashFactory: const NoSplashFactory(),

  /// MaterialButton 聚焦效果
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,

  /// FlatButton 聚焦效果
  buttonTheme: ButtonThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  ),

  /// AppBar主题
  appBarTheme: new AppBarTheme(
    brightness: Brightness.light,
    elevation: 0,
    color: Colors.white,
    iconTheme: IconThemeData(
      // 左上角icon样式
      size: 18.0,
      color: AppColors.black333,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        // 中间title样式
        color: AppColors.black333,
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);

/// 将需要用到的颜色设置为静态常量，重复使用
class AppColors {
  AppColors._();

  static const Color primaryRed = const Color(0xFFE94136);
  // static const Color tagRed = const Color(0xFFE94136);
  static const Color secondaryRed = const Color(0xFFFFD3D5);

  static const Color tipsBgRed = const Color(0xFFE85157);
  static const Color errorRed = const Color(0xFFE85359);

  static const Color disabledRed = const Color(0x66F95259);

  static const Color white = const Color(0xFFFFFFFF);

  static const Color pink = const Color(0xFFFFC5B8);

  static const Color grey = const Color(0xFF626775);

  static const Color greyF4 = const Color(0xFFF4F4F4);
  static const Color greyF3 = const Color(0xFFF3F3F3);
  static const Color greyBC = const Color(0xFFBCBCBC);
  static const Color greyD8 = const Color(0xFFD8D8D8);
  static const Color greyA9 = const Color(0xFFA9A9A9);
  static const Color grey86 = const Color(0xFF868686);
  static const Color grey81 = const Color(0xFF818181);
  static const Color grey64 = const Color(0xFF646464);
  static const Color grey43 = const Color(0xFF434343);
  static const Color grey36 = const Color(0xFF363636);
  static const Color grey30 = const Color(0xFF303030);
  
  

  static const Color black = const Color(0xFF000000);

  static const Color black333 = const Color(0xFF333333);
  static const Color black666 = const Color(0xFF666666);
  static const Color black999 = const Color(0xFF999999);

  // static const Map<int, Color> red = const <int, Color>{
  //   50: const Color(0xFFf2f8ef),
  //   100: const Color(0xFFdfedd8),
  //   200: const Color(0xFFc9e2be),
  //   300: const Color(0xFFb3d6a4),
  //   400: const Color(0xFFa3cd91),
  //   500: const Color(0xFF93c47d),
  //   600: const Color(0xFF8bbe75),
  //   700: const Color(0xFF80b66a),
  //   800: const Color(0xFF76af60),
  //   900: const Color(0xFF64a24d)
  // };
}
