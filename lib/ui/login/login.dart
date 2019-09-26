import 'package:app/constants/app_theme.dart';
import 'package:app/constants/images.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/overwrite/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 蓝湖地址
/// https://lanhuapp.com/web/#/item/project/board/detail?pid=d87fcea5-db98-4434-a402-4e18b06ccea0&project_id=d87fcea5-db98-4434-a402-4e18b06ccea0&image_id=ce7af173-afb4-4600-bc62-f1b5ea3c247c
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  /// 文本编辑控制器
  TextEditingController _phoneEditController;
  TextEditingController _pwdEditController;

  /// 可以给TextFormField或TextField等有状态组件使用的对象，用于获取键盘焦点并处理键盘事件（如触发该节点的"聚焦focus"与"失焦unfocus"）
  FocusNode _phoneFocusNode;
  FocusNode _pwdFocusNode;

  bool _canLogin = false; // 判断是否可以点击"登录"按钮，当为false时，按钮为disable状态

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    /// 实例化控制器，并向控制器中添加监听器
    _phoneEditController = new TextEditingController()
      ..addListener(_listenEmpty);
    _pwdEditController = new TextEditingController()..addListener(_listenEmpty);

    _phoneFocusNode = new FocusNode();
    _pwdFocusNode = new FocusNode();

    super.initState();
  }

  void _listenEmpty() {
    /// 当两个输入框的值都为空时，将"登录"按钮置灰
    bool result = _phoneEditController.text.isNotEmpty &&
        _pwdEditController.text.isNotEmpty;
    if (result != _canLogin) {
      setState(() {
        _canLogin = result;
      });
    }
  }

  @override
  void dispose() {
    /// 在组件销毁前释放资源（销毁控制器、撤销监听）
    _phoneFocusNode.dispose();
    _pwdFocusNode.dispose();
    _phoneEditController.dispose();
    _pwdEditController.dispose();
    super.dispose();
  }

  Future _onSubmit() async {
    /// 主动失去焦点
    _phoneFocusNode.unfocus();
    _pwdFocusNode.unfocus();

    print(_formKey.currentState.validate());
    /// 触发表单验证
    if (!_formKey.currentState.validate()) {
      /// 验证不通过
      return;
    }

    /// pop方法中传递参数
    Navigator.of(context).pop(true);

    /// 在cart_page.dart中有这段代码
    /// Navigator.of(context)
    ///   .pushNamed(Routes.login)
    ///   .then((result) {
    ///     print(result);        // 输出信息：true
    ///   })

  }

  InputBorder _createBorder(Color _color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: _color,
        width: ScreenAdapter.borderWidth(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 两个输入框的公用样式
    final InputDecoration _decoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ScreenAdapter.width(10.0),
        vertical: ScreenAdapter.height(12.0),
      ),
      hintStyle: TextStyle(
        color: const Color(0xFFA8A8A8),
        fontSize: ScreenAdapter.fontSize(16.0),
      ),
      labelStyle: TextStyle(
        color: const Color(0xFF333333),
        fontSize: ScreenAdapter.fontSize(16.0),
      ),
      enabledBorder: _createBorder(Color(0xFFE8E8E8)),
      focusedBorder: _createBorder(AppColors.primaryRed),
      focusedErrorBorder: _createBorder(AppColors.primaryRed),
    );

    /// 手机号输入框
    final _phoneTextFormField = TextFormField(
      /// 验证器
      validator: (value) {
        RegExp _phoneReg = RegExp(
            r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
        if (value == null || value.isEmpty) {
          return "请输入手机号码";
        } else if (!_phoneReg.hasMatch(value)) {
          return '请输入正确的手机号码';
        } else {
          return null;
        }
      },
      controller: _phoneEditController, // 挂载controller
      focusNode: _phoneFocusNode, // 挂载聚焦节点
      decoration: _decoration.copyWith(
        // 公用样式拓展
        hintText: "请输入您的手机号",
      ),
      keyboardType: TextInputType.phone, // 软键盘类型

      /// 键盘"完成"按钮类型，如这里使用"next"，则软键盘上原本"右下角"的按钮会显示"下一步"
      textInputAction: TextInputAction.next,

      onEditingComplete: _pwdFocusNode.nextFocus, // 点击"完成"按钮会执行的callback
    );

    /// 密码输入框
    final _pwdTextFormField = TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return "密码不能为空";
        } else if (value.length < 6) {
          return "密码长度必须大于6位";
        } else {
          return null;
        }
      },
      controller: _pwdEditController,
      focusNode: _pwdFocusNode,
      decoration: _decoration.copyWith(
        // 公用样式拓展
        hintText: '请输入您的密码',
      ),
      obscureText: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onEditingComplete: _onSubmit,
    );

    /// "登录"按钮
    final _sumbitButton = MaterialButton(
      child: Text(
        '登录',
        style: TextStyle(
          color: AppColors.white,
          fontSize: ScreenAdapter.fontSize(17.0),
        ),
      ),
      onPressed: _canLogin ? _onSubmit : null,
      color: AppColors.primaryRed,
      disabledColor: AppColors.disabledRed,
      minWidth: double.infinity,
      height: ScreenAdapter.height(47.5),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenAdapter.width(22.0),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(
        title: Text('登录'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenAdapter.width(12.0),
              vertical: ScreenAdapter.height(30.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Images.login_logo,
                  fit: BoxFit.fitWidth,
                  width: ScreenAdapter.width(128.0),
                ),
                SizedBox(
                  height: ScreenAdapter.height(32.0),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _phoneTextFormField,
                      SizedBox(
                        height: ScreenAdapter.height(5.0),
                      ),
                      _pwdTextFormField,
                      SizedBox(
                        height: ScreenAdapter.height(38.0),
                      ),
                      _sumbitButton,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
