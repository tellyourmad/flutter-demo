import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feature_dto.g.dart';

@JsonSerializable()
class FeatureDTO {

  /// 专题id
  final int id;

  /// 模块数目
  final int count;

  /// 专题名称
  final String title;

  /// 模块集合
  @JsonKey(name: "appPromotionPageBlocks", defaultValue: [])
  final List<FeatureBlockDTO> featureBlocks;

  FeatureDTO({
    this.id,
    this.count = 0,
    this.title = '',
    this.featureBlocks = const [],
  });

  factory FeatureDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureDTOToJson(this);
}
