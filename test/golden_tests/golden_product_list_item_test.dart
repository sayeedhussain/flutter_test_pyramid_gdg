import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/widgets/product_list_item.dart';

import '../builders/product_builder.dart';
import '../features/product_list/mocks/mock_cart_repository.dart';
import '../test_utils/network_image_test_utils.dart';

void main() {
  testWidgets('Golden test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final products = getProductsFromJson(
          '[{\"upc\":\"0003\",\"name\":\"Apple iPhone 7\",\"price\":\"\$1,099.99\",\"commentsCount\":2,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"}]');

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: ProductListItem(
                  product: products[0],
                  cartRepository: MockCartRepository()))));

      await expectLater(find.byType(MaterialApp),
          matchesGoldenFile('golden_product_list_item.png'),
          skip: !Platform.isMacOS);
      //The skip parameter is used to skip the test if the platform the test is being run on is not Windows.
      //The reason for skipping the test when on a different platform is because images created by different platforms are different.
      //So the test will fail if the golden image was created on Windows and the test is run on Linux and vice versa.
      //If you are on a Linux machine, use skip: !Platform.isLinux instead.*/
    });
  });
}
