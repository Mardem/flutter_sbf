import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button.dart';
import 'package:flutter_sbf/design_system/components/ui/app_button_loading.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/auth/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'login.viewmodel.dart';

class LoginWidgets {
  final vm = inject<LoginViewModel>();

  apiLogin(GlobalKey<FormState> key) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Form(
            key: key,
            onChanged: () => key.currentState?.validate(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<String>(
                  stream: vm.email,
                  builder: (context, snapshot) {
                    return TextFormField(
                      decoration: LoginWidgets.inputDecoration(
                        hint: 'E-mail',
                      ),
                      initialValue: snapshot.data,
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
                SizedBox(height: 20.w),
                StreamBuilder<String>(
                  stream: vm.password,
                  builder: (context, snapshot) {
                    return TextFormField(
                      obscureText: true,
                      decoration: inputDecoration(
                        hint: 'Senha',
                      ),
                      initialValue: snapshot.data,
                      onChanged: (String value) => vm.setPassword(value),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Não deixe esse campo vazio!';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: 10.w),
                SizedBox(
                  height: 30.w,
                  child: StreamBuilder<bool>(
                    stream: vm.logged,
                    initialData: false,
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Manter logado?'),
                          Checkbox(
                            value: snapshot.data,
                            onChanged: (bool? val) => vm.keepConnected(val),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                StreamBuilder<bool>(
                  stream: vm.loading,
                  initialData: false,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasData && snapshot.data == true) {
                      return const AppButtonLoading();
                    }

                    return AppButton(
                      child: const Text(
                        'Acessar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                      ),
                      backgroundColor: DefaultColors.defaultBlue,
                      elevation: 0,
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          await vm.login(context);
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

  socialLogin(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.w,
          child: Row(
            children: const [
              Expanded(flex: 1, child: Divider()),
              Expanded(
                flex: 2,
                child: Text(
                  'Ou acesse utilizando',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: DefaultColors.defaultGrey,
                  ),
                ),
              ),
              Expanded(flex: 1, child: Divider()),
            ],
          ),
        ),
        AppButton(
          child: const Text(
            'Criar uma conta',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: DefaultColors.defaultBlue,
          elevation: 0,
          radius: 3,
          onPressed: () => Navigator.pushNamed(context, routeRegister.name),
        ),
        SignInButton(
          Buttons.Google,
          text: 'Login com o Google',
          onPressed: () => vm.googleLogin(context),
        ),
      ],
    );
  }

  static InputDecoration inputDecoration({required String hint}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: ' ' + hint,
      hintStyle: const TextStyle(fontSize: 13),
      filled: true,
      fillColor: Colors.grey.withOpacity(.2),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
