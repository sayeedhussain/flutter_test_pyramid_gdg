
# flutter_test_pyramid_spike

This project attempts to setup the test pyramid for a flutter app. The app has been layered as prescribed by ResoCoder blog https://resocoder.com/category/tutorials/flutter/tdd-clean-architecture/.

## Running the project (VSCode)
	
- Configure both Android emulator, iOS simulator. https://stackoverflow.com/questions/49280884/how-to-set-up-devices-for-vs-code-for-a-flutter-emulator
- Command: F5
- You can choose if you want to run on emulator or simulator. Recommended that we test on both.

## Running unit + widget + golden tests
	
From project root (flutter_test_pyramid_spike) run `flutter test` in Terminal

## Running Integration tests

From project root (flutter_test_pyramid_spike) run `flutter drive --target=test_driver/cart_increment.dart` in Terminal

## Types of tests added

- Introduction: https://flutter.dev/docs/testing

- Unit tests: We have used Mockito for mocking. 
	- https://flutter.dev/docs/cookbook/testing/unit/mocking
	- https://pub.dev/packages/mockito		

- Widget tests: UI tests similar to Roboelectric. Doesn't require the emulator/simulator to be launched. 
	- https://www.youtube.com/watch?v=nuMqDNUb7f0
	- https://flutter.dev/docs/cookbook/testing/widget/introduction
	- https://flutter.dev/docs/cookbook/testing/widget/tap-drag
	- https://flutter.dev/docs/cookbook/testing/widget/finders

- Integration tests: Functional tests that cover broader flows. Runs as a separate process from the app and talks to the app with the help of a driver
	- https://blog.codemagic.io/integration-tests-codemagic/
	- https://cogitas.net/write-integration-test-flutter/

- Golden tests: UI Snapshot testing for pixel by pixel comparison.
	- https://medium.com/flutter-community/flutter-golden-tests-compare-widgets-with-snapshots-27f83f266cea
	- https://medium.com/flutter-community/testing-custompaint-widgets-in-flutter-using-golden-image-files-889fe3bdf9ca

- Commands: To run various tests see above

## Dependencies 
	
All dependencies must be specified in pubspec.yaml

- App Dependencies
	- dartz: ^0.8.7: For using Either data type for functional style error/repsonse handling
	- http: ^0.12.0+2: For http calls
	- flutter_bloc: ^0.22.1: For adopting the BLoc design pattern (see link below). 
	- equatable: ^0.6.0: So that we don't have to define equatability. Avoiding boilerplate.
	- get_it: ^1.0.3: For dependency injection

- Test Dependencies
	- mockito: ^4.0.0: For mocking. (see link above)

## Patterns/Concepts Used
	
- Flutter clean architecture. https://resocoder.com/category/tutorials/flutter/tdd-clean-architecture/
- BLoc pattern. https://resocoder.com/2019/10/26/flutter-bloc-library-tutorial-1-0-0-stable-reactive-state-management/  
- Separation of Concerns(S), Interface Segragation(I), Dependency Inversion(D)	
- Functional style error handling using Either (dartz package)

## Callouts

- Network Images mocking in tests to avoid exceptions being thrown. See `product_list_item_test.dart`. Details here: 
	- https://iirokrankka.com/2018/09/16/image-network-widget-tests/

- How to solve Not found: 'dart:ui' error while running integration tests on Flutter. Details here:
	- https://github.com/flutter/flutter/issues/27826
	- https://stackoverflow.com/questions/52462646/how-to-solve-not-found-dartui-error-while-running-integration-tests-on-flutt

## Questions

- Service Locator design
- Should we group golden_tests and integration tests by feature
- Wiremock for mocking network calls

## Useful links (Optional read)

- Dependency injection for mocking service calls.		
	- https://blog.codemagic.io/integration-tests-codemagic/
	- https://stackoverflow.com/questions/55143353/how-best-to-stub-mock-rest-api-calls-in-flutter-integration-tests

- Generator functions - yeild, yield*, async, async*, sync*		
	- https://stackoverflow.com/questions/55776041/what-does-yield-keyword-do-in-flutter
	- https://www.youtube.com/watch?v=uRG_-Rlk1pA

- RepaintBoundary
	- https://medium.com/flutter-community/testing-custompaint-widgets-in-flutter-using-golden-image-files-889fe3bdf9ca

- Scaling UI
	- https://medium.com/flutter-community/flutter-effectively-scale-ui-according-to-different-screen-sizes-2cb7c115ea0a

