// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String? productId;
  String name;
  String category;
  String description;
  String url;
  double price;
  int stock;
  String supplierid;
  Product({
    this.productId,
    required this.name,
    required this.category,
    required this.description,
    required this.url,
    required this.price,
    required this.stock,
    required this.supplierid,
  });

  Product copyWith({
    String? productId,
    String? name,
    String? category,
    String? description,
    String? url,
    double? price,
    int? stock,
    String? supplierid,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      url: url ?? this.url,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      supplierid: supplierid ?? this.supplierid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'category': category,
      'description': description,
      'url': url,
      'price': price,
      'stock': stock,
      'supplierid': supplierid,
    };
  }
  Map<String, dynamic> toMapWithoutId() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'description': description,
      'url': url,
      'price': price,
      'stock': stock,
      'supplierid': supplierid,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] != null ? map['productId'] as String : null,
      name: map['name'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      price: map['price'] as double,
      stock: map['stock'] as int,
      supplierid: map['supplierid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productId: $productId, name: $name, category: $category, description: $description, url: $url, price: $price, stock: $stock, supplierid: $supplierid)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.productId == productId &&
      other.name == name &&
      other.category == category &&
      other.description == description &&
      other.url == url &&
      other.price == price &&
      other.stock == stock &&
      other.supplierid == supplierid;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      name.hashCode ^
      category.hashCode ^
      description.hashCode ^
      url.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      supplierid.hashCode;
  }
}
