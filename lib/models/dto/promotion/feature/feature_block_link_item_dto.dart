
import 'package:app/models/entity/activity.dart';
import 'package:app/models/entity/feature.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feature_block_link_item_dto.g.dart';
@JsonSerializable()
class FeatureBlockLinkItemDTO {
  final int id;
  final String imgPath;
  final FeatureBlockItemLinkType linkType;
  final String linkContent;
  final ActivityType promotionType;
  final String name;

  FeatureBlockLinkItemDTO({
    this.id,
    this.imgPath,
    this.linkType,
    this.linkContent,
    this.promotionType,
    this.name,
  });

  factory FeatureBlockLinkItemDTO.fromJson(Map<String, dynamic> json) => _$FeatureBlockLinkItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureBlockLinkItemDTOToJson(this);
}