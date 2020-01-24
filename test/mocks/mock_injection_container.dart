import 'package:flutter_test_pyramid_spike/core/http/http_client.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client_impl.dart';
import 'package:flutter_test_pyramid_spike/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/repositories/products_list_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/repositories/products_list_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocater;

void init({GetIt serviceLocater, http.Client mockClient}) {
  //Features - ProductList

  //Bloc
  serviceLocater.registerFactory(
    () => ProductsListBloc(repository: serviceLocater()),
  );

  //Repository
  serviceLocater.registerFactory<ProductsListRepository>(
      () => ProductsListRepositoryImpl(remoteDataSource: serviceLocater()));

  //Datasource
  serviceLocater.registerFactory<ProductListRemoteDataSource>(
      () => ProductListRemoteDataSourceImpl(httpClient: serviceLocater()));

  serviceLocater.registerFactory<HttpClient>(
      () => HttpClientImpl(client: serviceLocater()));

  //External
  serviceLocater.registerFactory(() => mockClient);

  //Features - Cart

  //Bloc
  serviceLocater.registerFactory(() => CartBloc(repository: serviceLocater()));

  serviceLocater
      .registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
}
