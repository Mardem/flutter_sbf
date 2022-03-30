import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppCardHomeShimmer extends StatelessWidget {
  const AppCardHomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: DefaultColors.shimmerBaseColor,
      highlightColor: DefaultColors.shimmerHighlightColor,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: DefaultColors.neutral300),
          color: Colors.white,
        ),
      ),
    );
  }
}
