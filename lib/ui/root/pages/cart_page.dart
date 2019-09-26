import 'package:app/constants/app_theme.dart';
import 'package:app/routes.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/layout/column_flex_layout_widget.dart';
import 'package:app/widgets/overwrite/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=06c6a273-a204-4a82-b1fd-694cb17eb3b2&project_id=06c6a273-a204-4a82-b1fd-694cb17eb3b2&image_id=5c6e1670-e6ae-4f26-a101-585f0791a8df
class CartPage extends StatefulWidget {
  CartPage({Key key}) : super();
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('购物车'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: ScreenAdapter.width(12.0),
            ),
            child: GestureDetector(
              child: Text(
                '完成',
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(14.0),
                  color: AppColors.grey43,
                ),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      body: _isLogin
          ? ColumnFlexLayout(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('我已经登录成功')
                  ],
                ),
              ),
            )
          : Center(
              child: MaterialButton(
                color: AppColors.primaryRed,
                child: Text(
                  '登录',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                onPressed: () {
                  
                  /// 将context（上下文）跳转到对应路由
                  /// 页面跳转有几种方法
                  ///   pushAndRemoveUntil、pushNamed、pushNamedAndRemoveUntil、pushReplacement、pushReplacementNamed
                  /// 这里不一一做解释
                  /// 
                  /// 页面跳转有以下几种情形
                  ///   1.单纯跳转到下一个页面（销毁或不销毁当前页面）
                  ///   2.跳转并带参数
                  ///   3.跳转并接收下一个页面返回的参数
                  /// 这里展示第3种情况
                  Navigator.of(context).pushNamed(Routes.login)
                    .then((result) {
                      /// then 里面的callback会接收下一个页面pop（返回）的信息
                      setState(() {
                        _isLogin = result ?? false;
                      });
                    });
                },
              ),
            ),
    );
  }
}
