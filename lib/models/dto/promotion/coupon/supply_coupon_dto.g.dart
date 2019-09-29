// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_coupon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyCouponDTO _$SupplyCouponDTOFromJson(Map<String, dynamic> json) {
  return SupplyCouponDTO(
    id: json['id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    totalLimit: (json['totalLimit'] as num)?.toDouble(),
    startTime: timeStampToDateTime(json['startTime']),
    endTime: timeStampToDateTime(json['endTime']),
    status: byteToBool(json['couponStatus4Customer']) ?? false,
  );
}

Map<String, dynamic> _$SupplyCouponDTOToJson(SupplyCouponDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'totalLimit': instance.totalLimit,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'couponStatus4Customer': instance.status,
    };
