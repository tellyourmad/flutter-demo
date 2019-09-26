import 'package:app/constants/app_theme.dart';
import 'package:app/utils/screen_adapter.dart';
import 'package:app/widgets/basic/iconfont_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


const double _kLeadingWidth = kToolbarHeight;

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, kToolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({
    Key key,
    this.displayLeading = true,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle = true,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.barBorder = true,
    this.bottomBorder = false
  }) : assert(automaticallyImplyLeading != null),
       assert(elevation == null || elevation >= 0.0),
       assert(primary != null),
       assert(titleSpacing != null),
       assert(toolbarOpacity != null),
       assert(bottomOpacity != null),
       preferredSize = Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
       super(key: key);

  final bool displayLeading;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final bool barBorder;
  final bool bottomBorder;
  @override
  final Size preferredSize;

  bool _getEffectiveCenterTitle(ThemeData themeData) {
    if (centerTitle != null)
      return centerTitle;
    assert(themeData.platform != null);
    switch (themeData.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return actions == null || actions.length < 2;
    }
    return null;
  }

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  static const double _defaultElevation = 4.0;

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton = parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    IconThemeData overallIconTheme = widget.iconTheme
      ?? appBarTheme.iconTheme
      ?? themeData.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme
      ?? appBarTheme.actionsIconTheme
      ?? overallIconTheme;
    TextStyle centerStyle = widget.textTheme?.title
      ?? appBarTheme.textTheme?.title
      ?? themeData.primaryTextTheme.title;
    TextStyle sideStyle = widget.textTheme?.body1
      ?? appBarTheme.textTheme?.body1
      ?? themeData.primaryTextTheme.body1;

    if (widget.toolbarOpacity != 1.0) {
      final double opacity = const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(widget.toolbarOpacity);
      if (centerStyle?.color != null)
        centerStyle = centerStyle.copyWith(color: centerStyle.color.withOpacity(opacity));
      if (sideStyle?.color != null)
        sideStyle = sideStyle.copyWith(color: sideStyle.color.withOpacity(opacity));
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0)
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0)
      );
    }

    Widget leading = widget.leading;
    if(!widget.displayLeading){
      leading = null;
    } else {
      if (leading == null && widget.automaticallyImplyLeading) {
        if (hasDrawer) {
          leading = IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _handleDrawerButton,
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        } else {
          if (canPop)
            if(useCloseButton){
              leading = IconButton(
                iconSize: Theme.of(context).appBarTheme.iconTheme.size,
                icon: const Icon(IconFonts.close),
                onPressed: (){
                  Navigator.maybePop(context);
                }
              );
            } else{
              leading = IconButton(
                iconSize: Theme.of(context).appBarTheme.iconTheme.size,
                icon: const Icon(IconFonts.go_back),
                onPressed: (){
                  Navigator.maybePop(context);
                }
              );
            }
        }
      }
      if (leading != null) {
        leading = ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
          child: leading,
        );
      }
    }

    Widget title = widget.title;
    if (title != null) {
      bool namesRoute;
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
           namesRoute = true;
           break;
        case TargetPlatform.iOS:
          break;
      }
      title = DefaultTextStyle(
        style: centerStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: Semantics(
          namesRoute: namesRoute,
          child: title,
          header: true,
        ),
      );
    }

    Widget actions;
    if (widget.actions != null && widget.actions.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.actions,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    // Allow the trailing actions to have their own theme if necessary.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(themeData),
      middleSpacing: widget.titleSpacing,
    );

    // If the toolbar is allocated less than kToolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle,
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    width: widget.barBorder ? ScreenAdapter.borderWidth() : 0,
                    color: AppColors.greyF3
                  )
                )
              ),
              child: toolbar,
            ),
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          widget.bottomOpacity == 1.0 ? widget.bottom : Opacity(
            opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(widget.bottomOpacity),
            child: widget.bottom,
          ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.flexibleSpace,
          appBar,
        ],
      );
    }
    final Brightness brightness = widget.brightness
      ?? appBarTheme.brightness
      ?? themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
      ? SystemUiOverlayStyle.light
      : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.backgroundColor
            ?? appBarTheme.color
            ?? themeData.primaryColor,
          elevation: widget.elevation
            ?? appBarTheme.elevation
            ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    width: !widget.barBorder && widget.bottom != null && widget.bottomBorder ? ScreenAdapter.borderWidth() : 0,
                    color: AppColors.greyF3
                  )
                )
              ),
              child: appBar,
            ),
          ),
        ),
      ),
    );
  }
}