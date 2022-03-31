import 'dart:developer';

import 'package:flutter_sbf/core/base/viewmodel.base.dart';
import 'package:flutter_sbf/modules/home/src/data/local/mappers/cart_item.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:rxdart/rxdart.dart';

class CartViewModel extends BaseViewModel {
  final BehaviorSubject<List<CartItem>?> _productsSelected = BehaviorSubject<List<CartItem>?>();
  Stream<List<CartItem>?> get listProductsSelected => _productsSelected.stream;
  void setName(List<CartItem>? value) => _productsSelected.add(value);

  final BehaviorSubject<List<CartItem>?> _resumeItems = BehaviorSubject<List<CartItem>?>();
  Stream<List<CartItem>?> get resumeItems => _resumeItems.stream;
  void setListResume(List<CartItem>? value) => _resumeItems.add(value);

  final BehaviorSubject<double> _totalResume = BehaviorSubject<double>();
  Stream<double> get resume => _totalResume.stream;
  void setTotalResume(double value) => _totalResume.add(value);

  final List<CartItem> _itemsSelected = <CartItem>[];
  final List<CartItem> _resumeItemsAux = <CartItem>[];

  void selectProduct({required ProductMapper product}) {
    final CartItem item = CartItem(item: product, id: product.id);

    if (_itemsSelected.where((CartItem element) => element.id == product.id).isEmpty) {
      _itemsSelected.add(item);
      _productsSelected.add(_itemsSelected);

      log('Produto ${product.name} adicionado', name: 'ADD_PRODUCT');
    } else {
      log('Produto ${product.name} já adicionado', name: 'ADD_PRODUCT');
    }
  }

  void removeItemCart({required int index}) {
    final CartItem item = _itemsSelected[index];

    _itemsSelected.removeAt(index);
    _productsSelected.add(_itemsSelected);

    _resumeItemsAux.removeWhere((CartItem element) => element.id == item.id);
    getResume();
  }

  void addMore({required int indexCart, required int quantity}) {
    final CartItem item = _itemsSelected[indexCart];

    _resumeItemsAux.add(_itemsSelected[indexCart]);
    _resumeItems.add(_resumeItemsAux);

    log(
      'Quantidade do produto ${item.item.name} aumentada',
      name: 'ADD_PRODUCT',
    );
    getResume();
  }

  Future<void> decrease({required int indexCart}) async {
    final CartItem item = _itemsSelected[indexCart];
    final List<CartItem> itemDecrease = _resumeItemsAux
        .where(
          (CartItem element) => element.id == item.id,
        )
        .toList();

    if (itemDecrease.isNotEmpty) {
      final int index = _resumeItemsAux.indexWhere((CartItem element) => element.id == item.id);

      _resumeItemsAux.removeAt(index);
      _resumeItems.add(_resumeItemsAux);
      getResume();

      log(
        'Quantidade do produto ${item.item.name} diminuida para ${itemDecrease.toList().length - 1}',
        name: 'DECREASE_PRODUCT',
      );
    }
  }

  int getLengthById({required int indexCart}) {
    final CartItem item = _itemsSelected[indexCart];

    return _resumeItemsAux.where((CartItem element) => element.id == item.id).toList().length;
  }

  void getResume() {
    double totalResume = 0.0;

    for (final CartItem value in _resumeItemsAux) {
      totalResume += value.item.price;
    }

    setTotalResume(totalResume);
  }
}
