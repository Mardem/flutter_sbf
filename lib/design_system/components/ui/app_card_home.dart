import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'app_customer_feedback_start.dart';

class AppCardHome extends StatelessWidget {
  const AppCardHome({
    required this.onPressed,
    required this.title,
    required this.price,
    this.discountPercent,
    this.freeShipping,
    this.olderPrice,
    this.rating = 0,
    this.quantityRatings,
    this.quantityColors,
    this.imagePath,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final double? discountPercent;
  final bool? freeShipping;
  final String title;
  final double price;
  final double? olderPrice;
  final double rating;
  final int? quantityRatings;
  final int? quantityColors;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: DefaultColors.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: imagePath ?? '',
                  fit: BoxFit.fitHeight,
                  placeholder: (BuildContext context, String url) => Shimmer.fromColors(
                    baseColor: DefaultColors.shimmerBaseColor,
                    highlightColor: DefaultColors.shimmerHighlightColor,
                    child: Container(
                      color: Colors.black,
                      margin: const EdgeInsets.all(4),
                    ),
                  ),
                ),
                if (discountPercent != null)
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: DefaultColors.brand,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        '${discountPercent!.round()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: DefaultColors.brand,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          if (freeShipping != null)
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: DefaultColors.neutral600,
                borderRadius: BorderRadius.circular(2),
              ),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: const Text(
                'Frete grátis',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title, style: TextStyle(fontSize: 13.sp)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(price),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (olderPrice != null)
                  Text(
                    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(olderPrice),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp,
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (rating != null) AppCustomerFeedbackStar(rating: rating),
              if (quantityRatings != null) Text('($quantityRatings)'),
            ],
          ),
          if (quantityColors != null)
            Container(
              padding: const EdgeInsets.all(4),
              color: DefaultColors.neutral,
              child: Text(quantityColors! > 1 ? '$quantityColors cores' : '$quantityColors cor'),
            ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: DefaultColors.brand,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Comprar',
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
    );
  }
}
