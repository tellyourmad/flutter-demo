import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/models/entity/feature.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/common/feature_template/blocks/activity.dart';
import 'package:app/widgets/common/feature_template/blocks/carousel_banner.dart';
import 'package:app/widgets/common/feature_template/blocks/image_banner.dart';
import 'package:app/widgets/common/feature_template/blocks/mix_layout.dart';
import 'package:app/widgets/common/feature_template/blocks/shortcut.dart';
import 'package:flutter/material.dart';

/// 专题模板类型：
/// [HOME]首页专题、[NORMAL]普通专题
enum FeatureType {
  HOME,
  NORMAL,
}

class FeatureTemplateWidget extends StatelessWidget {
  FeatureTemplateWidget({
    Key key,
    this.type,
    this.blocks,
    this.inputWidget,
    this.controller,
  }) : super(key: key);

  /// 专题模板类型
  final FeatureType type;

  /// 模块集合
  final List<FeatureBlockDTO> blocks;

  /// 顶部输入框
  /// 该属性只有当[type]为[FeatureType.HOME]有作用
  final Widget inputWidget;

  /// 控制器
  final ScrollController controller;

  List<Widget> get children {
    List<Widget> result = [];
    for (int index = 0; index < this.blocks.length; index++) {
      Widget item;
      var block = this.blocks[index];
      if (block.coupons != null) {
        /// 优惠券

      } else if (block.detail != null) {
        /// 普通模块
        var detail = block.detail;
        switch (detail.layoutType) {
          case FeatureBlockLayoutType.BANNER:

            /// 如果第一个是BANNER，并且为首页专题，布局不一样
            if (index == 0 && this.type == FeatureType.HOME) {
              item = Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: ScreenAdapter.height(150.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            const Color(0xFFFF080B),
                            const Color(0xFFFF2F3C),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BlockCarouselBannerWidget(
                    hasPadding: true,
                    block: block,
                  )
                ],
              );
            } else {
              item = BlockCarouselBannerWidget(block: block);
            }
            item = AspectRatio(
              aspectRatio: 700 / 445,
              child: item,
            );
            break;
          case FeatureBlockLayoutType.ICON:
            item = BlockShortcutWidget(block: block);
            break;
          case FeatureBlockLayoutType.MIX1:
            item = BlockImageBannerWidget(block: block);
            break;
          case FeatureBlockLayoutType.MIX2:
          case FeatureBlockLayoutType.MIX3:
          case FeatureBlockLayoutType.MIX4:
          case FeatureBlockLayoutType.MIX5:
            item = BlockMixLayoutWidget(
              layoutType: detail.layoutType,
              block: block,
            );
            break;
          case FeatureBlockLayoutType.PROMOTION:
            item = BlockActivityWidget(
              block: block,
            );
            break;
          default:
            break;
        }
      } else if (block.activity != null) {
        /// 活动模块

      }
      if (item != null) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: EdgeInsets.zero,
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}
