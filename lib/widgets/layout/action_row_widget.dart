import 'package:app/constants/app_theme.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  ActionRow({
    Key key,
    this.title,
    this.titleStyle,
    this.leading,
    this.icon,
    this.tips,
    this.arrow = true,
    this.padding,
    this.iconOffset,
    this.tipsOffset,
    this.onPressed,
    this.rightChild,
  }) : super(key: key);

  final String title;

  final TextStyle titleStyle;

  final Widget leading;

  final IconData icon;

  final String tips;

  final bool arrow;

  final EdgeInsetsGeometry padding;

  final VoidCallback onPressed;

  final EdgeInsetsGeometry iconOffset;

  final EdgeInsetsGeometry tipsOffset;

  final Widget rightChild;

  EdgeInsetsGeometry get _padding {
    if (this.padding == null) {
      return EdgeInsets.only(
        left: this.leading == null && this.icon == null
            ? ScreenAdapter.width(12.0)
            : 0,
        right: ScreenAdapter.width(12.0),
      );
    }
    return this.padding;
  }

  @override
  Widget build(BuildContext context) {
    // 左边的
    final List<Widget> _LeftSide = <Widget>[];

    if (leading == null) {
      if (icon != null) {
        _LeftSide.add(
          Container(
            width: ScreenAdapter.width(46.0),
            alignment: Alignment.center,
            padding: iconOffset,
            child: Icon(
              icon,
              size: ScreenAdapter.fontSize(20.0),
              color: AppColors.black333,
            ),
          ),
        );
      }
    } else {
      _LeftSide.add(
        Container(
          width: ScreenAdapter.width(46.0),
          alignment: Alignment.center,
          child: leading,
        ),
      );
    }

    _LeftSide.add(
      Text(
        title,
        style: TextStyle(
          color: AppColors.grey43,
          fontSize: ScreenAdapter.fontSize(17.0),
          fontWeight: FontWeight.w500,
        ).merge(titleStyle),
      ),
    );

    // 右边的
    final List<Widget> _RightSide = <Widget>[];

    if (tips != null) {
      _RightSide.add(
        Padding(
          padding:
              tipsOffset ?? EdgeInsets.only(right: ScreenAdapter.width(12.0)),
          child: Text(
            tips,
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(14.0),
              color: AppColors.black999,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    if (rightChild != null) {
      _RightSide.add(rightChild);
    }
    if (arrow) {
      _RightSide.add(
        Icon(
          IconFonts.go_forward,
          size: ScreenAdapter.fontSize(14.0),
          color: AppColors.black999,
        ),
      );
    }

    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      color: AppColors.white,
      child: Container(
        color: onPressed != null ? Colors.transparent : AppColors.white,
        height: ScreenAdapter.height(55.0),
        padding: _padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _LeftSide,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _RightSide,
            ),
          ],
        ),
      ),
    );
  }
}
