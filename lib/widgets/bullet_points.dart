import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

class BulletPoints extends StatelessWidget {
  final int currentIndex;
  final int total;

  const BulletPoints({
    Key? key,
    required this.currentIndex,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: index == currentIndex ? 12.0 : 8.0,
          height: index == currentIndex ? 12.0 : 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? Color(0xFF273766) : Color(0xFFD9DBF1),
          ),
        );
      }),
    );
  }
}




