// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_block_link_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureBlockLinkItemDTO _$FeatureBlockLinkItemDTOFromJson(
    Map<String, dynamic> json) {
  return FeatureBlockLinkItemDTO(
    id: json['id'] as int,
    imgPath: json['imgPath'] as String,
    linkType: _$enumDecodeNullable(
        _$FeatureBlockItemLinkTypeEnumMap, json['linkType']),
    linkContent: json['linkContent'] as String,
    promotionType:
        _$enumDecodeNullable(_$ActivityTypeEnumMap, json['promotionType']),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FeatureBlockLinkItemDTOToJson(
        FeatureBlockLinkItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgPath': instance.imgPath,
      'linkType': _$FeatureBlockItemLinkTypeEnumMap[instance.linkType],
      'linkContent': instance.linkContent,
      'promotionType': _$ActivityTypeEnumMap[instance.promotionType],
      'name': instance.name,
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

const _$FeatureBlockItemLinkTypeEnumMap = {
  FeatureBlockItemLinkType.CATEGORY: 'CATEGORY',
  FeatureBlockItemLinkType.STORE: 'STORE',
  FeatureBlockItemLinkType.PRODUCT: 'PRODUCT',
  FeatureBlockItemLinkType.PROMOTION_PAGE: 'PROMOTION_PAGE',
  FeatureBlockItemLinkType.TELEPHONE: 'TELEPHONE',
  FeatureBlockItemLinkType.PROMOTION: 'PROMOTION',
  FeatureBlockItemLinkType.MEMBRANE: 'MEMBRANE',
};

const _$ActivityTypeEnumMap = {
  ActivityType.SECOND_KILL: 'SECOND_KILL',
  ActivityType.SINGLE_PRODUCT: 'SINGLE_PRODUCT',
  ActivityType.PURCHASE_RESTRICTION: 'PURCHASE_RESTRICTION',
  ActivityType.GROUPON: 'GROUPON',
  ActivityType.BUNDLE: 'BUNDLE',
};
