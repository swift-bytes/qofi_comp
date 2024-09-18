library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:qofi_comp/widgets/list_card.dart';
import 'package:qofi_comp/widgets/primary_button.dart';

class Qofi {
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
  }) =>
      PrimaryButton(text: text, onPressed: onPressed);
  static Widget listCard({
    required VoidCallback onPressed,
    required String title,
    required String subtitle,
  }) =>
      ListCard(
        onPressed: onPressed,
        title: title,
        subtitle: subtitle,
      );
}
