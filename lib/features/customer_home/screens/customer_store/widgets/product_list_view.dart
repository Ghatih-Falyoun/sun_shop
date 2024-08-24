import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/filter_search.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/product_item.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class ProductListView extends StatelessWidget {
  List<Product> products;

  ProductListView(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    int customIndex = 0;
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 230,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == 1) {
            return FilterSearch();
          } else {
            int inde = customIndex;
            customIndex++;
            return ProductItem(products[inde],onPressed: () {
             context
                          .read<HomeCubit>()
                          .addTheItemToWishlist(products[inde].productId ?? '');
            },);
          }
        },
      ),
    );
  }
}
