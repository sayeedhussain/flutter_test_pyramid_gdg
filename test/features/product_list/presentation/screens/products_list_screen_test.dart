import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/screens/products_list_screen.dart';

import '../../mocks/mock_products_list_bloc.dart';

void main() {
  testWidgets(
      'ProductListScreen shows loading indicator when ProductListState is Loading',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: ProductsListScreen(bloc: MockProductsListBloc()))));
      //pump the widget after some milliseconds so that loader is onscreen
      await Future.delayed(
          const Duration(milliseconds: 10), () => tester.pump());
      //assert the presence of CircularProgressIndicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
