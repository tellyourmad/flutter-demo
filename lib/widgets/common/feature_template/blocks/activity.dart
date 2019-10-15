import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/common/product_item.dart';
import 'package:app/widgets/others/count_down.dart';
import 'package:flutter/material.dart';

class BlockActivityWidget extends StatelessWidget {
  BlockActivityWidget({
    Key key,
    @required this.block,
  });

  final FeatureBlockDTO block;

  SliverGridDelegate get gridDelegate {
    int axisCount = this.block.activity.productsColumn;
    double aspectRatio = 1.0;
    switch (this.block.activity.productsColumn) {
      case 1:
        break;
      case 3:
        aspectRatio = 218 / 380;
        break;
      case 4:
        aspectRatio = 168 / 350;
        break;
      case 2:
      default:
        aspectRatio = 340 / 528;
        break;
    }
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: axisCount,
      childAspectRatio: aspectRatio,
      mainAxisSpacing: ScreenAdapter.width(5.0),
      crossAxisSpacing: ScreenAdapter.width(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Visibility(
            visible: !this.block.hideTitle,
            child: Container(
              height: ScreenAdapter.height(55.0),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.width(12.0),
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

                      /// TODO 倒计时组件未完成
                      CountDown(
                        initTimeOffset: block.activity.timeRemainingSec,
                        countDownType: CountDownType.DECREASE,
                      ),
                    ],
                  ),

                  /// TODO 点击更多跳转到活动页
                  Visibility(
                    visible: this.block.activity.hasMoreProducts,
                    child: Row(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          this.block.activity.productsColumn == 1
              ? ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenAdapter.width(6.0),
                  ),
                  itemBuilder: (context, index) {
                    var item = this.block.activity.products[index];
                    return ProductItemWidget(
                      ProductItemLayout.FILL_ROW,
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.width(6.0),
                        vertical: ScreenAdapter.height(10.0),
                      ),
                      color: AppColors.white,
                      imgPath: item.image,
                      name: item.name,
                      activityType: this.block.activity.type,
                      activityIntensities: this.block.activity.intensities,
                      discountPrice: item.discountPrice,
                      originPrice: item.originPrice,
                    );
                  },
                  separatorBuilder: (context, int) {
                    return SizedBox(
                      height: ScreenAdapter.height(10.0),
                    );
                  },
                  itemCount: this.block.activity.products.length ,
                )
              : GridView(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenAdapter.height(3.0),
                    horizontal: ScreenAdapter.width(12.0),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: gridDelegate,
                  children: this.block.activity.products.map((item) {
                    return ProductItemWidget(
                      ProductItemLayout.MUTIL_COLUMN,
                      color: AppColors.white,
                      imgPath: item.image,
                      name: item.name,
                      activityType: this.block.activity.type,
                      activityIntensities: this.block.activity.intensities,
                      discountPrice: item.discountPrice,
                      originPrice: item.originPrice,
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
