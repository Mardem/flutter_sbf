import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_text.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      rightLogo: true,
      child: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 180.w),
              StreamBuilder<String>(
                stream: vm.name,
                builder: (context, snapshot) {
                  return AppText(
                    text: 'Bem vindo, ${snapshot.data}!',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
