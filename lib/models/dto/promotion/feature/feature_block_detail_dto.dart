
import 'package:app/models/dto/promotion/feature/feature_block_link_item_dto.dart';
import 'package:app/models/entity/feature.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feature_block_detail_dto.g.dart';

@JsonSerializable()
class FeatureBlockDetailDTO {
  /// 布局方式
  final FeatureBlockLayoutType layoutType;

  /// 布局列数
  @JsonKey(name:"linkLayoutColumn")
  final int layoutColumn;

  /// 距离内容
  @JsonKey(name:"links")
  final List<FeatureBlockLinkItemDTO> linkItems;

  FeatureBlockDetailDTO({
    this.layoutType,
    this.layoutColumn,
    this.linkItems,
  });

  factory FeatureBlockDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureBlockDetailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureBlockDetailDTOToJson(this);
}
