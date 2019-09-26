import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryPage extends StatefulWidget{
  CategoryPage({Key key}) : super();
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{

  @override
  Widget build (BuildContext context){

    /// 这是Scaffold最常用的方式
    /// appBar（顶部栏）+body（内容）
    return Scaffold(

      /// 这里不需要考虑SafeArea的问题，因为这个自带的AppBar里面处理了，有个paddingTop
      appBar: AppBar(
        title: Text('分类页'),
      ),

      /// body中开始构建主体布局
      /// 常用的布局组件可参考网址：
      ///   https://www.jianshu.com/p/1836d8d23926
      body: Center(
        child: Text(
          '我是分类页'
        ),
      ),
    );
  }
}