import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class UploadServiceFirebase {
  static Future<void> addProductUpdateWishlistInSupplier(
      Product product) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;

    try {
      CollectionReference products =
          FirebaseFirestore.instance.collection('product');
      // Add the product to the 'products' collection and capture the DocumentReference
      product.supplierid = user!.uid;
      DocumentReference productRef =
          await products.add(product.toMapWithoutId());

      // Get the auto-generated product ID
      String productId = productRef.path;

      productRef.update({
        'productId': productRef.id}
      );

      //Get the user place to add the product to the customer
      CollectionReference users =
          FirebaseFirestore.instance.collection('supplier');
      DocumentReference userRef = users.doc(user.uid);

      // Example of adding the productId to the store list
      await userRef.update({
        'products': FieldValue.arrayUnion([productRef])
      });

      print(
          "Product added successfully with ID: $productId and added to store list");
    } catch (e) {
      // Handle any errors that occur during the add operation
      print("Failed to add product or store list: $e");
    }
  }
}
