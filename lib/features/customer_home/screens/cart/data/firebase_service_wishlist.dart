import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sun_shop/features/customer_home/screens/cart/data/model/response_product.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class FirebaseServiceWishlist {
  double price = 0;
  User? user = FirebaseAuth.instance.currentUser;
  Future<List<ResponseProduct>> getAllProduct() async {
    price = 0;
    List<ResponseProduct> products = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get all data in cart
    final response = await firestore
        .collection('customer')
        .doc(user?.uid)
        .collection('cart')
        .get();

    // Use a traditional for loop so you can await inside the loop
    for (var element in response.docs) {
      String productId = element.data()['productId'] as String;
      int count = element.data()['count'] as int;

      // Looking for the product by the id
      final productResponse =
          await firestore.collection('product').doc(productId).get();

      // Making the response that came from Firestore to data
      Product product = Product.fromMap(productResponse.data()!);
      price += count * product.price;
      // Add the response to the products list
      products.add(ResponseProduct(count: count, product: product));
    }

    // Print the final list of products

    return products;
  }

  void deleteTheItemFromWishlist(String ProductId) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('customer')
        .doc(user?.uid)
        .collection('cart')
        .doc(ProductId)
        .delete();
  }
}
