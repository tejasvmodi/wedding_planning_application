
import 'package:flutter/material.dart';

class PersistantHeader extends SliverPersistentHeaderDelegate{
  
  final Widget child;

  PersistantHeader({required this.child});


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

   return Container(
    color: Colors.white,
     height: 50,
     child: child,
    
   );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
   return true;
  }

}