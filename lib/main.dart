import 'package:app/constants/app_theme.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      /// 这里可以定义主题，即组件的默认样式
      theme: themeData,

      /// 这里使用initialRoute（初始路由）和routes（路由集合）来构造路由
      initialRoute: Routes.root,
      routes: Routes.routes,

      /// 因为项目中需要用到路由守卫（解决权限问题）
      /// 所以应该去除上面两项，使用onGenerateRoute来构造路由，后面再加
    );
  }
}
