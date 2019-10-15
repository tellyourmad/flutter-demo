// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_intensity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityIntensityDTO _$ActivityIntensityDTOFromJson(Map<String, dynamic> json) {
  return ActivityIntensityDTO(
    threshold: json['threshold'] as num,
    intensity: json['intensity'] as num,
    thresholdType: _$enumDecodeNullable(
        _$ActivityThresholdTypeEnumMap, json['thresholdType']),
  );
}

Map<String, dynamic> _$ActivityIntensityDTOToJson(
        ActivityIntensityDTO instance) =>
    <String, dynamic>{
      'threshold': instance.threshold,
      'intensity': instance.intensity,
      'thresholdType': _$ActivityThresholdTypeEnumMap[instance.thresholdType],
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

const _$ActivityThresholdTypeEnumMap = {
  ActivityThresholdType.PIECE: 'PIECE',
  ActivityThresholdType.PRICE: 'PRICE',
};
