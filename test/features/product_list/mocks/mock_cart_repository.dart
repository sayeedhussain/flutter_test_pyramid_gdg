import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

class MockCartRepository implements CartRepository {
  int _quantity = 0;

  @override
  int getQuantity(Product product) {
    return _quantity;
  }

  @override
  void setQuantity(Product product, int quantity) {
    _quantity = quantity;
  }

  @override
  List<CartItem> getCartItems() {
    return [];
  }
}
