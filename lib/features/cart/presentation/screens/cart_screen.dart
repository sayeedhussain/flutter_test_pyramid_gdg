import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/blocs/cart_state.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/widgets/cart_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({@required CartBloc bloc})
      : assert(bloc != null),
        _bloc = bloc;
  final CartBloc _bloc;

  static const keyMessage = 'Message';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    widget._bloc.add(NoParams());
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
          bloc: widget._bloc,
          builder: (BuildContext context, CartState cartState) {
            if (cartState is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (cartState is CartError) {
              return const Center(
                  child: Text(
                'Error!!!',
                key: Key(CartScreen.keyMessage),
              ));
            } else if (cartState is CartLoaded) {
              return cartState.cartItems.isNotEmpty
                  ? CartList(
                      cartItems: cartState.cartItems,
                    )
                  : const Center(
                      child: Text(
                      'No Items In Cart',
                      key: Key(CartScreen.keyMessage),
                    ));
            }
            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }

  @override
  void dispose() {
    widget._bloc.close();
    super.dispose();
  }
}
