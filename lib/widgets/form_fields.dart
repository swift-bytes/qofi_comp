import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormFields extends StatelessWidget {

  const FormFields({super.key, required this.hintText});
  final String hintText;
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            fontSize: 15.ft,
            color: Color(0xFF878787),
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8.0),

        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/svg/profile.svg',
                  width: 18.sp,
                ),
            ),
            hintText: "Enter Username",
            hintStyle: TextStyle(
              color: Color(0xFF878787),
              fontSize: 15.ft,
              fontWeight: FontWeight.w500,
            ), 
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0)
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0)
            ),
          ),
        ),

        const SizedBox(height: 8.0),

        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/svg/profile.svg',
                  width: 18.sp,
                ),
            ),

            hintText: "Enter Username",
            hintStyle: TextStyle(
              color: Color(0xFF878787),
              fontSize: 15.ft,
              fontWeight: FontWeight.w500,
            ), 

            suffixIcon: TextButton(
              onPressed: () {},
              child: SvgPicture.asset('assets/svg/eye-slash.svg'),
            ),

            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0)
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0)
            ),
          ),
        ),

      ],
    );
  }
}