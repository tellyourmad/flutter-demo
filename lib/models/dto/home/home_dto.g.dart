// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDTO _$HomeDTOFromJson(Map<String, dynamic> json) {
  return HomeDTO(
    id: json['id'] as int,
    count: json['count'] as int,
    title: json['title'] as String,
    appPromotionPageBlocks: json['appPromotionPageBlocks'] as List,
  );
}

Map<String, dynamic> _$HomeDTOToJson(HomeDTO instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'title': instance.title,
      'appPromotionPageBlocks': instance.appPromotionPageBlocks,
    };
