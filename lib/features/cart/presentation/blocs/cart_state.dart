import 'package:flutter_test_pyramid_spike/features/cart/domain/entities/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartLoaded(this.cartItems);
  final List<CartItem> cartItems;
}

class CartError extends CartState {
  CartError(this.message);
  final String message;
}
