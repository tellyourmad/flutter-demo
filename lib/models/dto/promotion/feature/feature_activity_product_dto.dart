import 'package:json_annotation/json_annotation.dart';
part 'feature_activity_product_dto.g.dart';

@JsonSerializable()
class FeatureActivityProductDTO {
  @JsonKey(ignore: true)
  final int blockId;

  /// 活动商品名称
  @JsonKey(name: "title")
  final String name;

  /// 活动商品id
  final int promotionProductId;

  /// 商品id
  final int productId;

  /// 原价
  @JsonKey(name: "price")
  final String originPrice;

  /// 活动价
  final String discountPrice;

  /// 图片id
  @JsonKey(ignore: true)
  final String imageId;

  /// 图片url
  final String image;

  /// 活动销售进程（售出了百分之多少件）
  final String progressPercent;

  /// 该活动商品剩余库存
  final int remainStockQuantity;

  // final Byte saleStatus;

  /// 排序权重
  @JsonKey(ignore: true)
  final int orderNum;

  // final int weight;

  FeatureActivityProductDTO({
    this.blockId,
    this.name,
    this.promotionProductId,
    this.productId,
    this.originPrice,
    this.discountPrice,
    this.imageId,
    this.image,
    this.progressPercent,
    this.remainStockQuantity,
    this.orderNum,
  });

  factory FeatureActivityProductDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureActivityProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureActivityProductDTOToJson(this);
}
