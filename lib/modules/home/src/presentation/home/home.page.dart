import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_card_home.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/cart/routes.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/banner_home.component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const AppHeader(),
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .52,
            ),
            delegate: SliverChildListDelegate(
              <Widget>[
                AppCardHome(
                  price: 199.99,
                  olderPrice: 299.99,
                  discountPercent: 30,
                  quantityRatings: 5,
                  rating: 4.5,
                  freeShipping: true,
                  title: 'Tênis New Balance ML501 - Masculino',
                  onPressed: () => Navigator.pushNamed(context, routeCart.name),
                ),
                AppCardHome(
                  price: 199.99,
                  olderPrice: 299.99,
                  discountPercent: 30,
                  quantityRatings: 5,
                  rating: 4.5,
                  freeShipping: true,
                  title: 'Tênis New Balance ML501 - Masculino',
                  onPressed: () => print('as'),
                ),
                AppCardHome(
                  price: 199.99,
                  olderPrice: 299.99,
                  discountPercent: 30,
                  quantityRatings: 5,
                  rating: 4.5,
                  freeShipping: true,
                  title: 'Tênis New Balance ML501 - Masculino',
                  onPressed: () => print('as'),
                ),
                AppCardHome(
                  price: 199.99,
                  olderPrice: 299.99,
                  discountPercent: 30,
                  quantityRatings: 5,
                  rating: 4.5,
                  freeShipping: true,
                  title: 'Tênis New Balance ML501 - Masculino',
                  onPressed: () => print('as'),
                ),
              ],
            ),
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
