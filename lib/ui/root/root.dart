import 'package:app/constants/app_theme.dart';
import 'package:app/constants/images.dart';
import 'package:app/ui/root/pages/cart_page.dart';
import 'package:app/ui/root/pages/category_page.dart';
import 'package:app/ui/root/pages/home_page.dart';
import 'package:app/ui/root/pages/mine_page.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key key}) : super();

  @override
  _RootScreenState createState() => _RootScreenState();
}

/// State类的类名后面请添加"State"
class _RootScreenState extends State<RootScreen> {
  /// 仅供内部使用的变量、方法、类，名字前面带"_"
  int _currentIndex = 0; // 记录当前页面索引
  PageController _pageController; // 页面controller
  final List<Widget> _pages = List<Widget>(); // 页面集合

  final List<dynamic> _tabs = [
    /// 底部导航集合
    /// dynamic为动态集合，调用方式为： _tabs[0]['title']
    {
      'title': '首页',
      'image': 'home',
    },
    {
      'title': '分类',
      'image': 'category',
    },
    {
      'title': '购物车',
      'image': 'cart',
    },
    {
      'title': '我的',
      'image': 'mine',
    },
  ];

  /// State类有多个生命周期钩子函数
  /// 详情看framework.dart文件
  /// 下面这两个是常用的

  /// Called when this object is inserted into the tree.
  /// 当对象插入View树中会触发
  @override
  void initState() {
    /// 先调用父类initState方法;
    super.initState();

    /// 插入View树后再实例化controller
    _pageController = PageController();

    /// 添加页面实例到_pages上
    /// 这里"点点.."的意思，看例子:
    ///   _pages.add(HomePage());
    ///   _pages.add(CategoryPage());
    ///   _pages.add(CartPage());
    ///   _pages.add(MinePage());
    /// 上面四行执行结果等价于下面写法（链式操作）
    _pages
      ..add(HomePage())
      ..add(CategoryPage())
      ..add(CartPage())
      ..add(MinePage());
  }

  /// Called when this object is removed from the tree permanently.
  /// 当对象从View树中永久被移除时触发
  @override
  void dispose() {
    /// 在这里释放controller，页面都销毁了，还要该页面的controller来做什么
    _pageController.dispose();

    /// 做完你要做的事情再调用父类的dispose
    super.dispose();
  }

  /// 构造底部导航项，写个方法来重复调用
  BottomNavigationBarItem _buildNaviItem(int _index) {
    var _tabItem = _tabs[_index];
    return BottomNavigationBarItem(
      icon: Image.asset(
        Images.root_navigation_bar[_tabItem['image']][false],

        /// 这里height是接收一个double型，但是不直接传"22.0"，因为要做屏幕适配
        /// 自己定义的这个ScreenAdapter类上有许多方法，通过该方法对原值进行计算，得出新的值
        /// 原则上所有尺寸（宽、高、字体大小、边框宽度、边框圆角）都应该做屏幕适配
        height: ScreenAdapter.height(22.0),

        fit: BoxFit.fitHeight,
      ),
      activeIcon: Image.asset(
        Images.root_navigation_bar[_tabItem['image']][true],
        height: ScreenAdapter.height(22.0),
        fit: BoxFit.fitHeight,
      ),
      title: Padding(
        padding: EdgeInsets.only(
          top: ScreenAdapter.height(2.0),
        ),
        child: Text(
          _tabItem['title'],
          style: TextStyle(
            inherit: false,
            color: _currentIndex == _index
                ? AppColors.primaryRed
                : AppColors.grey64,
            fontSize: ScreenAdapter.fontSize(11.0),
          ),
        ),
      ),
    );
  }

  /// 渲染方法
  @override
  Widget build(BuildContext context) {
    /// Scaffold（脚手架）是一种常用的顶层Widget
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: ScreenAdapter.fontSize(11.0),
        unselectedFontSize: ScreenAdapter.fontSize(11.0),
        items: [
          _buildNaviItem(0),
          _buildNaviItem(1),
          _buildNaviItem(2),
          _buildNaviItem(3),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          /// Calling [setState] notifies the framework that the internal state of this
          /// object has changed in a way that might impact the user interface in this
          /// subtree, which causes the framework to schedule a [build] for this [State]
          /// object.
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index); // 主动控制_pageController跳转到某个页面
        },
      ),

      body: PageView.builder(
        /// 滚动材质，有多种
        ///   NeverScrollableScrollPhysics，不可滚动
        ///   AlwaysScrollableScrollPhysics，一直可滚动，不管content有没有比wrap大
        ///   ClampingScrollPhysics，带"波纹"效果，android默认滚动方式
        ///   BouncingScrollPhysics，带"回弹"效果，ios默认滚动方式
        physics: NeverScrollableScrollPhysics(),

        /// 这里禁止"左右滑"手势来切换页面，
        /// 所以下面监听onPageChanged其实是多余的
        controller: _pageController,
        onPageChanged: (int _index) {
          /// 写法一：
          /// _currentIndex = _index;
          /// setState(() {});

          /// 写法二：
          setState(() {
            _currentIndex = _index;
          });

          /// 两种写法没有结果上的差别，ps：请先理解上面的一串英文（line:139~142）
        },
        itemCount: _pages.length,
        itemBuilder: (context, index) => _pages[index],
      ),

      /// 下面是最简单版的，但是这样就不能做keep-alive了，每次切换都会把前一个销毁
      // body: _pages[_index],
    );
  }
}
