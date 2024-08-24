import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUiDesing extends StatelessWidget {
  HomeUiDesing({required this.child,super.key});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/images/home_ui.png'),
      Positioned(
          bottom: 0,
          right: 0,
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: Image.asset('assets/images/home_ui.png'))),
      SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 20.0.w, right: 24.h, left: 24.h),
              child: child))
    ]);
  }
}
