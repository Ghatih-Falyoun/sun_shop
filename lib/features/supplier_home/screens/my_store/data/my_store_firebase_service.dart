import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class MyStoreFirebaseService {
  static Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    final response =
        await firebaseFirestore.collection('supplier').doc(user!.uid).get();
    //String ProductRefrence = response.data()?['products'] as String;
    ProductUser productUser =
        ProductUser.fromJson(response.data() as Map<String, dynamic>);
    List<DocumentReference> productRefrences = productUser.products;
    for (int i = 0; i < productRefrences.length; i++) {
      final respons = await productRefrences[i].get();
      products.add(Product.fromMap(respons.data() as Map<String, dynamic>));
    }

    return products;
  }
}

class ProductUser {
  String name;
  String email;
  List<DocumentReference> products;

  ProductUser({
    required this.name,
    required this.email,
    required this.products,
  });

  // Factory method to create an instance from JSON
  factory ProductUser.fromJson(Map<String, dynamic> json) {
    return ProductUser(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      products: (json['products'] as List)
          .map((productRef) => productRef as DocumentReference)
          .toList(),
    );
  }

  // Method to convert the class instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'products': products,
    };
  }
}
