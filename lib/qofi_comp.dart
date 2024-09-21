library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:qofi_comp/widgets/auth_text_field.dart';
import 'package:qofi_comp/widgets/basic_button.dart';
import 'package:qofi_comp/widgets/list_card.dart';
import 'package:qofi_comp/widgets/primary_button.dart';

class Qofi {
  static Widget primaryButton({
    required String title,
    required VoidCallback onPressed,
  }) =>
      PrimaryButton(title: title, onPressed: onPressed);
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

  static Widget basicButton({
    required VoidCallback onPressed,
    required String title,
  }) =>
      BasicButton(
        onPressed: onPressed,
        title: title,
      );
  static Widget authTextField({required Map e}) => AuthTextField(e: e);
}
