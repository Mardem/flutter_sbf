import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartNoContentComponent extends StatelessWidget {
  const CartNoContentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DefaultColors.neutral300),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 150,
              width: size.width,
              child: Image.asset(
                'images/icons/shopping-cart.png',
                width: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32.w),
              width: size.width,
              child: Text(
                'Seu carrinho\nestá vazio...',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        height: 1.5,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text:
                              'São milhares de produtos para você\nescolher\nEscolha seus produtos e adicione\nem seu carrinho',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 24),
              margin: EdgeInsets.only(top: 16.w),
              decoration: BoxDecoration(
                color: DefaultColors.brand,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Comece a comprar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
