import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/customer_home/screens/cart/data/model/response_product.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/increase_or_decrease_and_price.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/product_image_name_price.dart';
import 'package:sun_shop/features/customer_home/screens/cart/widgets/save_for_later_delete.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class ProdductInCash extends StatefulWidget {
  ValueSetter<Product> increaseItem;
  ResponseProduct product;
  ProdductInCash(this.product, {required this.increaseItem,super.key});

  @override
  State<ProdductInCash> createState() => _ProdductInCashState();
}

class _ProdductInCashState extends State<ProdductInCash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageNamePrice(price: widget.product.product.price,productName: widget.product.product.name,),
        Divider(color: Colors.black, thickness: 1),
        IncreaseOrDecreaseAndPrice(widget.product.count,price: widget.product.product.price,increaseItem: () => widget.increaseItem(widget.product.product),),
        const Divider(color: Colors.black, thickness: 1),
        SaveForLaterDelete(onPresed: () {
                          context.read<HomeCubit>().deleteTheItemFromWishlist(widget.product.product.productId!);

        },)
      ],
    );
  }
}
