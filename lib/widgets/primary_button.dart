import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  
  @override

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: Size(100.w, 7.3.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.sp),
          )),
      child: Text(
        title.trs(context),
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: 15.ft,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
