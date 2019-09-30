import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_block_link_item_dto.dart';
import 'package:app/routes.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class _MySwiperPaginationBuilder extends SwiperPlugin {
  final Key key;
  const _MySwiperPaginationBuilder({this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 2.5,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2.5),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              color:
                  active ? AppColors.white : AppColors.white.withOpacity(0.8),
              width: active ? 15.0 : 5.0,
              height: 5.0,
            ),
          ),
        ),
      );
    }

    return new Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}

class BlockCarouselBannerWidget extends StatelessWidget {
  BlockCarouselBannerWidget({
    Key key,
    @required this.block,
    this.hasPadding = false,
  });

  /// 是否有内边距
  final bool hasPadding;

  final FeatureBlockDTO block;

  List<FeatureBlockLinkItemDTO> get links {
    return block.detail.linkItems;
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: hasPadding
              ? EdgeInsets.all(
                  ScreenAdapter.width(12.0),
                )
              : EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  hasPadding ? BorderRadius.circular(5.0) : BorderRadius.zero,
              child: GestureDetector(
                child: Image(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                    links[index].imgPath,
                  ),
                ),
                onTap: () {
                  Routes.jumpTo(
                    context,
                    links[index].linkType,
                    links[index].linkContent,
                  );
                },
              ),
            ),
          ),
        );
      },
      itemCount: links.length,
      pagination: new SwiperPagination(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
          bottom: ScreenAdapter.height(20.0),
        ),
        builder: _MySwiperPaginationBuilder(),
      ),
      scrollDirection: Axis.horizontal,
      autoplay: true,
    );
  }
}
