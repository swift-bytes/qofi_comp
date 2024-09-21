import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  
  @override

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: CupertinoColors.white, 
          minimumSize: Size(100.w, 7.3.h),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.sp),
          ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 15.ft, 
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
