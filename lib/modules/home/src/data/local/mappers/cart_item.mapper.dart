import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';

class CartItem {
  CartItem({
    required this.item,
    required this.id,
    this.quantity = 1,
  });

  final int quantity;
  final ProductMapper item;
  final String id;
}
