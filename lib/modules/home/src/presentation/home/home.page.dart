import 'package:flutter/material.dart';
import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/design_system/components/layouts/main.layout.dart';
import 'package:flutter_sbf/design_system/components/ui/app_header.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel vm = inject<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MainLayout(
      child: Column(
        children: <Widget>[
          const AppHeader(),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(2, 2),
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 3,
                ),
              ],
            ),
            margin: const EdgeInsets.all(16),
            height: 228.w,
          ),
          Text(
            'Promoções em destaque',
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: DefaultColors.neutral300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('images/product.png'),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: DefaultColors.neutral600,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: const Text(
                    'Frete grátis',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Text('Tênis New Balance ML501 - Masculino'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      r'R$ 199,99',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      r'R$ 299,99',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Icon(Icons.star, color: DefaultColors.brand),
                        Icon(Icons.star, color: DefaultColors.brand),
                        Icon(Icons.star, color: DefaultColors.brand),
                        Icon(Icons.star, color: DefaultColors.brand),
                      ],
                    ),
                    const Text('(1954)'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  color: DefaultColors.neutral,
                  child: const Text('5 cores'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(DefaultColors.brand),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: DefaultColors.brand),
                        ),
                      ),
                    ),
                    child: Text(
                      'Comprar',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () => print('Comprar'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
