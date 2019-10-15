import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_block_link_item_dto.dart';
import 'package:app/models/entity/feature.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/aliyun_image.dart';
import 'package:flutter/widgets.dart';

enum _ShapeType {
  SQUARE, // 正方形
  RECTANGLE, // 长方形
}

enum _ItemSize {
  HALF, // 一半
  QUARTER, // 四分之一
}

class _Item extends StatelessWidget {
  _Item({
    Key key,
    @required this.item,
    this.size = _ItemSize.HALF,
    this.shapeType = _ShapeType.SQUARE,
  });
  final FeatureBlockLinkItemDTO item;
  final _ItemSize size;
  final _ShapeType shapeType;

  double get aspectRatio {
    switch (this.shapeType) {
      case _ShapeType.RECTANGLE:
        return 2;
      case _ShapeType.SQUARE:
      default:
        return 1;
    }
  }

  double get width {
    switch (this.size) {
      case _ItemSize.HALF:
        return 375 / 2;
      case _ItemSize.QUARTER:
        return 375 / 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(width),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: this.item == null
            ? Container()
            : AliyunImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: this.item.imgPath,
              ),
      ),
    );
  }
}

class BlockMixLayoutWidget extends StatelessWidget {
  BlockMixLayoutWidget({
    Key key,
    @required this.layoutType,
    @required this.block,
  });

  final FeatureBlockLayoutType layoutType;

  final FeatureBlockDTO block;

  List<Widget> get children {
    var links = block.detail.linkItems;
    links.addAll(List(5));
    switch (this.layoutType) {
      case FeatureBlockLayoutType.MIX2:
        return [
          _Item(item: links[0]),
          _Item(item: links[1]),
        ];
      case FeatureBlockLayoutType.MIX3:
        return [
          _Item(item: links[0]),
          Column(
            children: <Widget>[
              _Item(
                item: links[1],
                shapeType: _ShapeType.RECTANGLE,
              ),
              _Item(
                item: links[2],
                shapeType: _ShapeType.RECTANGLE,
              ),
            ],
          )
        ];
      case FeatureBlockLayoutType.MIX4:
        return [
          Column(
            children: [
              _Item(
                item: links[0],
                shapeType: _ShapeType.RECTANGLE,
                size: _ItemSize.QUARTER,
              ),
              _Item(
                item: links[1],
                shapeType: _ShapeType.RECTANGLE,
                size: _ItemSize.QUARTER,
              ),
            ],
          ),
          Column(
            children: [
              _Item(
                item: links[2],
                shapeType: _ShapeType.RECTANGLE,
                size: _ItemSize.QUARTER,
              ),
              _Item(
                item: links[3],
                shapeType: _ShapeType.RECTANGLE,
                size: _ItemSize.QUARTER,
              ),
            ],
          ),
        ];
      case FeatureBlockLayoutType.MIX5:
        return [
          _Item(item: links[0]),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _Item(
                    item: links[1],
                    shapeType: _ShapeType.SQUARE,
                    size: _ItemSize.QUARTER,
                  ),
                  _Item(
                    item: links[2],
                    shapeType: _ShapeType.SQUARE,
                    size: _ItemSize.QUARTER,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _Item(
                    item: links[3],
                    shapeType: _ShapeType.SQUARE,
                    size: _ItemSize.QUARTER,
                  ),
                  _Item(
                    item: links[4],
                    shapeType: _ShapeType.SQUARE,
                    size: _ItemSize.QUARTER,
                  ),
                ],
              )
            ],
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: children,
      ),
    );
  }
}
