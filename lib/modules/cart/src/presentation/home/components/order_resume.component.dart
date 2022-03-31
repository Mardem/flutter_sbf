import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../cart.viewmodel.dart';

class OrderResumeComponent extends StatelessWidget {
  OrderResumeComponent({Key? key}) : super(key: key);

  final CartViewModel _vm = inject<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: _vm.resume,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.data == null) {
          return Container();
        }

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: DefaultColors.neutral300),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: Text(
                  'Resumo do pedido',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Subtotal', style: TextStyle(fontSize: 14.sp)),
                    Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(snapshot.data),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Desconto', style: TextStyle(fontSize: 14.sp)),
                    Text(
                      r'R$ 0,00',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: DefaultColors.neutral300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(snapshot.data),
                      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => log('as'),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 25),
                  decoration: BoxDecoration(
                    color: DefaultColors.brand,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Concluir pedido',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        );
      },
    );
  }
}
