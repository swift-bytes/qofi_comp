import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title.trs(context),
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontSize: 15.ft,
            fontWeight: FontWeight.w400
          ),
        ));
  }
}
