import 'package:flutter/material.dart';
import 'package:flutter_sbf/design_system/values/colors.dart';

class SnackBarUtil {
  static show(
    BuildContext context, {
    String? message,
    Function? action,
    String? actionMessage,
    required SnackBarColors snackBarColor,
  }) {
    final snackbar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action(),
              textColor: Colors.white54,
            ),
      content: Text(message ?? ''),
      backgroundColor: setColor(snackBarColor),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static setColor(SnackBarColors snackBarColors) {
    late Color color;
    switch (snackBarColors) {
      case SnackBarColors.success:
        color = DefaultColors.snackBarSuccessColor;
        break;
      case SnackBarColors.error:
        color = DefaultColors.snackBarErrorColor;
        break;
      case SnackBarColors.defaultColor:
        color = DefaultColors.snackBarInfoColor;
        break;
      default:
        color = DefaultColors.snackBarInfoColor;
        break;
    }

    return color;
  }
}

enum SnackBarColors { success, error, defaultColor }
