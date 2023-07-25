// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String demand;
  final bool inCart;
  final bool favorit;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.demand,
    required this.inCart,
    required this.favorit,
    required this.imageUrl,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? category,
    String? demand,
    bool? inCart,
    bool? favorit,
    String? imageUrl,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        category: category ?? this.category,
        demand: demand ?? this.demand,
        inCart: inCart ?? this.inCart,
        favorit: favorit ?? this.favorit,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        demand: json["demand "],
        inCart: json["inCart"],
        favorit: json["favorit"],
        imageUrl: json["imageUrl"],
      );

  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Product(
      id: doc.id,
      name: data["name"],
      price: data["price"]?.toDouble(),
      category: data["category"],
      demand: data["demand"],
      inCart: data["inCart"],
      favorit: data["favorit"],
      imageUrl: data["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category": category,
        "demand ": demand,
        "inCart": inCart,
        "favorit": favorit,
        "imageUrl": imageUrl,
      };
}
