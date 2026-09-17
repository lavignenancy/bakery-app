import 'package:flutter/foundation.dart';

import 'product.dart';

@immutable
class CartLine {
  const CartLine({
    required this.product,
    required this.addOns,
    this.qty = 1,
  });

  final Product product;
  final List<AddOn> addOns;
  final int qty;

  double get lineTotal =>
      (product.price + addOns.fold(0.0, (sum, addon) => sum + addon.price)) * qty;

  CartLine copyWith({int? qty}) => CartLine(
        product: product,
        addOns: addOns,
        qty: qty ?? this.qty,
      );
}

class Cart extends ChangeNotifier {
  final List<CartLine> _lines = [];

  List<CartLine> get lines => List.unmodifiable(_lines);

  int get itemCount => _lines.fold(0, (sum, line) => sum + line.qty);

  double get subtotal => _lines.fold(0.0, (sum, line) => sum + line.lineTotal);

  void add(Product product, {List<AddOn> addOns = const [], int qty = 1}) {
    _lines.add(CartLine(
      product: product,
      addOns: List.of(addOns),
      qty: qty,
    ));
    notifyListeners();
  }

  void increment(CartLine line) => _change(line, 1);

  void decrement(CartLine line) => _change(line, -1);

  void _change(CartLine line, int delta) {
    final index = _lines.indexOf(line);
    if (index == -1) return;

    final nextQty = _lines[index].qty + delta;
    if (nextQty <= 0) {
      _lines.removeAt(index);
    } else {
      _lines[index] = _lines[index].copyWith(qty: nextQty);
    }

    notifyListeners();
  }
}
