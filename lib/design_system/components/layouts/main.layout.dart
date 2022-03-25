import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/components/ui/app_input.dart';
import 'package:flutter_sbf/design_system/components/ui/input_decoration.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

class MainLayout extends StatelessWidget {
  final bool activeBack;

  const MainLayout({
    this.activeBack = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: DefaultColors.brand,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            onTap: () => print('asdf'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
