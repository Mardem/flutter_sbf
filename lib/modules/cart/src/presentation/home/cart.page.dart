import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/modules/cart/src/presentation/home/components/order_resume.component.dart';
import 'package:flutter_sbf/modules/home/src/data/local/mappers/cart_item.mapper.dart';

import 'cart.viewmodel.dart';
import 'components/cart_no_content.component.dart';
import 'components/line_cart_item.component.dart';
import 'components/title_cart.component.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartViewModel _vm = inject<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      activeBottomLogo: true,
      child: StreamBuilder<List<CartItem>?>(
        stream: _vm.listProductsSelected,
        initialData: const <CartItem>[],
        builder: (
          BuildContext context,
          AsyncSnapshot<List<CartItem>?> snapshot,
        ) {
          if (snapshot.data!.isEmpty) {
            return const CartNoContentComponent();
          }

          return ListView(
            children: <Widget>[
              AppHeader(),
              const TitleCartComponent(),
              ..._generateItems(items: snapshot.data),
              OrderResumeComponent()
            ],
          );
        },
      ),
    );
  }

  List<Widget> _generateItems({required List<CartItem>? items}) {
    final List<Widget> widgets = <Widget>[];

    items!.asMap().forEach((int index, CartItem element) {
      widgets.add(
        LineCartItemComponent(
          title: element.item.name,
          price: element.item.price,
          imagePath: element.item.image,
          olderPrice: element.item.oldPrice,
          indexCart: index,
        ),
      );
    });

    return widgets;
  }
}
