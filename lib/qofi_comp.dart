library qofi_comp;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qofi_comp/widgets/auth_text_field.dart';
import 'package:qofi_comp/widgets/basic_button.dart';
import 'package:qofi_comp/widgets/custom_otp.dart';
import 'package:qofi_comp/widgets/primary_button.dart';
import 'package:qofi_comp/widgets/round_bordered_button.dart';
import 'package:qofi_comp/widgets/secondary_button.dart';
import 'package:qofi_comp/widgets/form_fields.dart';
import 'package:qofi_comp/widgets/slider_cards.dart';
import 'package:qofi_comp/widgets/bullet_points.dart';

class Qofi {
  static Widget primaryButton({
    required String title,
    bool loading = false,
    bool success = false,
    required VoidCallback onPressed,
    TextStyle? titleStyle,
    ButtonStyle? buttonStyle,
  }) =>
      PrimaryButton(
        title: title,
        onPressed: onPressed,
        loading: loading,
        success: success,
        titleStyle: titleStyle,
        buttonStyle: buttonStyle,
      );

  static Widget secondaryButton({
    required String title,
    required VoidCallback onPressed,
    TextStyle? titleStyle,
    bool loading = false,
    ButtonStyle? buttonStyle,
  }) =>
      SecondaryButton(
        title: title,
        onPressed: onPressed,
        loading: loading,
        titleStyle: titleStyle,
        buttonStyle: buttonStyle,
      );

  static Widget formFields({
    required String hintText,
  }) =>
      FormFields(hintText: hintText);

  static Widget sliderCards() => SliderCards();

  static Widget basicButton({
    required VoidCallback onPressed,
    required String title,
    TextStyle? titleStyle,
  }) =>
      BasicButton(
        onPressed: onPressed,
        title: title,
        titleStyle: titleStyle,
      );

  static Widget authTextField({required Map e}) => AuthTextField(e: e);

  static Widget bulletPoints({
    required int currentIndex,
    required int total,
  }) =>
      BulletPoints(currentIndex: currentIndex, total: total);

  static Widget otpInputWidget({
    required int length,
    required Function(String) onCompleted,
    double? boxWidth,
  }) =>
      OtpInputWidget(
        length: length,
        onCompleted: onCompleted,
        boxWidth: boxWidth,
      );

  static Widget roundBorderedButton({
    required VoidCallback onPressed,
    required String icon,
    Color? iconColor,
    double size = 5,
  }) =>
      RoundBorderedButton(
        onPressed: onPressed,
        iconColor: iconColor,
        icon: icon,
        size: size,
      );
}
