import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class FirebaseCloudServiceStoreHome {
  static Future<List<Product>> getRandomProducts() async {
    CollectionReference productsmap =
        FirebaseFirestore.instance.collection('product');

    try {
      // Fetch a limited number of products (e.g., 10)
      QuerySnapshot querySnapshot = await productsmap.limit(10).get();
      // Convert the querySnapshot to a list of product data
      List<Map<String, dynamic>> productList = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      // Shuffle the list to simulate random selection
      productList.shuffle(Random());
      List<Product> products = [];
      productList.forEach(
        (product) {
          products.add(Product.fromMap(product));
        },
      );
      return products;
    } catch (e) {
      print("Failed to fetch products: $e");
      return [];
    }
  }

  static void ifExistDecreasIfNotADD(String productId) async {
    User? user = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      bool isExist =
          await isTheProductExistAndUpdate(firestore, user, productId);
      if (!isExist) {
        await firestore
            .collection('customer')
            .doc(user?.uid)
            .collection('cart')
            .doc(productId) // Custom doc ID for the product
            .set({'count': 1, 'productId': productId});
      }

      print('Product added to cart successfully.');
    } catch (e) {
      print('Failed to add product to cart: $e');
    }
  }

  static Future<bool> isTheProductExistAndUpdate(
      FirebaseFirestore firestore, User? user, String productId) async {
    final response = await firestore
        .collection('customer')
        .doc(user?.uid)
        .collection('cart')
        .doc(productId)
        .get();
    print(response.data());
    if (response.data() == null) {
      return false;
    } else {
      IncreaseTheDataOne(
        productId,
        response.data()?['count'] as int,
      );
      return true;
    }
  }

  static void IncreaseTheDataOne(String productId, int data) async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection('customer')
        .doc(user?.uid)
        .collection('cart')
        .doc(productId)
        .update({'count': data + 1});
  }
}
