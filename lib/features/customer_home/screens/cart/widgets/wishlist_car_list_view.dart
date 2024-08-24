import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/screens/cart/data/model/response_product.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/prodduct_in_cash.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class WishlistCarListView extends StatefulWidget {
  List<ResponseProduct> products;
  WishlistCarListView({required this.products, super.key});

  @override
  State<WishlistCarListView> createState() => _WishlistCarListViewState();
}

class _WishlistCarListViewState extends State<WishlistCarListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560,
      width: double.infinity,
      child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final currentProduct = widget.products[index];
            return wishListContainerCart(
                child: ProdductInCash(
              currentProduct,
              increaseItem: (value) {
                context.read<HomeCubit>().updateTheItem(
                    currentProduct.product.productId!, currentProduct.count);
              },
            ));
          }),
    );
  }

  Widget wishListContainerCart({required Widget child}) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h, left: 16.h, bottom: 10, top: 10),
      child: Container(
          height: 270.h,
          width: 400.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 0))
              ],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              color: Colors.white),
          child: Stack(children: [
            Image.asset('assets/images/cartdecoration.png'),
            child
          ])),
    );
  }
}
