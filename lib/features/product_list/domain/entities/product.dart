import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  const Product(
      {@required this.upc,
      @required this.name,
      @required this.price,
      @required this.commentsCount,
      @required this.image});

  final String upc;
  final String name;
  final String price;
  final int commentsCount;
  final String image;

  @override
  List<Object> get props => [upc];
}
