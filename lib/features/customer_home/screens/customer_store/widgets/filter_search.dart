import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(1000),
          ),
          height: 60.h,
          width: 180.w,
          // Add more widgets/content here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search',
                style: textStyles.bold24Gray,
              ),
              SizedBox(width: 10.w),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: colorManager.primary),
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/svgs/options.svg',
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.SupplierHomeScreen);
          },
          child: Container(
              alignment: Alignment.center,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              height: 150,
              child: Text(
                'Do you Want\nTo Have Your\nOwn Store',
                textAlign: TextAlign.center,
                style: textStyles.reqular24Black
                    .copyWith(fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }
}
