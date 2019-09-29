// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_block_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureBlockDTO _$FeatureBlockDTOFromJson(Map<String, dynamic> json) {
  return FeatureBlockDTO(
    id: json['id'] as int,
    title: json['title'] as String,
    hideTitle: json['hideTitle'] as bool,
    detail: json['normal'] == null
        ? null
        : FeatureBlockDetailDTO.fromJson(
            json['normal'] as Map<String, dynamic>),
    activity: json['promotion'] == null
        ? null
        : FeatureActivityDTO.fromJson(
            json['promotion'] as Map<String, dynamic>),
    coupons: (json['coupons'] as List)
        ?.map((e) => e == null
            ? null
            : SupplyCouponDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    coverImgPath: json['coverImgPath'] as String,
    backgroundColour: json['backgroundColour'] as String,
    backgroundImg: json['backgroundImg'] as String,
  );
}

Map<String, dynamic> _$FeatureBlockDTOToJson(FeatureBlockDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hideTitle': instance.hideTitle,
      'normal': instance.detail,
      'promotion': instance.activity,
      'coupons': instance.coupons,
      'coverImgPath': instance.coverImgPath,
      'backgroundColour': instance.backgroundColour,
      'backgroundImg': instance.backgroundImg,
    };
