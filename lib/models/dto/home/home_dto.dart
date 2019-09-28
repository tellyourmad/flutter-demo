import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDTO {
  int id;
  int count;
  String title;
  List<dynamic> appPromotionPageBlocks;

  HomeDTO({
    this.id,
    this.count,
    this.title,
    this.appPromotionPageBlocks,
  });

  factory HomeDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeDTOFromJson(json);
}
