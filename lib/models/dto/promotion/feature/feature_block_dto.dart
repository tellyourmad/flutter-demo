import 'dart:ui';

import 'package:app/models/dto/promotion/coupon/supply_coupon_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_activity_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_block_detail_dto.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feature_block_dto.g.dart';

Color rbgaToColor(String val) {
  /// 后端返回的是形如"rgba(255,255,255,1)"的字符串
  if (val == null) {
    return null;
  }
  List<String> result = val.replaceAll(RegExp("[rgba() ]"), '').split(',');
  return Color.fromRGBO(int.parse(result[0]), int.parse(result[1]), int.parse(result[2]), double.parse(result[3]));
}

@JsonSerializable()
class FeatureBlockDTO {
  final int id;

  ///楼层标题
  final String title;

  /// 是否隐藏楼层名称
  final bool hideTitle;

  /// 直接链接
  @JsonKey(name: 'normal')
  final FeatureBlockDetailDTO detail;

  /// 活动链接
  @JsonKey(name: 'promotion')
  final FeatureActivityDTO activity;

  /// 优惠券
  final List<SupplyCouponDTO> coupons;

  /// 封面图
  final String coverImgPath;

  /// 背景颜色
  @JsonKey(fromJson: rbgaToColor)
  final Color backgroundColour;

  /// 背景图片
  final String backgroundImg;

  FeatureBlockDTO({
    this.id,
    this.title,
    this.hideTitle,
    this.detail,
    this.activity,
    this.coupons,
    this.coverImgPath,
    this.backgroundColour,
    this.backgroundImg,
  });

  factory FeatureBlockDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureBlockDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureBlockDTOToJson(this);
}
