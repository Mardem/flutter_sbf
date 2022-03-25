import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

class AppButtonOutline extends StatelessWidget {
  const AppButtonOutline({
    Key? key,
    this.onPressed,
    this.child,
    this.padding,
    this.elevation,
  }) : super(key: key);
  final GestureTapCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(elevation ?? 2),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: DefaultColors.defaultBlue,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
