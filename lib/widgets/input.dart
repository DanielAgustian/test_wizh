import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class WhizInput extends StatelessWidget {
  final Color? borderColor;
  final String? placeholder;
  final Color? bgColor;
  final Color? errorColor;
  const WhizInput({
    super.key,
    this.borderColor,
    this.placeholder,
    this.bgColor,
    this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 14.sp,
        color: ColorConstant().darkBlue,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        filled: true,
        isDense: true,
        fillColor: bgColor ?? ColorConstant().white,
        border: _commonBorder(borderColor),
        focusedBorder: _commonBorder(borderColor),
        errorBorder: _commonBorder(errorColor ?? borderColor),
        enabledBorder: _commonBorder(borderColor),
        focusedErrorBorder: _commonBorder(errorColor ?? borderColor),
        hintText: placeholder,
        hintStyle:
            TextStyle(color: ColorConstant().colorLightGray, fontSize: 14.sp),
      ),
    );
  }

  InputBorder _commonBorder(Color? bColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: bColor ?? Colors.red, width: 2),
    );
  }
}
