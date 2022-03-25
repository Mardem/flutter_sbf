import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_sbf/design_system/components/animated/up_down.dart';

class RectangleStack extends StatelessWidget {
  const RectangleStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setWidth(30),
      right: ScreenUtil().setWidth(30),
      width: ScreenUtil().setWidth(20),
      child: AppDownAnimation(
        endPosition: ScreenUtil().setWidth(0.03),
        child: SvgPicture.asset(
          'src/img/home/rectangle.svg',
          semanticsLabel: 'Rectangle',
        ),
      ),
    );
  }
}
