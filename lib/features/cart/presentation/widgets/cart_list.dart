import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({@required List<CartItem> cartItems})
      : assert(cartItems != null),
        _cartItems = cartItems;
  final List<CartItem> _cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CartListItem(cartItem: _cartItems[index]);
      },
    );
  }
}
