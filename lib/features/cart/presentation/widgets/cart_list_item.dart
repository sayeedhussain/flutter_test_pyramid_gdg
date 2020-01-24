import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({@required CartItem cartItem})
      : assert(cartItem != null),
        _cartItem = cartItem;
  final CartItem _cartItem;

  static const keyName = 'Name';
  static const keyQuantity = 'Quantity';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Column(children: <Widget>[
          const Divider(height: 5.0),
          ListTile(
            title: Text(
              '${_cartItem.product.name}',
              key: const Key(CartListItem.keyName),
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('(${_cartItem.quantity.toString()})',
                  key: const Key(CartListItem.keyQuantity),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          )
        ]));
  }
}
