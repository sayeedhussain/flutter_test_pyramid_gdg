import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:flutter_driver/src/driver/driver.dart' as finder;

void main() {
  group('cart increment/decrement test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });

    test(
        'Verify product is seen in cart page on quantity increment and removed on quantity == 0',
        () async {
    
      // TODO(Sayeed): 
      // keys used in finder.find.byValueKey are duplicates from the code. We should probably
      // create separate key files per feature to hold these keys to avoid duplicates in actual code and tests.
      // We should use separate key files because we cannot put the keys in ProductListItem.dart 
      // as this FlutterUI class cannot be imported in driver tests.

      //get add button
      final addButton = finder.find.byValueKey('Add');

      //tap add button twice
      await driver.tap(addButton);
      await driver.tap(addButton);

      //switch to cart tab by tapping on tabbar icon
      final cartTab = finder.find.byValueKey('CartTab');
      await driver.tap(cartTab);

      //verify that the product is added
      final productNameText = finder.find.byValueKey('Name');
      expect(await driver.getText(productNameText), 'Android One Power');

      //verify that the quantity is correct
      final quantityText = finder.find.byValueKey('Quantity');
      expect(await driver.getText(quantityText), '(2)');

      //switch to productList tab by tapping on tabbar icon
      final productListTab = finder.find.byValueKey('ProductListTab');
      await driver.tap(productListTab);

      //get remove button
      final removeButton = finder.find.byValueKey('Remove');

      //tap remove button twice
      await driver.tap(removeButton);
      await driver.tap(removeButton);

      //switch to cart tab by tapping on tabbar icon
      await driver.tap(cartTab);

      //verify that no items in cart message is displayed
      final errorText = find.byValueKey('Message');
      expect(await driver.getText(errorText), 'No Items In Cart');

      //switch to productList tab by tapping on tabbar icon
      await driver.tap(productListTab);
    });
  });
}
