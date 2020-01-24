import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_state.dart';
import 'package:bloc/bloc.dart';

class CartBloc extends Bloc<NoParams, CartState> {
  CartBloc({@required CartRepository repository})
      : assert(repository != null),
        _repository = repository;

  final CartRepository _repository;

  @override
  CartState get initialState => CartInitial();

  @override
  Stream<CartState> mapEventToState(NoParams event) async* {
    yield CartLoading();
    final cartItems = _repository.getCartItems();
    yield CartLoaded(cartItems);
  }
}
