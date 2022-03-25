import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  final double? elevation;
  final double? radius;
  final dynamic backgroundColor;

  const AppButton({
    Key? key,
    this.onPressed,
    this.child,
    this.padding,
    this.elevation,
    this.backgroundColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: child,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.white),
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
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
  }
}
