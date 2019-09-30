import 'package:flutter/cupertino.dart';

enum CountDownType {
  DECREASE, // 递减
  INCREASE, // 递增
}

class CountDown extends StatefulWidget {
  CountDown({
    Key key,
    this.initTimeOffset,
    this.countDownType,
  });

  final int initTimeOffset;
  final CountDownType countDownType;

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  _CountDownState({Key key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
