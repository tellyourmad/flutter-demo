import 'package:app/constants/app_theme.dart';
import 'package:app/models/dto/promotion/feature/feature_block_dto.dart';
import 'package:app/models/dto/promotion/feature/feature_dto.dart';
import 'package:app/services/home_service.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:app/widgets/common/feature_template/feature_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum _HeaderInputLayout {
  DEFAULT,
  STACK, // 层叠
  SPACE, // 占据空间
}

/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=a899c5f1-5d74-4952-8f30-c66706ef720b&project_id=a899c5f1-5d74-4952-8f30-c66706ef720b&image_id=5bf31d8c-5853-4434-9dc1-36c10cc989bd
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeService _service = HomeService();

  FeatureDTO _info = FeatureDTO();
  bool _loading = true;
  _HeaderInputLayout _headerInputLayout = _HeaderInputLayout.DEFAULT;

  @override
  void initState() {
    super.initState();
    _getData();

    /// 在初始化时发送请求
  }

  void _getData() async {
    /// 调用对应的service里的方法，发送请求获取信息
    _info = await _service.getHomePage(1);

    Color _searchBarBgColor = _info.featureBlocks[1].backgroundColour;
    if (_searchBarBgColor.opacity >= 1) {
      _headerInputLayout = _HeaderInputLayout.SPACE;
    } else {
      _headerInputLayout = _HeaderInputLayout.STACK;
    }
    _loading = false;

    setState(() {});
  }

  /// 顶部样式
  dynamic get headerStyle {
    bool _isLightColor(Color color) {
      num _colorVal =
          color.red * 0.299 + color.green * 0.587 + color.blue * 0.114;
      return _colorVal >= 192;
    }

    Color _searchBarBgColor = Color(0xFFFFFFFF);
    Color _statusBarBgColor = Color(0xFFFFFFFF);
    if (!_loading) {
      _searchBarBgColor = _info.featureBlocks[1].backgroundColour;
      _statusBarBgColor = _info.featureBlocks[2].backgroundColour;
    }

    bool _searchBarIsLight = _isLightColor(_searchBarBgColor);
    return {
      'statusBar': {
        'decoration': BoxDecoration(color: _statusBarBgColor),
        'style':
            _statusBarBgColor.opacity >= 1 || _isLightColor(_statusBarBgColor)
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light,
      },
      'searchBar': {
        'decoration': BoxDecoration(color: _searchBarBgColor),
        'inputBg': _searchBarIsLight ? AppColors.greyF3 : AppColors.white,
        'iconColor': _searchBarIsLight ? AppColors.black666 : AppColors.white,
      },
      'topBlock': {'decoration': BoxDecoration(color: _searchBarBgColor)}
    };
  }

  List<FeatureBlockDTO> get blocks {
    return _info.featureBlocks.skip(3).cast<FeatureBlockDTO>().toList();
  }

  @override
  Widget build(BuildContext context) {
    /// 顶部输入框
    Widget _headerInput = Container(
      width: double.infinity,
      height: ScreenAdapter.height(50.0),
      decoration: headerStyle['searchBar']['decoration'],
      padding: EdgeInsets.symmetric(
        horizontal: ScreenAdapter.width(12.0),
        vertical: ScreenAdapter.height(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: ScreenAdapter.width(14.0),
              ),

              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: headerStyle['searchBar']['inputBg'],
              ),
              height: ScreenAdapter.height(29.0),

              child: Row(
                children: <Widget>[
                  Icon(
                    IconFonts.search,
                    size: ScreenAdapter.fontSize(15.0),
                    color: AppColors.greyBC,
                  ),
                  SizedBox(
                    width: ScreenAdapter.width(8.5),
                  ),

                  Text(
                    '搜索您想要的商品',
                    style: TextStyle(
                      color: AppColors.greyA9,
                      fontSize: ScreenAdapter.fontSize(14.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: ScreenAdapter.width(13.5),
          ),
          Icon(
            IconFonts.message,
            size: ScreenAdapter.fontSize(27.0),
            color: headerStyle['searchBar']['iconColor'],
          ),
        ],
      ),
    );

    /// 内容
    Widget _content = Container(
      height: double.infinity,
      width: double.infinity,
      child: FeatureTemplateWidget(
        topBlockDecoration: headerStyle['topBlock']['decoration'],
        type: FeatureType.HOME,
        blocks: blocks,
      ),
    );


    /// 根据[_headerInputLayout]来判断搜索框[_headerInput]是定位[stack]在内容[_content]上方，还是占据空间[column]
    switch (_headerInputLayout) {
      case _HeaderInputLayout.STACK:
        _content = Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: _headerInput,
            ),
            _content,
          ],
        );
        break;
      case _HeaderInputLayout.SPACE:
        _content = Column(
          children: <Widget>[
            _headerInput,
            Expanded(
              flex: 1,
              child: _content,
            ),
          ],
        );
        break;
      case _HeaderInputLayout.DEFAULT:
      default:
        break;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: headerStyle['statusBar']['style'].copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: ScreenAdapter.padding.top,
              decoration: headerStyle['statusBar']['decoration'],
            ),
            Expanded(
              flex: 1,
              child: _content,
            ),
          ],
        ),
      ),
    );
  }
}
