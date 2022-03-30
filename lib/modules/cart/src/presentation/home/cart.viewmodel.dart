import 'package:flutter_sbf/core/base/viewmodel.base.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:rxdart/rxdart.dart';

class CartViewModel extends BaseViewModel {
  final BehaviorSubject<List<ProductMapper>?> _productsSelected =
      BehaviorSubject<List<ProductMapper>?>();
  Stream<List<ProductMapper>?> get listProductsSelected => _productsSelected.stream;
  void setName(List<ProductMapper>? value) => _productsSelected.add(value);

  final List<ProductMapper> _itemsSelected = <ProductMapper>[];

  void selectProduct({required ProductMapper product}) {
    _itemsSelected.add(product);

    _productsSelected.add(_itemsSelected);
  }
}
