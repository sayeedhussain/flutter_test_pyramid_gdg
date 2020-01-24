import 'package:flutter/material.dart';

class ProductListItemImageView extends StatelessWidget {
  const ProductListItemImageView({this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40, height: 40, child: Image.network(url, fit: BoxFit.fill));
  }
}
