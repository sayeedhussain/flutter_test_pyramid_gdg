import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/core/error/exception.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  test('calls HttpClient and gets response', () async {
    const url = 'http://www.mocky.io/v2/5e01d1cb2f00008000dcd310';
    const responseJSON =
        '[{\"upc\":\"0001\",\"name\":\"Simple Mobile - Apple iPhone 11 Pro Max (64GB) - Silver\",\"price\":\"\$1,099.99\",\"commentsCount\":10,\"image\":\"https:\/\/m.media-amazon.com\/images\/I\/81hA4nb-+qL._AC_UY436_QL65_ML3_.jpg\"}]';
    final mockClient = MockHttpClient();

    when(mockClient.get(url))
        .thenAnswer((_) async => http.Response(responseJSON, 200));

    final dataSource = ProductListRemoteDataSourceImpl(httpClient: mockClient);
    final List<ProductModel> products = await dataSource.getProducts();

    verify(mockClient.get(url));
    expect(products, isInstanceOf<List<ProductModel>>());
  });

  test('throws an exception if the http call completes with an error', () {
    const url = 'http://www.mocky.io/v2/5e01d1cb2f00008000dcd310';
    final mockClient = MockHttpClient();

    when(mockClient.get(url))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    final dataSource = ProductListRemoteDataSourceImpl(httpClient: mockClient);

    expect(dataSource.getProducts(), throwsA(isInstanceOf<APIException>()));
  });
}
