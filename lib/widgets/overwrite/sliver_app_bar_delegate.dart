import 'dart:math';

import 'package:flutter/material.dart';

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  MySliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => max(maxHeight, minHeight);

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxHeight
      || minHeight != oldDelegate.minHeight
      || child != oldDelegate.child;
  }
}