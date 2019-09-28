// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicDTO<T> _$BasicDTOFromJson<T>(Map<String, dynamic> json) {
  return BasicDTO<T>(
    data: json['data'],
    msg: json['msg'] as String,
    success: json['success'] as bool,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$BasicDTOToJson<T>(BasicDTO<T> instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'success': instance.success,
      'total': instance.total,
    };
