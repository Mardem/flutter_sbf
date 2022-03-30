import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';

import 'components/cart_no_content.component.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final HomeViewModel vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      activeBottomLogo: true,
      child: ListView(
        children: <Widget>[
          AppHeader(),
          const SizedBox(height: 20),
          const CartNoContentComponent(),
        ],
      ),
    );
  }
}
