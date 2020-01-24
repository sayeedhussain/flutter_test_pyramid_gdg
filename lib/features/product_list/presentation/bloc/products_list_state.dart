import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  ProductsListLoaded(this.products);
  final List<Product> products;
}

class ProductsListError extends ProductsListState {
  ProductsListError(this.message);
  final String message;
}
