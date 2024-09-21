import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliderCards extends StatelessWidget {
  const SliderCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(24), // 24px padding all around
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                Text(
                  '20% Off First Subscription! Use code',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '00FI20',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(92, 32), // Width and height
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                  ),
                  child: const Text('Order Now'),
                ),
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          );
        },
      ),
    );
  }
}
