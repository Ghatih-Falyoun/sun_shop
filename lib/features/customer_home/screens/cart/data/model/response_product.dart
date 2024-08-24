// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class ResponseProduct {
  int count;
  Product product;
  ResponseProduct({
    required this.count,
    required this.product,
  });
  

  ResponseProduct copyWith({
    int? count,
    Product? product,
  }) {
    return ResponseProduct(
      count: count ?? this.count,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'product': product.toMap(),
    };
  }

  factory ResponseProduct.fromMapWithOutcount(Map<String, dynamic> map) {
    return ResponseProduct(
      count: map["count"]as int ,
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  //factory ResponseProduct.fromJson(String source) => ResponseProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseProduct(count: $count, product: $product)';

  @override
  bool operator ==(covariant ResponseProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.count == count &&
      other.product == product;
  }

  @override
  int get hashCode => count.hashCode ^ product.hashCode;
}
