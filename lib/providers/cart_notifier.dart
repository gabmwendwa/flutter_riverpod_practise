import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practise/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return {
      Product(
        id: '1',
        title: 'Groovy Shorts',
        price: 12,
        image: 'assets/products/shorts.png',
      ),
    };
  }

  // methods to update the state
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
