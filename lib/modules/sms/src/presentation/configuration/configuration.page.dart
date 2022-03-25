import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button_loading.dart';
import 'package:flutter_sbf/design_system/components/ui/app_text.dart';
import 'package:flutter_sbf/design_system/utils/snackbar.util.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/auth/src/presentation/login/login.widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configuration.viewmodel.dart';

class ConfigSmsPage extends StatefulWidget {
  const ConfigSmsPage({Key? key}) : super(key: key);

  @override
  _ConfigSmsPageState createState() => _ConfigSmsPageState();
}

class _ConfigSmsPageState extends State<ConfigSmsPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final vm = inject<ConfigurationSmsViewModel>();

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
    return MainLayout(
      rightLogo: true,
      activeBack: true,
      child: SizedBox(
        width: ScreenUtil().screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            onChanged: () => _key.currentState!.validate(),
            child: Column(
              children: [
                SizedBox(height: 180.w),
                SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: AppText(
                    text: 'Configurações de SMS',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 15.w),
                Text(
                  'Preencha corretamente todos os dados do provedor abaixo. Após isso, clique no botão "Salvar".',
                  style: GoogleFonts.openSans(),
                ),
                SizedBox(height: 30.w),
                StreamBuilder<String>(
                  stream: vm.name,
                  builder: (context, snapshot) {
                    return TextFormField(
                      decoration: LoginWidgets.inputDecoration(
                        hint: 'Nome do provedor',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Não deixe esse campo vazio!';
                        }
                        return null;
                      },
                      onChanged: (value) => vm.setName(value),
                    );
                  },
                ),
                SizedBox(height: 15.w),
                StreamBuilder<String>(
                  stream: vm.login,
                  builder: (context, snapshot) {
                    return TextFormField(
                      decoration: LoginWidgets.inputDecoration(
                        hint: 'Login',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Não deixe esse campo vazio!';
                        }
                        return null;
                      },
                      onChanged: (value) => vm.setLogin(value),
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Não deixe esse campo vazio!';
                        }
                        return null;
                      },
                      onChanged: (value) => vm.setPassword(value),
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
                        'Salvar',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.sp),
                      backgroundColor: DefaultColors.defaultBlue,
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          await vm.save();
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
    );
  }
}
