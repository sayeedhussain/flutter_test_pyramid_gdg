import 'dart:convert';

import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/entities/product.dart';

List<Product> getProductsFromJson(String jsonStr) =>
    productsFromJson(json.decode(jsonStr));
