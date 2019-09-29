// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_activity_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureActivityProductDTO _$FeatureActivityProductDTOFromJson(
    Map<String, dynamic> json) {
  return FeatureActivityProductDTO(
    name: json['title'] as String,
    promotionProductId: json['promotionProductId'] as int,
    productId: json['productId'] as int,
    originPrice: json['price'] as String,
    discountPrice: json['discountPrice'] as String,
    image: json['image'] as String,
    progressPercent: json['progressPercent'] as String,
    remainStockQuantity: json['remainStockQuantity'] as int,
  );
}

Map<String, dynamic> _$FeatureActivityProductDTOToJson(
        FeatureActivityProductDTO instance) =>
    <String, dynamic>{
      'title': instance.name,
      'promotionProductId': instance.promotionProductId,
      'productId': instance.productId,
      'price': instance.originPrice,
      'discountPrice': instance.discountPrice,
      'image': instance.image,
      'progressPercent': instance.progressPercent,
      'remainStockQuantity': instance.remainStockQuantity,
    };
