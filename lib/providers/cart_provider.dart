import 'package:big_cart_app/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Product> _list = [];

  List<Product> get getProductList => _list;

  double getTotalPrices() {
    double subTotal = 0;
    for (var e in _list) {
      subTotal += e.qty! * e.price!;
    }
    return subTotal;
  }

  void add(Product productModel) {
    int index = getItemIndex(productModel.id);
    if (index == -1) {
      _list.add(productModel);
    } else {
      _list[index].qty = _list[index].qty! + 1;
    }
    notifyListeners();
  }

  int getItemIndex(int? id) {
    int index = _list.indexWhere((element) => element.id == id);
    return index;
  }

  bool isProductAdded(int id) {
    int index = getItemIndex(id);
    if (index >= 0) {
      return true;
    }
    return false;
  }

  increamentProductQty(int id) {
    int index = getItemIndex(id);
    _list[index].qty = _list[index].qty! + 1;
    notifyListeners();
  }

  decreamentProductQty(int id) {
    int index = getItemIndex(id);
    _list[index].qty = _list[index].qty! - 1;
    notifyListeners();
    if (_list[index].qty! <= 0) {
      _list.removeAt(index);
      notifyListeners();
    }
  }

  int productQty(int id) {
    int index = getItemIndex(id);
    int qty = _list[index].qty ?? 0;
    return qty;
  }
}
