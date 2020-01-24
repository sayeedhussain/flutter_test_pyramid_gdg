import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item_imageview.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem(
      {@required Product product, @required CartRepository cartRepository})
      : assert(product != null),
        assert(cartRepository != null),
        _product = product,
        _cartRepository = cartRepository;
  final Product _product;
  final CartRepository _cartRepository;

  static const keyName = 'Name';
  static const keyPrice = 'Price';
  static const keyQuantity = 'Quantity';
  static const keyRemove = 'Remove';
  static const keyAdd = 'Add';

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  int _itemQuantity() => widget._cartRepository.getQuantity(widget._product);
  void _incrementQuantity() =>
      widget._cartRepository.setQuantity(widget._product, _itemQuantity() + 1);
  void _decrementQuantity() =>
      widget._cartRepository.setQuantity(widget._product, _itemQuantity() - 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Column(children: <Widget>[
          const Divider(height: 5.0),
          ListTile(
            title: Text(
              '${widget._product.name}',
              key: const Key(ProductListItem.keyName),
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text('${widget._product.price}',
                    key: const Key(ProductListItem.keyPrice),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepOrangeAccent,
                      fontStyle: FontStyle.italic,
                    ))),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              IconButton(
                key: const Key(ProductListItem.keyRemove),
                icon: Icon(Icons.remove),
                onPressed: () => setState(
                    () => _itemQuantity() > 0 ? _decrementQuantity() : null),
              ),
              Text(_itemQuantity().toString(),
                  key: const Key(ProductListItem.keyQuantity)),
              IconButton(
                  key: const Key(ProductListItem.keyAdd),
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => _incrementQuantity()))
            ]),
            leading: Column(
              children: <Widget>[
                ProductListItemImageView(url: widget._product.image)
              ],
            ),
          )
        ]));
  }
}
