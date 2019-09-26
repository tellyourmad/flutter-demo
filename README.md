# Flutter Demo

包含基本的路由配置以及首页、我的、登录页

## 概况


### 项目启动

命令行到根目录，获取依赖：

```
flutter pub get
```

运行：
```
flutter run
```



### 导读

#### 文件结构
```
lib/
|- constants/   # 全局常量
|- lanhu/   # 设计图
|- ui/    # 具体页面
|- utils/   # 工具类
|- widgets/   # UI组件
|- main.dart  # 项目主入口
|- routes.dart  # 命名路由定义
```

**第一步：**
main.dart、routes.dart、constants/app_theme.dart，明白如何设置theme（主题）和routes（路由）

**第二步：**
ui/root.dart，基本语法，tabs的使用，controller的使用，setState与state的使用与理解等

**第三步：**
ui/pages/category_page.dart，掌握最简单的页面

**第四步：**
ui/pages/home_page.dart，ShapeBorder圆角的构造，SafeArea，基本布局，Stack与Position，CustomScrollView

**第五步：**
ui/pages/mine_page.dart，基本布局强化，公用组件的使用

**第六步：**
widgets/layout/column_flex_layout_widget.dart，简单公用组件的编写

**第七步：**
ui/pages/cart_page.dart，页面的跳转方式

**第八步：**
ui/login/login.dart，表单相关，页面回退传参



### 相关知识文档

基础：

- [Dart语法基础](https://www.baidu.com/link?url=I51cAfZBBLCrl7neDMs6APjsqWNqANVREjBjW-HocXDQ4NNG3_RttW3P1P8tywsx&wd=&eqid=95293d4b00018ce7000000025d8c3485)
- [静态资源的使用](https://www.baidu.com/link?url=fqF9MTOY2JpDOBaw07rACcMVGCcTZugfL0ojbNHhtJdl52WTa9hHD6krHPAdFtrzdNGfIYj-H95dpALJGUmrbq&wd=&eqid=d1f7b50400042d80000000025d8c52fc)

布局相关：

- [常用布局Widget](https://www.jianshu.com/p/1836d8d23926)
- [ShapeBorder 抽象类](https://www.cnblogs.com/z45281625/p/10400631.html)
- [圆形/圆角](https://www.jianshu.com/p/b4085a1a5129)
- [层叠布局 Stack](https://www.jianshu.com/p/387d730cbe92)
- [CustomerScrollView](https://www.jianshu.com/p/ca79eb54a356)

另外需要知道还有（后面需要用到的）：

- [Http请求库 Dio](https://github.com/flutterchina/dio)
- [本地数据存储 SharedPreferences](https://www.jianshu.com/p/735b5684e900)



### 阿里巴巴矢量图使用

**step 1:更新ttf文件**
更新 /assets/fonts/iconfont/ 文件夹下的iconfont.css和iconfont.ttf文件

**step 2:生成dart文件**
```
python translate_iconfont.py    #运行该文件下的python文件，将会往 /lib/widgets/ 文件夹下注入 iconfont_widget.dart 文件
```

**step3:使用**
```
import 'package:czh/widgets/iconfont_widget.dart';
...
    Icon(
        IconFont.release_inactive       # 名字为iconfont上的classname
    )
...
```
