import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.onPressed,
    this.child,
    this.padding,
    this.elevation,
    this.backgroundColor,
    this.radius,
  }) : super(key: key);

  final GestureTapCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final double? elevation;
  final double? radius;
  final dynamic backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all((backgroundColor as Color?) ?? Colors.white),
        elevation: MaterialStateProperty.all(elevation ?? 2),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: DefaultColors.defaultBlue,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 30.0),
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
