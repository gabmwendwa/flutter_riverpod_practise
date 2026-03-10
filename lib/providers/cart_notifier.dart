import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practise/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return const {
      Product(
        id: '1',
        title: 'Groovy Shorts',
        price: 12,
        image: 'assets/products/shorts.png',
      ),
    };
  }

  // methods to update the state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
