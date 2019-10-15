import 'package:app/models/dto/promotion/activity/activity_intensity_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_activity_product_dto.dart';
import 'package:app/models/entity/activity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feature_activity_dto.g.dart';

bool byteToBool(dynamic val) {
  /// 后端用的是byte，这边转成boolean
  if (val == 1) {
    return true;
  } else {
    return false;
  }
}

DateTime timeStampToDateTime(dynamic val) {
  /// 后端的是用long型
  if (val != null && val > 0) {
    return DateTime.fromMillisecondsSinceEpoch(val);
  } else {
    return null;
  }
}

@JsonSerializable()
class FeatureActivityDTO {
  final int promotionId;

  /// 活动类型
  @JsonKey(name: "promotionType")
  final ActivityType type;

  /// 商品排列（一行几列）
  final int productsColumn;

  /// 副标题
  final String subTitle;

  /// 海报图url
  final String coverImgPath;

  /// 是否显示海报图
  @JsonKey(fromJson: byteToBool, defaultValue: false)
  final bool showCoverImg;

  /// 是否显示倒计时
  @JsonKey(fromJson: byteToBool, defaultValue: false)
  final bool showTimeRemaining;

  /// 距离结束还剩多长时间（毫秒）
  final int timeRemainingSec;

  /// 距离开始还有多长时间（毫秒）
  final int secondToBeginTime;

  /// 开始时间（先忽略，现在没用）
  @JsonKey(ignore: true, fromJson: timeStampToDateTime)
  final DateTime startTime;

  /// 是否还有更多商品
  @JsonKey(defaultValue: false)
  final bool hasMoreProducts;

  /// 商品集合
  @JsonKey(defaultValue: [])
  final List<FeatureActivityProductDTO> products;

  /// 活动力度
  @JsonKey(name: "promotionIntensities")
  List<ActivityIntensityDTO> intensities;

  FeatureActivityDTO({
    this.promotionId,
    this.type,
    this.productsColumn,
    this.subTitle,
    this.showCoverImg,
    this.coverImgPath,
    this.showTimeRemaining,
    this.timeRemainingSec,
    this.secondToBeginTime,
    this.startTime,
    this.hasMoreProducts,
    this.products,
  });

  factory FeatureActivityDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureActivityDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureActivityDTOToJson(this);
}
