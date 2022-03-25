import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/core/utils/input_mask.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button_loading.dart';
import 'package:flutter_sbf/design_system/utils/snackbar.util.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/components/shape_bottom.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/components/shape_top.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/login.widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register.viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final vm = inject<RegisterViewModel>();

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
              Container(height: ScreenUtil().screenHeight),
              const ShapeTopStack(),
              const ShapeBottomStack(),
              Positioned(
                left: 0,
                top: 20.w,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                top: 20.w,
                right: 30.w,
                child: Container(
                  margin: EdgeInsets.only(top: 10.w),
                  child: SvgPicture.asset(
                    'src/img/home/logo.svg',
                    height: 50.w,
                  ),
                ),
              ),
              Positioned(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: Container(
                  margin: EdgeInsets.only(top: 100.w),
                  child: Form(
                    key: _key,
                    onChanged: () => _key.currentState!.validate(),
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        children: [
                          SizedBox(
                            width: ScreenUtil().screenWidth,
                            child: Text(
                              'Cadastro de usuários',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.w),
                          Text(
                            'Preencha corretamente todos os campos abaixo. Após isso, clique no botão "Continuar".',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(),
                          ),
                          SizedBox(height: 30.w),
                          StreamBuilder<String>(
                            stream: vm.email,
                            builder: (context, snapshot) {
                              return TextFormField(
                                decoration: LoginWidgets.inputDecoration(
                                  hint: 'E-mail',
                                ),
                                onChanged: (String value) => vm.setEmail(value),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Não deixe esse campo vazio!';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 15.w),
                          StreamBuilder<String>(
                            stream: vm.password,
                            builder: (context, snapshot) {
                              return TextFormField(
                                decoration: LoginWidgets.inputDecoration(
                                  hint: 'Senha',
                                ),
                                obscureText: true,
                                onChanged: (String value) => vm.setPassword(
                                  value,
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Não deixe esse campo vazio!';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 15.w),
                          StreamBuilder<String>(
                              stream: vm.name,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  decoration: LoginWidgets.inputDecoration(
                                    hint: 'Nome',
                                  ),
                                  onChanged: (String value) => vm.setName(value),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Não deixe esse campo vazio!';
                                    }
                                    return null;
                                  },
                                );
                              }),
                          SizedBox(height: 15.w),
                          StreamBuilder<String>(
                            stream: vm.company,
                            builder: (context, snapshot) {
                              return TextFormField(
                                decoration: LoginWidgets.inputDecoration(
                                  hint: 'Nome da empresa',
                                ),
                                onChanged: (String value) => vm.setCompany(
                                  value,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.w),
                          StreamBuilder<String>(
                            stream: vm.phone,
                            builder: (context, snapshot) {
                              return TextFormField(
                                decoration: LoginWidgets.inputDecoration(
                                  hint: 'Telefone',
                                ),
                                inputFormatters: [InputMaskFormatter.phone()],
                                onChanged: (String value) => vm.setPhone(
                                  value,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.w),
                          StreamBuilder<String>(
                            stream: vm.address,
                            builder: (context, snapshot) {
                              return TextFormField(
                                decoration: LoginWidgets.inputDecoration(
                                  hint: 'Endereço',
                                ),
                                onChanged: (String value) => vm.setAddress(
                                  value,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.w),
                          StreamBuilder<bool>(
                            stream: vm.loading,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data == true) {
                                return const AppButtonLoading();
                              }

                              return AppButton(
                                child: Text(
                                  'Continuar',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: DefaultColors.defaultBlue,
                                onPressed: () async {
                                  if (_key.currentState!.validate()) {
                                    await vm.register(context);
                                  }
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
