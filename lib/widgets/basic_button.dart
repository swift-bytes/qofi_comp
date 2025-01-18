import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.title,this.titleStyle});
  final VoidCallback onPressed;
  final String title;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title.trs(context),
          style:titleStyle?? TextStyle(
            color: Theme.of(context).canvasColor,
            fontSize: 14.5.ft,
            fontWeight: FontWeight.w400
          ),
        ));
  }
}
