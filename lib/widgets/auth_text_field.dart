import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
import 'package:sizer/sizer.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.e});
  final Map e;
  @override
  Widget build(BuildContext context) {
    if (e["type"] == "phone") {
      return Row(
        children: [
          Container(
            width: 25.w,
            padding: EdgeInsets.all(0.5.w),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: const Color(0xffE5E5E5), width: 2),
            ),
            child: CountryCodePicker(
              padding: EdgeInsets.zero,
              dialogSize: Size(90.w, 80.h),
              boxDecoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffD6D6D6), width: 2),
              ),
              dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              textStyle: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 15.ft,
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: AuthTextField(e: {
              ...e,
              "type": "number",
            }),
          ),
        ],
      );
    }
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).canvasColor,
        fontSize: 15.ft,
      ),
      onChanged: (value) {
        e['onChanged']?.call(value);
      },
      obscureText: e['obscure'] ?? false,
      keyboardType: e['keyboardType'],
      obscuringCharacter: "*",
      autovalidateMode: AutovalidateMode.onUnfocus,
      decoration: InputDecoration(
        errorText: e['error']?.toString().trs(context),
        hintText: e['hint']?.toString().trs(context),
        errorStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 13.ft,
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            color: Color(0xff878787),
            fontSize: 14.ft,
            fontWeight: FontWeight.w500),
        filled: true,
        prefixIcon: e["prefix"] == null
            ? null
            : SvgPicture.asset(
                e["prefix"],
                width: 5.5.w,
                height: 5.5.w,
              ),
        suffixIcon: e["suffixIcon"] == null
            ? null
            : TextButton(
                onPressed: e['onSuffixPressed'],
                style: iconButtonStyle,
                child: SvgPicture.asset(
                  e["suffixIcon"],
                  width: 5.5.w,
                  height: 5.5.w,
                ),
              ),
        isDense: true,
        fillColor: Theme.of(context).cardColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 14.w,
          minHeight: 0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: const BorderSide(
            color: Color(0xffD6D6D6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: const BorderSide(
            color: Color(0xffD6D6D6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
