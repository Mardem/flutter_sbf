import 'package:easy_mask/easy_mask.dart';

class InputMaskFormatter {
  static phone() {
    return TextInputMask(
      mask: ['(99) 9999-9999', '(99) 9 9999-9999'],
    );
  }
}
