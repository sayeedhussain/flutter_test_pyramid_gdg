import 'package:dartz/dartz.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/repositories/products_list_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/mock_products_list_remote_data_source.dart';

void main() {

  MockProductsListRemoteDataSource mockProductsRemoteDataSource;

  setUp(() {
    mockProductsRemoteDataSource = MockProductsListRemoteDataSource();
  });

  test('SHOULD fetch the producs WHEN the api call is success', () async {
    final productListRepository = ProductsListRepositoryImpl(remoteDataSource: mockProductsRemoteDataSource);

    final productModels = [(getProductModel())];

    when(mockProductsRemoteDataSource.getProducts()).thenAnswer((_) async => productModels);

    final actualProducts = await productListRepository.getProducts();
    expect(actualProducts, equals(Right(productModels)));
  });
}

ProductModel getProductModel({String upc = 'upc', String name = 'name', String price = 'price', int commentsCount = 0,
  String image = 'image'}) => ProductModel(upc: upc, name: name, price: price, commentsCount: commentsCount, image: image);

