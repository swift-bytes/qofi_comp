import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  
  @override

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        minimumSize: Size(100.w, 6.6.h),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.sp),
          ),
      ),
      child: Text(
        title.trs(context),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 15.ft, 
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
