import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShapeBottomStack extends StatelessWidget {
  final double? bottom;
  final double? right;

  const ShapeBottomStack({
    Key? key,
    this.bottom,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom ?? ScreenUtil().setWidth(-100),
      right: right ?? ScreenUtil().setWidth(-250),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-20 / 560),
        child: SvgPicture.asset(
          'src/img/home/shape_bottom.svg',
          semanticsLabel: 'Shape Bottom',
        ),
      ),
    );
  }
}
