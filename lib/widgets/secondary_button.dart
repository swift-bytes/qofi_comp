import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key,
    required this.title,
    required this.onPressed,
    this.loading = true,
    this.titleStyle,
    this.buttonStyle});

  final String title;
  final VoidCallback onPressed;
  final TextStyle? titleStyle;
  final ButtonStyle? buttonStyle;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(100.w, 6.2.h),
        side: BorderSide(color: Theme
            .of(context)
            .primaryColor, width:
        buttonStyle?.side
            ?.resolve({})
            ?.width ??
            2),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.sp),
        ),
      ).merge(buttonStyle),
      child: loading ? Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: Theme
              .of(context)
              .primaryColor,
        ),
      ) : Text(
        title.trs(context),
        maxLines: 1,
        style: TextStyle(
          color: Theme
              .of(context)
              .primaryColor,
          fontSize: 15.ft,
          fontWeight: FontWeight.w600,
        ).merge(titleStyle),
      ),
    );
  }
}
