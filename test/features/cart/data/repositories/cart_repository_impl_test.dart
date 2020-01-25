import 'package:flutter_test_pyramid_spike/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';
import 'package:test/test.dart';

void main() {
  test(
      'SHOULD return empty cart items WHILE acessing the cart items without adding the product', () async {
    final cartRepositoryImpl = CartRepositoryImpl();

    expect(cartRepositoryImpl.getCartItems().length, 0);
  });

  test(
      'GIVEN a product, THEN return the cart quanity as zero WHEN the product is not available in the cart', () async {
    final cartRepositoryImpl = CartRepositoryImpl();

    expect(cartRepositoryImpl.getQuantity(getProduct()), 0);
  });

  test(
      'GIVEN a product, THEN return the valid cart quantity WHEN the product is the initial add', () async {
    final cartRepositoryImpl = CartRepositoryImpl();

    final product = getProduct();

    cartRepositoryImpl.setQuantity(product, 1);

    expect(cartRepositoryImpl.getQuantity(product), 1);
  });

  test(
      'GIVEN a product, THEN return the latest cart quantity WHEN the product is added for the multiple times', () async {
    final cartRepositoryImpl = CartRepositoryImpl();

    final product = getProduct();

    cartRepositoryImpl.setQuantity(product, 1);
    cartRepositoryImpl.setQuantity(product, 5);
    cartRepositoryImpl.setQuantity(product, 7);

    expect(cartRepositoryImpl.getQuantity(product), 7);
  });
}

  Product getProduct({String upc = 'upc', String name = 'name', String price = 'price', int commentsCount = 0,
    String image = 'image'}) => Product(upc: upc, name: name, price: price, commentsCount: commentsCount, image: image);

