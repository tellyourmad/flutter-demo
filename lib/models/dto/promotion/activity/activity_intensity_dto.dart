import 'package:app/models/entity/activity.dart';

import 'package:json_annotation/json_annotation.dart';
part 'activity_intensity_dto.g.dart';

@JsonSerializable()
class ActivityIntensityDTO {
  
  final num threshold;
  final num intensity;
  final ActivityThresholdType thresholdType;
  // final bool sameSupply;
  // final bool sameProduct;
  // final List<CouponGiftVo> coupons;

  ActivityIntensityDTO({
    this.threshold,
    this.intensity,
    this.thresholdType,
  });


  factory ActivityIntensityDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivityIntensityDTOFromJson(json);
}
