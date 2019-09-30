import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/others/count_down.dart';
import 'package:flutter/material.dart';

class BlockActivityWidget extends StatelessWidget {
  BlockActivityWidget({
    Key key,
    @required this.block,
  });

  final FeatureBlockDTO block;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(110.0),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenAdapter.width(24.0),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.block.title,
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(20.0),
                        color: AppColors.grey30,
                      ),
                    ),
                    SizedBox(
                      width: ScreenAdapter.width(8.0),
                    ),
                    CountDown(
                      initTimeOffset: block.activity.timeRemainingSec,
                      countDownType: CountDownType.DECREASE,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '更多',
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(12.0),
                        color: AppColors.black666,
                      ),
                    ),
                    SizedBox(
                      width: ScreenAdapter.width(4.0),
                    ),
                    Icon(
                      IconFonts.go_forward,
                      size: ScreenAdapter.fontSize(10.0),
                      color: AppColors.grey81,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
