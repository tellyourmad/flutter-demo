import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/activity/activity_intensity_dto.dart';
import 'package:app/models/entity/activity.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/aliyun_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProductItemLayout {
  MUTIL_COLUMN, // 多列
  FILL_ROW, // 占满一行的
}

class ProductItemWidget extends StatelessWidget {
  ProductItemWidget(
    this.type, {
    this.color = Colors.transparent,
    this.padding,
    this.imgPath,
    this.name,
    this.tagName,
    this.activityType,
    this.activityIntensities,
    this.originPrice,
    this.discountPrice,
  });

  final ProductItemLayout type;
  final Color color;
  final EdgeInsets padding;
  final String imgPath;
  final String name;
  final String tagName;
  final ActivityType activityType;
  List<ActivityIntensityDTO> activityIntensities;
  final originPrice;
  final discountPrice;

  bool get priceVisible {
    if (originPrice == '登录可见') {
      return false;
    }
    return true;
  }

  String get tag {
    if (this.tagName != null && this.tagName.isNotEmpty) {
      return this.tagName;
    }
    switch (this.activityType) {
      case ActivityType.SECOND_KILL:
        return '秒杀';
      case ActivityType.SINGLE_PRODUCT:
        return '单品';
      case ActivityType.PURCHASE_RESTRICTION:
        return '限购';
      case ActivityType.BUNDLE:
        return '组合';
      case ActivityType.GROUPON:
        return '拼团';
      case ActivityType.CONDITION_MARK_DOWN:
        return '满减';
      case ActivityType.CONDITION_DISCOUNT:
        return '满折';
      case ActivityType.CONDITION_COUPON:
        return '满赠';
      case ActivityType.SECOND_HALF_PRICE:
        if (this.activityIntensities != null &&
            this.activityIntensities.length > 0) {
          return '第二件${this.activityIntensities[0].intensity}折';
        }
        return '第二件折扣';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.type == ProductItemLayout.MUTIL_COLUMN) {
      return Container(
        padding: this.padding,
        color: this.color,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: AliyunImage(
                color: AppColors.greyF4,
                colorBlendMode: BlendMode.dstATop,
                fit: BoxFit.fill,
                imageUrl: this.imgPath,
              ),
            ),
            SizedBox(
              height: ScreenAdapter.height(6.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.width(4.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(12.0),
                      color: AppColors.grey36,
                      // height: 33 / 24,
                    ),
                  ),
                  Visibility(
                    visible: tag.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: ScreenAdapter.height(3.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenAdapter.width(3.0),
                        ),
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: AppColors.primaryRed,
                              width: ScreenAdapter.borderWidth(),
                            ),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: AppColors.primaryRed,
                            fontSize: ScreenAdapter.fontSize(10.0),
                            fontWeight: FontWeight.w500,

                            // height: ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenAdapter.height(4.0),
                  ),
                  Text(
                    this.discountPrice.toString(),
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontSize: ScreenAdapter.fontSize(14.0),
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                  ),
                  Visibility(
                    visible: priceVisible && this.discountPrice != null,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: ScreenAdapter.height(3.0),
                      ),
                      child: Text(
                        this.discountPrice.toString(),
                        style: TextStyle(
                          color: AppColors.black999,
                          fontSize: ScreenAdapter.fontSize(11.0),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          height: 0.8,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: this.padding,
        color: this.color,
        width: double.infinity,
        height: ScreenAdapter.height(100.0),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: AliyunImage(
                height: double.infinity,
                color: AppColors.greyF4,
                colorBlendMode: BlendMode.dstATop,
                fit: BoxFit.fill,
                imageUrl: this.imgPath,
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(17.0),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(14.0),
                      color: AppColors.grey36,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.discountPrice.toString(),
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontSize: ScreenAdapter.fontSize(16.0),
                              fontWeight: FontWeight.w500,
                              height: 0.8,
                            ),
                          ),
                          Visibility(
                            visible: priceVisible && this.discountPrice != null,
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenAdapter.height(10.0),
                              ),
                              child: Text(
                                this.discountPrice.toString(),
                                style: TextStyle(
                                  color: AppColors.black999,
                                  fontSize: ScreenAdapter.fontSize(13.0),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  height: 0.8,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        child: Container(
                          height: ScreenAdapter.height(28.0),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenAdapter.width(14.0),
                          ),
                          decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: AppColors.primaryRed),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: ScreenAdapter.fontSize(14.0),
                              fontWeight: FontWeight.w500,

                              // height: ,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
