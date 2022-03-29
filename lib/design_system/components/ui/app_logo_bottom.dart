import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogoBottom extends StatelessWidget {
  const AppLogoBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: DefaultColors.neutral,
      padding: EdgeInsets.symmetric(vertical: 15.w),
      child: Image.asset(
        'images/logos/centauro_black.png',
        height: 18.w,
      ),
    );
  }
}
