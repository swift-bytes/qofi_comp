import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qofi_comp/constants/ui_helpers.dart';
import 'package:sizer/sizer.dart';

import '../constants/hex_color.dart';

class OtpInputWidget extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final double? boxWidth;

  const OtpInputWidget({
    super.key,
    this.length = 4,
    required this.onCompleted,
    this.boxWidth,
  });
  @override
  State<StatefulWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index,BuildContext context) {
    if (value.length == 1) {
      if (index < widget.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    if (controllers.every((controller) => controller.text.length == 1)) {
      FocusScope.of(context).unfocus();
      String otp = controllers.map((controller) => controller.text).join();
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: widget.boxWidth ?? 18.w,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.ft,fontWeight: FontWeight.w500,
            fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              filled: controllers[index].text.isEmpty,
              counterText: '',
              contentPadding: EdgeInsets.symmetric(horizontal:  3.w,vertical: 0.8.h),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: BorderSide(
                  color: HexColor("#EAEAEA")
                )
              ), enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: BorderSide(
                  color: HexColor("#EAEAEA")
                )
              ),
            ),
            onChanged: (value) => _onChanged(value, index,context),
          ),
        );
      }),
    );
  }
}
