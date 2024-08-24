import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';

class SaveForLaterDelete extends StatelessWidget {
  VoidCallback onPresed;
  SaveForLaterDelete({required this.onPresed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              //function to save the delete the item from wishlist and add it to favorite
            },
            child: Container(
              child: Text(
                'Save for later',
                style: textStyles.reqular16blue
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                //delete the item from wishlist
                onPresed();
              },
              icon: Icon(
                Icons.delete_outline,
                color: Color(
                  0xff2D4A98,
                ),
                size: 30,
              ))
        ],
      ),
    );
  }
}
