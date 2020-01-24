import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

class CartRepositoryImpl implements CartRepository {
  factory CartRepositoryImpl() {
    return _shared;
  }
  CartRepositoryImpl._internal();
  static final CartRepositoryImpl _shared = CartRepositoryImpl._internal();

  final List<CartItem> _cartItems = [];

  @override
  int getQuantity(Product product) {
    final cartItem = _cartItemForProduct(product);
    return cartItem != null ? cartItem.quantity : 0;
  }

  @override
  void setQuantity(Product product, int quantity) {
    final itemIndex = _itemIndex(product);
    if (itemIndex == -1) {
      _cartItems.add(CartItem(product: product, quantity: 1));
    } else if (quantity == 0) {
      _cartItems.removeAt(itemIndex);
    } else {
      final item = _cartItems[itemIndex];
      item.quantity = quantity;
      _cartItems[itemIndex] = item;
    }
  }

  int _itemIndex(Product product) {
    return _cartItems.indexWhere((cartItem) => cartItem.product == product);
  }

  CartItem _cartItemForProduct(Product product) {
    return _cartItems.firstWhere((cartItem) => cartItem.product == product,
        orElse: () => null);
  }

  @override
  List<CartItem> getCartItems() => _cartItems;
}
