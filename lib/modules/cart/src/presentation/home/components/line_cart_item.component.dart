import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'plus_minus.component.dart';

class LineCartItemComponent extends StatelessWidget {
  const LineCartItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: DefaultColors.neutral300),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: Image.asset(
                    'images/product.png',
                    fit: BoxFit.cover,
                  ).image,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Tênis New Balance ML501 - Masculino'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      PlusMinusComponent(),
                      Text('X Remover'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(199.99),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(299.99),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
