import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHomeComponent extends StatelessWidget {
  const BannerHomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(2, 2),
            color: Colors.black.withOpacity(.2),
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      height: 228.w,
    );
  }
}
