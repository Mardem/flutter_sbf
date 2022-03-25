import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_sbf/design_system/utils/snackbar.util.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/login.widgets.dart';

import 'components/shape_bottom.dart';
import 'components/shape_top.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidgets {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    vm.error.listen((event) {
      SnackBarUtil.show(
        context,
        message: event,
        snackBarColor: SnackBarColors.error,
      );
    });

    vm.success.listen((event) {
      SnackBarUtil.show(
        context,
        message: event,
        snackBarColor: SnackBarColors.success,
      );
    });

    vm.info.listen((event) {
      SnackBarUtil.show(
        context,
        message: event,
        snackBarColor: SnackBarColors.defaultColor,
      );
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: ScreenUtil().screenHeight + 10),
              const ShapeTopStack(),
              const ShapeBottomStack(),
              Positioned(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100.w),
                      child: SvgPicture.asset(
                        'src/img/home/logo.svg',
                        height: 100.w,
                      ),
                    ),
                    const Text('Acesse sua conta'),
                    Expanded(
                      child: Column(
                        children: [
                          apiLogin(_key),
                          socialLogin(context),
                        ],
                      ),
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
}
