import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

import 'app_input.dart';
import 'input_decoration.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.brand,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(2, 2),
            color: Colors.black.withOpacity(.2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Image.network('https://via.placeholder.com/140x20')),
              Container(
                margin: const EdgeInsets.only(right: 18),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: AppInput(
              decoration: inputDecoration(
                hint: 'Buscar por produtos',
                fillColor: Colors.white,
                suffixIcon: GestureDetector(
                  onTap: () => log('Do something...'),
                  child: const Icon(
                    Icons.search,
                    color: DefaultColors.brand,
                  ),
                ),
                radius: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
