import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool topLogo;
  final bool rightLogo;
  final bool activeBack;

  const MainLayout({
    Key? key,
    required this.child,
    this.topLogo = false,
    this.rightLogo = false,
    this.activeBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: ScreenUtil().screenHeight),
              activeBack
                  ? Positioned(
                      left: 0,
                      top: 20.w,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  : Container(),
              rightLogo ? _rightLogo() : Container(),
              Positioned(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: Column(
                  children: [
                    topLogo ? _centerLogo() : Container(),
                    Expanded(
                      child: child,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _centerLogo() => Container(
        margin: EdgeInsets.only(top: 100.w),
        child: SvgPicture.asset(
          'src/img/home/logo.svg',
          height: 100.w,
        ),
      );

  _rightLogo() => Positioned(
        top: 20.w,
        right: 30.w,
        child: Container(
          margin: EdgeInsets.only(top: 10.w),
          child: SvgPicture.asset(
            'src/img/home/logo.svg',
            height: 50.w,
          ),
        ),
      );
}
