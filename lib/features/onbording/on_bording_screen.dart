
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/widgets/colorful_background.dart';
import 'package:sun_shop/features/onbording/widgets/get_start.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ColorfulBackground(
        child: 
        SafeArea(
          child: SingleChildScrollView(
            child: Column( 
              children: [
                SizedBox(height: 50.h,),
                Image.asset('assets/images/logo.png',height: 83,),
                SizedBox(height: 50.h,),
                GetStart()
              ],
            ),
          ),
        )
        ,
      ),
    );
  }
}