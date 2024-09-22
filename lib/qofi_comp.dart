library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:qofi_comp/widgets/auth_text_field.dart';
import 'package:qofi_comp/widgets/basic_button.dart';
import 'package:qofi_comp/widgets/primary_button.dart';
import 'package:qofi_comp/widgets/secondary_button.dart';
import 'package:qofi_comp/widgets/form_fields.dart';
import 'package:qofi_comp/widgets/slider_cards.dart';

class Qofi {
  static Widget primaryButton({
    required String title,
    required VoidCallback onPressed,
  }) => PrimaryButton(title: title, onPressed: onPressed);

  static Widget secondaryButton({
    required String title,
    required VoidCallback onPressed,
  }) => SecondaryButton(title: title, onPressed: onPressed);
  
  static Widget formFields({
    required String hintText,
  }) => FormFields(hintText: hintText);

  static Widget sliderCards() => SliderCards();


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
