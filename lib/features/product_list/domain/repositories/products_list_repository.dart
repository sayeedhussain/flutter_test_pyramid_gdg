import 'package:dartz/dartz.dart';
import 'package:flutter_test_pyramid_spike/core/error/error.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

abstract class ProductsListRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
