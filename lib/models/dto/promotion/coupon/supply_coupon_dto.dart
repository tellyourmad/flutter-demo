import 'package:json_annotation/json_annotation.dart';

part 'supply_coupon_dto.g.dart';

DateTime timeStampToDateTime(dynamic val) {
  /// 后端的是用int型（要乘以1000）
  if (val != null && val > 0) {
    return DateTime.fromMillisecondsSinceEpoch(val*1000);
  } else {
    return null;
  }
}

bool byteToBool(dynamic val) {
  /// 后端用的是byte，这边转成boolean
  if (val == 1) {
    return true;
  } else {
    return false;
  }
}

@JsonSerializable()
class SupplyCouponDTO {

  /// 优惠券id
  int id;

  /// 优惠券名
  String name;

  /// 优惠券价值（BigDecimal）
  double price;

  /// 优惠券最小使用门槛（BigDecimal）
  double totalLimit;

  // int receiveLimit;
  // Long totalQuantity;
  // Long sendQuantity;

  /// 开始时间
  @JsonKey(fromJson: timeStampToDateTime)
  DateTime startTime;

  /// 结束时间
  @JsonKey(fromJson: timeStampToDateTime)
  DateTime endTime;

  // int supplyUserId;
  // double maxQuantity;
  // double maxCode;
  // Byte status;
  // int blockId;

  /// 优惠券状态，true为可用
  @JsonKey(name: "couponStatus4Customer",fromJson: byteToBool, defaultValue: false)
  bool status;

  // String couponStatus4CustomerIntro;
  // Long startTimeUnix;
  // Long endTimeUnix;

  SupplyCouponDTO({
    this.id,
    this.name,
    this.price,
    this.totalLimit,
    this.startTime,
    this.endTime,
    this.status,
  });

  factory SupplyCouponDTO.fromJson(Map<String, dynamic> json) =>
      _$SupplyCouponDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SupplyCouponDTOToJson(this);
}
