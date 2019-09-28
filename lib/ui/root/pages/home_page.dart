import 'package:app/constants/app_theme.dart';
import 'package:app/services/home_service.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/overwrite/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 轮播图下方导航（即"小白点"）
/// 之所以单独抽出一个类，是因为"小白点"大小的变化需要做成是过渡（动画实现），但是这里没有做，后面再做
class _MySwiperPaginationBuilder extends SwiperPlugin {
  final Key key;
  const _MySwiperPaginationBuilder({this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(
        Container(
          margin: EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Container(
              color:
                  active ? AppColors.white : AppColors.white.withOpacity(0.8),
              width: active ? 20.0 : 8.0,
              height: 8.0,
            ),
          ),
        ),
      );
    }

    return new Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}


/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=a899c5f1-5d74-4952-8f30-c66706ef720b&project_id=a899c5f1-5d74-4952-8f30-c66706ef720b&image_id=5bf31d8c-5853-4434-9dc1-36c10cc989bd
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeService _service = HomeService();

  List _images = [
    'http://images.9daye.com.cn/upload/prod/e3dced5e-a1cc-45dc-a9fa-e8a30eb1f230.jpeg',
    'http://images.9daye.com.cn/upload/prod/bff0e988-9ceb-4362-ac93-53b9846cc7a2.jpeg',
  ];

  @override
  void initState(){
    super.initState();
    _getData();   /// 在初始化时发送请求
  }

  void _getData() async {
    /// 调用对应的service里的方法，发送请求获取信息
    var result = await _service.getHomePage(1);
    print('-------------请求成功----------------');
    print(result.title);      // 输出响应信息
    print('------------------------------------');
  }

  @override
  Widget build(BuildContext context) {

    /// 因为Flutter中View树的构造方式导致了会形成"嵌套地狱"，故需要将多个结构拆分出来，如下：
    
    /// 头部输入框
    final _searchInputBar = SliverPersistentHeader(
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
    );

    /// 修改statusbar（状态栏）样式
    /// StatusbarStyle有两种模式
    ///   light:黑底白字
    ///   dark:白底黑字
    SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,   // 不要给statusBarColor设置Colors里面没有的颜色，会有bug
    );

    /// build方法中需要return一个Widget
    /// 这里在主体view结构的外面再套了一层AnnotatedRegion，用以修改statusbar的样式
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,

      /// 安全距离，关于"安全距离"是什么，请自行查阅"全面屏的安全距离"
      child: SafeArea(
        top: false,   // 不保留上方的安全距离，因为打算把首页上面的空间（包括搜索栏和statusbar）做在一起

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

              /// 可滚动组件有几种：
              /// SingleChildScrollView，简单的滚动组件
              /// ListView，用于样式统一的长列表
              /// GridView，表格列表
              /// CustomScrollView，用于实现定制化效果，可以实现前三个能实现的效果，甚至可以包含前三个，将多个可滚动组件"粘"起来
              child: CustomScrollView(

                /// slivers接受多个RenderObjectWidget（RenderObjectWidget继承了Widget）
                /// 内置有以下几种：SliverAppBar、SliverToBoxAdapter、SliverPadding等等
                /// 详情看这里：https://www.jianshu.com/p/ca79eb54a356
                slivers: <Widget>[
                  _searchInputBar,
                  SliverToBoxAdapter(

                    /// 等比例结构
                    child: AspectRatio(
                      aspectRatio: 700 / 445, // 宽高比

                      /// Stack和Positioned用于构造层叠布局
                      /// Stack的children中最大的一个
                      child: Stack(
                        // alignment: AlignmentDirectional.topStart,  // 对齐方式为"左上"，默认值就是topStart
                        children: <Widget>[
                          Positioned(
                            /// 因为Stack的对齐方式为"左上"，"left:0,top:0,"可以省略
                            // left: 0,
                            // top: 0,
                            child: Container(
                              width: double.infinity,
                              height: ScreenAdapter.height(150.0),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    const Color(0xFFFF080B),
                                    const Color(0xFFFF2F3C),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          /// 后面的child"盖"在前面的child的"上面"
                          /// 分页组件
                          Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(
                                  ScreenAdapter.width(12.0),
                                ),

                                /// 裁剪组件
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),

                                  /// Image是一个Widget（组件）
                                  child: Image(
                                    fit: BoxFit.cover,  // 图片适应方式，BoxFit是个枚举（enum），自己看
                                    width: double.infinity,
                                    height: double.infinity,

                                    /// image参数接收一个图片"供应器"（ImageProvider）
                                    /// 图片有几种
                                    ///   NetworkImage，网络图片
                                    ///   AssetImage，资源图片（项目assets里面的图片）
                                    ///   FileImage，文件图片（手机存储空间里的图片）
                                    ///   MemoryImage，缓存（内存）图片
                                    image: new NetworkImage(
                                      _images[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: _images.length,
                            pagination: new SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(
                                bottom: ScreenAdapter.height(20.0),
                              ),
                              builder: _MySwiperPaginationBuilder(),
                            ),
                            scrollDirection: Axis.horizontal,
                            autoplay: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 5000,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
