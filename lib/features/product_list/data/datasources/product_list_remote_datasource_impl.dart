import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/error/exception.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';

class ProductListRemoteDataSourceImpl implements ProductListRemoteDataSource {
  ProductListRemoteDataSourceImpl({@required HttpClient httpClient})
      : assert(httpClient != null),
        _httpClient = httpClient;
  final HttpClient _httpClient;

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _httpClient
        .get('http://www.mocky.io/v2/5e01d1cb2f00008000dcd310');

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw APIException();
    }

    return productsFromJson(json.decode(response.body));
  }
}
