import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlusMinusComponent extends StatelessWidget {
  const PlusMinusComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: DefaultColors.neutral300.withOpacity(.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
              border: Border.all(color: DefaultColors.neutral300),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Icon(
              Icons.remove_outlined,
              size: 15,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: DefaultColors.neutral300, width: 1.5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              '1',
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: DefaultColors.neutral300.withOpacity(.5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              border: Border.all(color: DefaultColors.neutral300),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Icon(
              Icons.add_outlined,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
