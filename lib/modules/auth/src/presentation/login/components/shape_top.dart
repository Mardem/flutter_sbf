import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShapeTopStack extends StatelessWidget {
  const ShapeTopStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setWidth(-180),
      left: ScreenUtil().setWidth(-180),
      child: SvgPicture.asset(
        'src/img/home/shape_top.svg',
        semanticsLabel: 'Shape top',
      ),
    );
  }
}
