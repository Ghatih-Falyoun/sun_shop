import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class GoogleAndFacbook extends StatelessWidget {
  const GoogleAndFacbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.h),
      child: Row(
        children: [
          brandCard(
              'assets/images/google.png', 'Google', textStyles.reqular24Black.copyWith(fontSize: 19)),
              SizedBox(width: 10.w,),
          Expanded(
            child: brandCard(
                'assets/images/facebook.png', 'Facebook', textStyles.reqular24Black.copyWith(fontSize: 19,color: Colors.blue)),
          )    
        ],
      ),
    );
  }

  Widget brandCard(String photoUrl, String companyName, TextStyle textStyle) {
    return 
    // Container(
    //   height: 65.h,
    //   width: 180.w,
    //   decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(14)),
    //       border: Border.all(
    //         color: colorManager.gray,
    //       )),
    ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14)),),
      side: BorderSide(color: colorManager.gray),
      minimumSize: Size(180.w, 65.h),
      backgroundColor: Colors.white
    )
    ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            photoUrl,
            width: 43.w,
            height: 43.h,
          ),
         
          Text(
            companyName,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
