import 'package:app/constants/app_theme.dart';
import 'package:app/constants/images.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/layout/action_box_widget.dart';
import 'package:app/widgets/layout/action_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=a899c5f1-5d74-4952-8f30-c66706ef720b&project_id=a899c5f1-5d74-4952-8f30-c66706ef720b&image_id=55ec1272-657f-4137-a7dc-c71cd9b1f5aa
class MinePage extends StatefulWidget {
  MinePage({Key key}) : super();
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final _orderTypes = [
    {'title': '待付款', 'icon': IconFonts.ziyuan},
    {'title': '待发货', 'icon': IconFonts.ziyuan1},
    {'title': '待收货', 'icon': IconFonts.ziyuan4},
    {'title': '待评价', 'icon': IconFonts.ziyuan2},
    {'title': '已取消', 'icon': IconFonts.tuihuoshouhou},
  ];

  @override
  Widget build(BuildContext context) {
    /// 红色头部，布局方式如下：
    ///  ——Container(with padding and height)—————————————————————————————————————————————
    /// |                                                                                 |
    /// |                                                                                 |
    /// |                                                                                 |
    /// |    ——Row(space between)————————————————————————————————————————————————————     |
    /// |   |  ——Row(start)————————————————————————————————                          |    |
    /// |   | |  ————————            ——Column(center)———   |                         |    |
    /// |   | | |        |  Sized   | shop name         |  |                         |    |
    /// |   | | |        |  Box     | SizedBox          |  |                     >   |    |
    /// |   | | |        |          | shop location     |  |                         |    |
    /// |   | |  ————————            ———————————————————   |                         |    |
    /// |   |  ————————————————————————————————————————————                          |    |
    /// |    ————————————————————————————————————————————————————————————————————————     |
    /// |                                                                                 |
    /// |                                                                                 |
    /// |                                                                                 |
    ///  —————————————————————————————————————————————————————————————————————————————————
    /// 再次提醒一遍：
    ///   不管是Column还是Row
    ///   main axis（主轴）默认值为start
    ///   cross axis（交叉轴）默认值为center
    /// 下面没有给值的都是打算使用默认值
    final Widget _header = Container(
      padding: EdgeInsets.only(
        top: ScreenAdapter.padding.top, // 安全距离
        left: ScreenAdapter.width(12.0),
        right: ScreenAdapter.width(12.0),
      ),
      width: double.infinity,
      height: ScreenAdapter.height(195.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          image: AssetImage(Images.mine_header),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Container(
                  width: ScreenAdapter.width(75.0),
                  height: ScreenAdapter.width(75.0),
                  padding: EdgeInsets.all(ScreenAdapter.width(5.0)),
                  color: AppColors.white.withOpacity(0.5),
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'http://images.9daye.com.cn/a/avatar/default_avatar.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenAdapter.width(18.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '雅雅自营店',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: ScreenAdapter.fontSize(20.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: ScreenAdapter.height(5.0),
                  ),
                  Text(
                    '江苏 | 苏州',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: ScreenAdapter.fontSize(14.0),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          Icon(
            IconFonts.go_forward,
            color: AppColors.white,
            size: ScreenAdapter.fontSize(13.0),
          )
        ],
      ),
    );

    SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _header,
              Transform(
                transform: Matrix4.translationValues(
                  0,
                  -ScreenAdapter.height(7.0),
                  0,
                ),

                /// 裁剪组件，功能更加强大，这里换成ClipRRect也同样能实现效果
                child: PhysicalModel(
                  color: Colors.transparent,

                  /// 裁剪圆角
                  borderRadius: BorderRadius.only(
                    /// 只有左上和右上有圆角
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                  clipBehavior: Clip.antiAlias, // 对Widget截取的行为，这里是"抗锯齿"
                  child: Column(
                    children: <Widget>[
                      ActionRow(
                        title: '我的订单',
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      /// 分割线
                      ///   水平分割线：Divider
                      ///   垂直分割线：VerticalDivider
                      Divider(
                        color: AppColors.greyD8,

                        /// borderWidth方法不传参数，构造1px边框，关于"1PX边框"相关问题自行查阅
                        height: ScreenAdapter.borderWidth(),
                      ),

                      Container(
                        height: ScreenAdapter.height(91.0),
                        alignment: Alignment.center,
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _orderTypes.map((item) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  item['icon'],
                                  size: ScreenAdapter.fontSize(26.0),
                                  color: AppColors.primaryRed,
                                ),
                                SizedBox(
                                  height: ScreenAdapter.height(6.0),
                                ),
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    color: AppColors.grey43,
                                    fontSize: ScreenAdapter.fontSize(12.0),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ActionBox(
                boxGap: EdgeInsets.only(
                  top: ScreenAdapter.height(3.0),
                ),
                children: <Widget>[
                  ActionRow(
                    title: '我的钱包',
                    tips: '0.00',
                    onPressed: () {},
                  ),
                  ActionRow(
                    title: '地址管理',
                    onPressed: () {},
                  ),
                  ActionRow(
                    title: '我的卡券',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
