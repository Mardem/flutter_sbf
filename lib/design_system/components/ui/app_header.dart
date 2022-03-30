import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/cart/src/presentation/home/cart.viewmodel.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_input.dart';
import 'input_decoration.dart';

class AppHeader extends StatelessWidget {
  AppHeader({Key? key}) : super(key: key);

  final CartViewModel _vmCart = inject<CartViewModel>();

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
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'images/logos/centauro_white.png',
                    height: 28.w,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 18),
                  height: 50.w,
                  width: 50.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Positioned>[
                      Positioned(
                        width: 30.w,
                        height: 30.w,
                        child: Image.asset(
                          'images/icons/shopping_cart_24px.png',
                          height: 30,
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 0,
                        child: StreamBuilder<List<ProductMapper>?>(
                          stream: _vmCart.listProductsSelected,
                          initialData: const <ProductMapper>[],
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<List<ProductMapper>?> snapshot,
                          ) {
                            String itemsCart = snapshot.data!.length.toString();

                            if (snapshot.data!.length > 9) {
                              itemsCart = '9+';
                            }

                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: snapshot.data!.length > 9 ? 4 : 7,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: DefaultColors.brand,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                itemsCart,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
