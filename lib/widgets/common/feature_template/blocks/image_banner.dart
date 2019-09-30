import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/routes.dart';
import 'package:flutter/widgets.dart';

class BlockImageBannerWidget extends StatelessWidget {
  BlockImageBannerWidget({
    Key key,
    @required this.block,
  });

  final FeatureBlockDTO block;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.block.detail.linkItems.map((item) {
        return GestureDetector(
          child: Image(
            width: double.infinity,
            fit: BoxFit.fitWidth,
            image: NetworkImage(item.imgPath),
          ),
          onTap: () {
            Routes.jumpTo(
              context,
              item.linkType,
              item.linkContent,
            );
          },
        );
      }).toList(),
    );
  }
}
