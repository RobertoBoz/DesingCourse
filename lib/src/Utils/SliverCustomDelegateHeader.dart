import 'package:flutter/material.dart';



class SliverCustomDelegateHeader extends SliverPersistentHeaderDelegate{

  final double minheight;
  final double maxheight;
  final Widget child;

  SliverCustomDelegateHeader({@required this.minheight, @required this.maxheight,  @required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {  
    return SizedBox.expand(child:child);
  }

  @override  
  double get maxExtent => (minheight > maxheight) ? minheight: maxheight;

  @override
  double get minExtent => (minheight < maxheight) ? minheight: maxheight;

  @override
  bool shouldRebuild(SliverCustomDelegateHeader oldDelegate) { 
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child != oldDelegate.child;
  }
}



