import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class ProductItem extends StatelessWidget {
  Product product;
  VoidCallback onPressed;
  ProductItem(this.product, {required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0).w,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        height: product.price == 0 ? 200.h : 300.h,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0.h, right: 15.0.h, top: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                textAlign: TextAlign.left,
                style: textStyles.reqular16Black
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Image.asset(
                  'assets/images/bag.png',
                  width: 112.w,
                  height: 112.h,
                ),
              ),
              //SizedBox(height: 5.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: textStyles.reqular24Black
                        .copyWith(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
