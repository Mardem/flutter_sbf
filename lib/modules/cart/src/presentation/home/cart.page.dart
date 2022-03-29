import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final HomeViewModel vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppHeader(),
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: const Text(
              'Meu carrinho',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: DefaultColors.neutral300),
              ),
              child: ListView(
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
                          r'R$ 160,49',
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
                          r'R$ 160,49',
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('as'),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 80),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
