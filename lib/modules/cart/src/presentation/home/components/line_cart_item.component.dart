import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../cart.viewmodel.dart';
import 'plus_minus.component.dart';

class LineCartItemComponent extends StatelessWidget {
  LineCartItemComponent({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.indexCart,
    this.olderPrice,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final int indexCart;
  final double price;
  final double? olderPrice;

  final CartViewModel _vm = inject<CartViewModel>();

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
              ),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.contain,
                placeholder: (BuildContext context, String url) => Shimmer.fromColors(
                  baseColor: DefaultColors.shimmerBaseColor,
                  highlightColor: DefaultColors.shimmerHighlightColor,
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(4),
                  ),
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
                  Text(title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PlusMinusComponent(indexCart: indexCart),
                      GestureDetector(
                        onTap: () => _vm.removeItemCart(index: indexCart),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('X Remover'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(price),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(olderPrice),
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
