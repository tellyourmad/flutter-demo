// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureDTO _$FeatureDTOFromJson(Map<String, dynamic> json) {
  return FeatureDTO(
    id: json['id'] as int,
    count: json['count'] as int,
    title: json['title'] as String,
    featureBlocks: (json['appPromotionPageBlocks'] as List)
            ?.map((e) => e == null
                ? null
                : FeatureBlockDTO.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$FeatureDTOToJson(FeatureDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'title': instance.title,
      'appPromotionPageBlocks': instance.featureBlocks,
    };
