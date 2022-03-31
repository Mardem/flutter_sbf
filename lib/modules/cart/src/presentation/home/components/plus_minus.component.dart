import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/home/src/data/local/mappers/cart_item.mapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cart.viewmodel.dart';

class PlusMinusComponent extends StatelessWidget {
  PlusMinusComponent({Key? key, required this.indexCart}) : super(key: key);

  final int indexCart;

  final CartViewModel _vm = inject<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartItem>?>(
      stream: _vm.resumeItems,
      initialData: const <CartItem>[],
      builder: (
        BuildContext context,
        AsyncSnapshot<List<CartItem>?> snapshot,
      ) {
        return Container(
          margin: const EdgeInsets.only(top: 8),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _vm.decrease(indexCart: indexCart),
                child: Container(
                  decoration: BoxDecoration(
                    color: DefaultColors.neutral300.withOpacity(.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      topLeft: Radius.circular(4),
                    ),
                    border: Border.all(color: DefaultColors.neutral300),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: const Icon(Icons.remove_outlined, size: 15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: DefaultColors.neutral300, width: 1.5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Text(
                  _vm.getLengthById(indexCart: indexCart).toString(),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _vm.addMore(indexCart: indexCart, quantity: 0);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: DefaultColors.neutral300.withOpacity(.5),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    border: Border.all(color: DefaultColors.neutral300),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: const Icon(Icons.add_outlined, size: 15),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
