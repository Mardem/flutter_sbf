import 'package:flutter_sbf/core/base/viewmodel.base.dart';
import 'package:flutter_sbf/core/di/components/remote/response.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/data/repository/product.repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel {
  final ProductRepository _productRepository = inject<ProductRepository>();

  final BehaviorSubject<List<ProductMapper>?> _products = BehaviorSubject<List<ProductMapper>?>();
  Stream<List<ProductMapper>?> get products => _products.stream;
  void setName(List<ProductMapper>? value) => _products.add(value);

  Future<void> getPromotions() async {
    final HttpResponse<List<ProductMapper>> res = await _productRepository.getPromotions();

    _products.add(res.data);
  }
}
