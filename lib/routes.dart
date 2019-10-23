import 'package:app/models/entity/activity.dart';
import 'package:app/models/entity/feature.dart';
import 'package:app/ui/login/login.dart';
import 'package:app/ui/root/root.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Routes._();

  static const String root = '/';
  static const String login = '/login';

  /// 若路由要接受参数，请接受arguments
  /// 这里先不讨论路由参数传递的问题
  static final routes = <String, WidgetBuilder>{
    root: (BuildContext context) => RootScreen(),
    login: (BuildContext context) => LoginScreen(),
  };

  /// 根据相应参数获取跳转目标活动页面
  static jumpToActivity(BuildContext context,FeatureBlockItemLinkType linkType, String linkContent,
      [ActivityType activityType]) {
    if (linkType == null || linkContent == null) {
      return;
    }
    /// TODO 跳转活动页
    // var routeName;
    // Map params={};
    // switch(linkType){
    //   case FeatureBlockItemLinkType.ARTICLE:
    //     routeName = ;
        
    // }
  }
}
