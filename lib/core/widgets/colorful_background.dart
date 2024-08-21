import 'package:flutter/material.dart';
import 'package:sun_shop/core/theme/color_manager.dart';

class ColorfulBackground extends StatelessWidget {
  Widget? child;
  ColorfulBackground({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(colors:[
            colorManager.primary,Colors.white
          ],begin:Alignment.bottomLeft, end: Alignment(1.0, 1.1) )
        ),
        height: double.infinity,
        width: double.infinity,
        child: child);
  }
}