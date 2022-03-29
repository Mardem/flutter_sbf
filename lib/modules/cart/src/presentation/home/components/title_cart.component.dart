import 'package:flutter/material.dart';

class TitleCartComponent extends StatelessWidget {
  const TitleCartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: const Text('Meu carrinho', style: TextStyle(fontSize: 18)),
    );
  }
}
