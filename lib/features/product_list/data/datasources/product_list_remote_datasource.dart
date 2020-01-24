import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';

abstract class ProductListRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}
