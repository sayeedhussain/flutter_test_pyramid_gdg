import 'package:flutter_test_pyramid_spike/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test(
      'SHOULD return empty cart items WHILE acessing the cart items without adding the product', () async {
    final cartRepositoryImpl = CartRepositoryImpl();

    expect(cartRepositoryImpl.getCartItems().length, 0);
  });

}

