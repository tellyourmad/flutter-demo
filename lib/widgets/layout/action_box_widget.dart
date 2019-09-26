import 'package:app/constants/app_theme.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActionBox extends StatelessWidget{
  ActionBox({
    Key key,
    this.children,
    this.color = AppColors.white,
    this.borderColor = AppColors.greyD8,
    this.borderIndent,
    this.borderEndIndent,
    this.boxGap = const EdgeInsets.only(top: 5.0)
  }):super(key: key);

  final List<Widget> children;
  final Color color;
  final Color borderColor;
  final double borderIndent;
  final double borderEndIndent;
  final EdgeInsetsGeometry boxGap;

  @override
  Widget build (BuildContext context){

    final List<Widget> _result = <Widget>[];
    for (int n = 0; n < children.length; n++) {
      if(n>=1){
        _result.add(
          Divider(
            height: ScreenAdapter.borderWidth(),
            indent: borderIndent ?? 0.0,
            endIndent: borderEndIndent ?? borderIndent ?? 0.0,
            color: borderColor ?? Colors.transparent
          )
        );
      }
      _result.add(children[n]);
    }
    return Padding(
      padding: boxGap,
      child: Container(
        color: color,
        child: Column(
          children: _result
        )
      )
    );

  }
}