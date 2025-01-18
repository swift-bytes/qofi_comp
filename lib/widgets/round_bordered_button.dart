import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class RoundBorderedButton extends StatelessWidget {
  const RoundBorderedButton(
      {super.key, required this.onPressed, required this.icon, this.size = 5,this.iconColor});
  final VoidCallback onPressed;
  final String icon;
  final double size;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            minimumSize: Size(
              5.h,
              5.h,
            ),
            padding: EdgeInsets.zero,
            shape: CircleBorder(
              side: BorderSide(color: Theme.of(context).indicatorColor),
            ),
            backgroundColor: Colors.transparent),
        child: SvgPicture.asset(
          icon,
          width: size.w,
          height: size.w,
          color: iconColor,
        ));
  }
}
