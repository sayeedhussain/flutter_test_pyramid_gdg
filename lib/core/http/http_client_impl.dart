import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_pyramid_spike/core/http/http_client.dart';
import 'package:http/http.dart';

class HttpClientImpl implements HttpClient {
  HttpClientImpl({@required this.client});
  final http.Client client;

  @override
  Future<Response> get(String url, {Map<String, String> headers}) async {
    final response = await client.get(url, headers: headers);
    return response;
  }
}
