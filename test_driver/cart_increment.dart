import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test_pyramid_spike/main.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../test/core/mocks/mock_http_client.dart';
import '../test/mocks/mock_injection_container.dart' as di;

MockHttpClient client = MockHttpClient();

void registerMockResponse() {
  when(client.get('http://www.mocky.io/v2/5e01d1cb2f00008000dcd310'))
      .thenAnswer((_) async => Response(
          '[{\"upc\":\"1\",\"name\":\"Android One Power\",\"price\":\"\$138.00\",\"commentsCount\":10,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/31UU-oejIwL._AC_UY400_QL65_ML3_.jpg\"}]',
          200));
}

void main() {
  enableFlutterDriverExtension();
  registerMockResponse();
  final serviceLocator = GetIt();
  di.init(serviceLocater: serviceLocator, mockClient: client);
  runApp(MyApp(serviceLocator));
}
