library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:qofi_comp/widgets/primary_button.dart';
import 'package:qofi_comp/widgets/secondary_button.dart';
import 'package:qofi_comp/widgets/form_fields.dart';
import 'package:qofi_comp/widgets/slider_cards.dart';
import 'package:qofi_comp/widgets/bullet_points.dart';

class Qofi {
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
  }) => PrimaryButton(text: text, onPressed: onPressed);

  static Widget secondaryButton({
    required String text,
    required VoidCallback onPressed,
  }) => SecondaryButton(text: text, onPressed: onPressed);
  
  static Widget formFields({
    required String hintText,
  }) => FormFields(hintText: hintText);

  static Widget sliderCards() => SliderCards();

  static Widget bulletPoints({
    required int currentIndex,
    required int total,
  }) => BulletPoints(currentIndex: currentIndex, total: total);

}
