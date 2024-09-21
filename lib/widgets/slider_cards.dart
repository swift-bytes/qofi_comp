import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliderCards extends StatelessWidget {
  const SliderCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 142 / 812 * 100.h,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                colors: [Color(0xFFDA2F46), Color(0xFF346DC2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '20% Off First Subscription!\nUse code ',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 23.4 / 18, 
                        ),
                      ),
                      TextSpan(
                        text: '00FI20',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 23.4 / 18, 
                        ),
                      ),
                    ]
                  ),
                ),
                
                const SizedBox(height: 24),

                TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF1F2125),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: const Text(
                    'Order Now',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      height: 15.6 / 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            
          );
        },
      ),
    );
  }
}
