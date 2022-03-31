import 'package:flutter/material.dart';

class BannerHomeComponent extends StatelessWidget {
  const BannerHomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/banner.png',
      fit: BoxFit.cover,
    );
  }
}
