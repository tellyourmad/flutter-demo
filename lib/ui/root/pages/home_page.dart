import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_dto.dart';
import 'package:app/services/home_service.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/common/feature_template/feature_template.dart';
import 'package:app/widgets/overwrite/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=a899c5f1-5d74-4952-8f30-c66706ef720b&project_id=a899c5f1-5d74-4952-8f30-c66706ef720b&image_id=5bf31d8c-5853-4434-9dc1-36c10cc989bd
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeService _service = HomeService();

  FeatureDTO _info = FeatureDTO();

  @override
  void initState() {
    super.initState();
    _getData();

    /// 在初始化时发送请求
  }

  void _getData() async {
    /// 调用对应的service里的方法，发送请求获取信息
    _info = await _service.getHomePage(1);
    setState(() {});
  }

  List<FeatureBlockDTO> get blocks{
    return _info.featureBlocks.skip(3).cast<FeatureBlockDTO>().toList();
  }

  @override
  Widget build(BuildContext context) {
    /// 修改statusbar（状态栏）样式
    /// StatusbarStyle有两种模式
    ///   light:黑底白字
    ///   dark:白底黑字
    SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor:
          Colors.transparent, // 不要给statusBarColor设置Colors里面没有的颜色，会有bug
    );

    /// build方法中需要return一个Widget
    /// 这里在主体view结构的外面再套了一层AnnotatedRegion，用以修改statusbar的样式
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,

      /// 安全距离，关于"安全距离"是什么，请自行查阅"全面屏的安全距离"
      child: SafeArea(
        top: false, // 不保留上方的安全距离，因为打算把首页上面的空间（包括搜索栏和statusbar）做在一起

        /// 常用基本布局有两种：
        ///   Column：列
        ///   Row：行
        /// 它们两个都是有：
        ///   MainAxisAlignment：主轴
        ///   CrossAxisAlignment：交叉轴
        /// 理解方式同CSS Flex
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴的默认值为start
          // crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴的默认值为center
          children: <Widget>[
            Container(
              /// 宽高都是接收一个double类型
              /// 传double.infinity（无限），代表该组件的宽度将会"尽可能的大"
              width: double.infinity,
              height: ScreenAdapter.padding.top,

              /// decoration为修饰器，接受各种继承Decoration的类的实例化对象，如：
              ///   BoxDecoration，边框、背景色、圆角、阴影、渐变色、形状
              ///   ShapeDecoration，形状（必填）、背景色、阴影、渐变色
              decoration: BoxDecoration(
                /// 背景色
                gradient: const LinearGradient(
                  colors: [
                    const Color(0xFFFF080B),
                    const Color(0xFFFF2F3C),
                  ],
                ),
              ),
            ),

            /// Flex:1，设置权重，这里为了实现"占据剩下空间"效果
            Expanded(
              flex: 1,
              child: FeatureTemplateWidget(
                type: FeatureType.HOME,
                blocks: blocks,
                inputWidget: SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverAppBarDelegate(
                    minHeight: ScreenAdapter.height(50.0),
                    maxHeight: ScreenAdapter.height(50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            const Color(0xFFFF080B),
                            const Color(0xFFFF2F3C),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.width(12.0),
                        vertical: ScreenAdapter.height(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                left: ScreenAdapter.width(14.0),
                              ),

                              decoration: ShapeDecoration(
                                /// shape接收一个ShapeBorder抽象类实例，常用的有
                                ///   RoundedRectangleBorder，顶端圆角
                                ///   BeveledRectangleBorder，顶端斜角
                                ///   StadiumBorder，体育场型
                                ///   CircleBorder，圆形
                                shape: const StadiumBorder(),

                                color: AppColors.white,
                              ),
                              height: ScreenAdapter.height(29.0),

                              /// 典型一行n个东西的布局
                              child: Row(
                                children: <Widget>[
                                  /// "放大镜"Icon
                                  Icon(
                                    // Icons.search,  // 内置的图标库有Icons

                                    /// 我这里使用了自己创建的类IconFonts（/lib/widgets/basic/iconfont_widget.dart）
                                    /// 里面有多个自己的icon，用python生成（暂时不用关注如何生成）
                                    IconFonts.search,

                                    size: ScreenAdapter.fontSize(15.0),
                                    color: AppColors.greyBC,
                                  ),

                                  /// 中间间隔请用SizedBox来实现
                                  SizedBox(
                                    width: ScreenAdapter.width(8.5),
                                  ),

                                  Text(
                                    '搜索您想要的商品',
                                    style: TextStyle(
                                      color: AppColors.greyA9,
                                      fontSize: ScreenAdapter.fontSize(14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(13.5),
                          ),
                          Icon(
                            IconFonts.message,
                            size: ScreenAdapter.fontSize(27.0),
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
