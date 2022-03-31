import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_card_home.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/design_system/components/ui/shimmers/app_card_home.shimmer.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/cart/src/presentation/home/cart.viewmodel.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/mappers/product.mapper.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/banner_home.component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _vm = inject<HomeViewModel>();
  final CartViewModel _vmCart = inject<CartViewModel>();

  @override
  void initState() {
    _vm.getPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                AppHeader(),
                const BannerHomeComponent(),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Promoções em destaque',
                    style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<List<ProductMapper>?>(
            stream: _vm.products,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<ProductMapper>?> snapshot,
            ) {
              if (snapshot.data == null) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .72,
                  ),
                  delegate: SliverChildListDelegate(
                    const <Widget>[
                      AppCardHomeShimmer(),
                      AppCardHomeShimmer(),
                      AppCardHomeShimmer(),
                      AppCardHomeShimmer(),
                      AppCardHomeShimmer(),
                      AppCardHomeShimmer(),
                    ],
                  ),
                );
              }

              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .52,
                ),
                delegate: SliverChildListDelegate(
                  snapshot.data!.map((ProductMapper item) {
                    return AppCardHome(
                      price: item.price,
                      olderPrice: item.oldPrice,
                      discountPercent: item.discount.toDouble(),
                      quantityRatings: item.reviews,
                      rating: item.rate.toDouble(),
                      freeShipping: item.freeShipping,
                      title: item.name,
                      imagePath: item.image,
                      onPressed: () =>_vmCart.selectProduct(product: item),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(height: 60.w),
                Container(
                  alignment: Alignment.center,
                  color: DefaultColors.neutral,
                  padding: EdgeInsets.symmetric(vertical: 25.w),
                  child: Image.asset(
                    'images/logos/centauro_black.png',
                    height: 28.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
