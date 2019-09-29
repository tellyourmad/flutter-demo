
import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:flutter/cupertino.dart';

class BlockShortcutWidget extends StatelessWidget{
  BlockShortcutWidget({
    Key key,
    @required this.block,
  });


  final FeatureBlockDTO block;


  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: ScreenAdapter.height(90.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: block.detail.linkItems.map((item){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: ScreenAdapter.height(45.0),
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  item.imgPath,
                ),
              ),
              SizedBox(
                height: ScreenAdapter.height(9.0),
              ),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(12.0),
                  color: AppColors.grey86,
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }


}