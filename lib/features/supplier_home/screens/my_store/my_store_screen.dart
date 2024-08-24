import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/widgets/product_item.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_cubit.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_state.dart';

class MyStoreScreen extends StatefulWidget {
  const MyStoreScreen({super.key});

  @override
  State<MyStoreScreen> createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen> {
  @override
  void initState() {
    context.read<SupplierHomeCubit>().loadProductScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<SupplierHomeCubit, SupplierHomeState>(
          buildWhen: (previous, current) =>
              current is UploadLoading || current is myStoreLoaded,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return SizedBox.shrink();
              },
              MyStoreLoaded: (products) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 313, crossAxisCount: 2),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [ProductItem(products[index],onPressed: () {
                          
                        },)],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
