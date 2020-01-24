import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(
      {@required List<Product> products,
      @required CartRepository cartRepository})
      : assert(products != null),
        assert(cartRepository != null),
        _products = products,
        _cartRepository = cartRepository;
  final List<Product> _products;
  final CartRepository _cartRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductListItem(
          product: _products[index],
          cartRepository: _cartRepository,
        );
      },
    );
  }
}
