import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
class RoundBorderedButton extends StatelessWidget {
  const RoundBorderedButton({super.key, required this.onPressed, required this.icon});
final VoidCallback onPressed;
final String icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed,
        style: TextButton.styleFrom(
            minimumSize: Size(
              5.h,
              5.h,
            ),
            shape: CircleBorder(
              side: BorderSide(color: Theme.of(context).indicatorColor),
            ),
            backgroundColor: Colors.transparent),
        child: SvgPicture.asset(icon,

        ));
  }
}
