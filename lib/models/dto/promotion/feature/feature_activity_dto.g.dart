// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureActivityDTO _$FeatureActivityDTOFromJson(Map<String, dynamic> json) {
  return FeatureActivityDTO(
    promotionId: json['promotionId'] as int,
    promotionType:
        _$enumDecodeNullable(_$ActivityTypeEnumMap, json['promotionType']),
    productsColumn: json['productsColumn'] as int,
    subTitle: json['subTitle'] as String,
    showCoverImg: byteToBool(json['showCoverImg']) ?? false,
    coverImgPath: json['coverImgPath'] as String,
    showTimeRemaining: byteToBool(json['showTimeRemaining']) ?? false,
    timeRemainingSec: json['timeRemainingSec'] as int,
    secondToBeginTime: json['secondToBeginTime'] as int,
    hasMoreProducts: json['hasMoreProducts'] as bool ?? false,
    products: (json['products'] as List)
            ?.map((e) => e == null
                ? null
                : FeatureActivityProductDTO.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$FeatureActivityDTOToJson(FeatureActivityDTO instance) =>
    <String, dynamic>{
      'promotionId': instance.promotionId,
      'promotionType': _$ActivityTypeEnumMap[instance.promotionType],
      'productsColumn': instance.productsColumn,
      'subTitle': instance.subTitle,
      'coverImgPath': instance.coverImgPath,
      'showCoverImg': instance.showCoverImg,
      'showTimeRemaining': instance.showTimeRemaining,
      'timeRemainingSec': instance.timeRemainingSec,
      'secondToBeginTime': instance.secondToBeginTime,
      'hasMoreProducts': instance.hasMoreProducts,
      'products': instance.products,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ActivityTypeEnumMap = {
  ActivityType.SECOND_KILL: 'SECOND_KILL',
  ActivityType.SINGLE_PRODUCT: 'SINGLE_PRODUCT',
  ActivityType.PURCHASE_RESTRICTION: 'PURCHASE_RESTRICTION',
  ActivityType.GROUPON: 'GROUPON',
  ActivityType.BUNDLE: 'BUNDLE',
};
