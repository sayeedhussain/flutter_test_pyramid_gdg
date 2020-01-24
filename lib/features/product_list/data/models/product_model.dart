import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter/material.dart';

List<ProductModel> productsFromJson(List<dynamic> jsonItem) =>
    List<ProductModel>.from(jsonItem.map((x) => ProductModel.fromJson(x)));

class ProductModel extends Product {
  const ProductModel(
      {@required String upc,
      @required String name,
      @required String price,
      @required int commentsCount,
      @required String image})
      : super(
            upc: upc,
            name: name,
            price: price,
            commentsCount: commentsCount,
            image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        upc: json['upc'],
        name: json['name'],
        price: json['price'],
        commentsCount: json['commentsCount'],
        image: json['image']);
  }
}
