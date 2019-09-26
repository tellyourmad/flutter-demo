import 'package:flutter/widgets.dart';

class ColumnFlexLayout extends StatelessWidget{
  ColumnFlexLayout({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.top,
    @required this.body,
    this.bottom 
  }): super(key: key);

  /// “上中下”布局方式：
  ///    top和bottom部分flex：0
  ///    body部分flex：1

  final Widget top;
  final Widget body;
  final Widget bottom;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: this.mainAxisAlignment,
      crossAxisAlignment: this.crossAxisAlignment,
      children: <Widget>[
        this.top??Container(),
        Expanded(
          flex: 1,
          child: this.body
        ),
        this.bottom??Container()
      ]
    );
  }
}