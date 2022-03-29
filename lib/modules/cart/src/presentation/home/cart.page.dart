import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/design_system/components/ui/app_logo_bottom.dart';
import 'package:flutter_sbf/modules/cart/src/presentation/home/components/title_cart.component.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';

import 'components/line_cart_item.component.dart';
import 'components/order_resume.component.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppHeader(),
          const TitleCartComponent(),
          Expanded(
            child: ListView(
              children: const <Widget>[LineCartItemComponent()],
            ),
          ),
          const OrderResumeComponent(),
          const AppLogoBottom()
        ],
      ),
    );
  }
}
