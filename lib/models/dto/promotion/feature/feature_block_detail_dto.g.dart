// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_block_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureBlockDetailDTO _$FeatureBlockDetailDTOFromJson(
    Map<String, dynamic> json) {
  return FeatureBlockDetailDTO(
    layoutType: _$enumDecodeNullable(
        _$FeatureBlockLayoutTypeEnumMap, json['layoutType']),
    layoutColumn: json['linkLayoutColumn'] as int,
    linkItems: (json['links'] as List)
        ?.map((e) => e == null
            ? null
            : FeatureBlockLinkItemDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeatureBlockDetailDTOToJson(
        FeatureBlockDetailDTO instance) =>
    <String, dynamic>{
      'layoutType': _$FeatureBlockLayoutTypeEnumMap[instance.layoutType],
      'linkLayoutColumn': instance.layoutColumn,
      'links': instance.linkItems,
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

const _$FeatureBlockLayoutTypeEnumMap = {
  FeatureBlockLayoutType.BACKGROUND: 'BACKGROUND',
  FeatureBlockLayoutType.SEARCHBAR: 'SEARCHBAR',
  FeatureBlockLayoutType.STATUSBAR: 'STATUSBAR',
  FeatureBlockLayoutType.BANNER: 'BANNER',
  FeatureBlockLayoutType.ICON: 'ICON',
  FeatureBlockLayoutType.MIXN: 'MIXN',
  FeatureBlockLayoutType.MIX1: 'MIX1',
  FeatureBlockLayoutType.MIX2: 'MIX2',
  FeatureBlockLayoutType.MIX3: 'MIX3',
  FeatureBlockLayoutType.MIX4: 'MIX4',
  FeatureBlockLayoutType.MIX5: 'MIX5',
  FeatureBlockLayoutType.PROMOTION: 'PROMOTION',
  FeatureBlockLayoutType.COUPONS: 'COUPONS',
};
