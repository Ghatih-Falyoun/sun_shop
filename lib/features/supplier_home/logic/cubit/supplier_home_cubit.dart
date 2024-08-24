import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sun_shop/core/network/athoun_servec.dart';
import 'package:sun_shop/features/supplier_home/logic/cubit/supplier_home_state.dart';
import 'package:sun_shop/features/supplier_home/screens/my_store/data/my_store_firebase_service.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/service/upload_service_firebase.dart';

class SupplierHomeCubit extends Cubit<SupplierHomeState> {
  SupplierHomeCubit() : super(SupplierHomeState.initial());

  //upload section
  TextEditingController nameTextEditor = TextEditingController();
  TextEditingController descriptionTextEditor = TextEditingController();
  TextEditingController categoryTextEditor = TextEditingController();
  TextEditingController priceTextEditor = TextEditingController();
  TextEditingController stockTextEditor = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<void> addProduct() async {
    Product product = Product(
        name: nameTextEditor.text,
        category: categoryTextEditor.text,
        description: descriptionTextEditor.text,
        url: '',
        price: int.parse(priceTextEditor.text.toString()).toDouble(),
        stock: int.parse(stockTextEditor.text.toString()),
        supplierid: '23dsaf');
    await UploadServiceFirebase.addProductUpdateWishlistInSupplier(product);
  }

  void loadProductScreen() async {
    List<Product> products = await MyStoreFirebaseService.getAllProducts();
    emit(SupplierHomeState.MyStoreLoaded(products));
  }

  void loadProfileScreen() async {
    User? user = FirebaseAuth.instance.currentUser;
    emit(SupplierHomeState.ProfileLoaded(user!));
  }
}
