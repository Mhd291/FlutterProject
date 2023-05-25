// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.products,
  });

  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.userId,
    this.price,
    this.description,
    this.expDate,
    this.quantity,
    this.imgName,
    this.imgPath,
    this.categoryId,
    this.region,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? userId;
  int? price;
  String? description;
  String? expDate;
  int? quantity;
  String? imgName;
  String? imgPath;
  int? categoryId;
  String? region;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    price: json["price"],
    description: json["description"],
    expDate: json["exp_date"],
    quantity: json["quantity"],
    imgName: json["img_name"],
    imgPath: json["img_path"],
    categoryId: json["category_id"],
    region: json["region"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "price": price,
    "description": description,
    "exp_date": expDate,
    "quantity": quantity,
    "img_name": imgName,
    "img_path": imgPath,
    "category_id": categoryId,
    "region": region,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
