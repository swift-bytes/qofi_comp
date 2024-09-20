library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:qofi_comp/widgets/primary_button.dart';
import 'package:qofi_comp/widgets/secondary_button.dart';

class Qofi {
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
  }) => PrimaryButton(text: text, onPressed: onPressed);

  static Widget secondaryButton({
    required String text,
    required VoidCallback onPressed,
  }) => SecondaryButton(text: text, onPressed: onPressed);

}
