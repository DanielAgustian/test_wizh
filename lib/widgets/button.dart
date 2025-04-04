import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class WhizButton extends StatefulWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? rippleColor;
  final Color? txtColor;
  final double? fontSize;
  final Function onClick;
  final EdgeInsetsGeometry? padding;
  const WhizButton({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor,
    this.txtColor,
    this.width = 200,
    this.rippleColor,
    this.fontSize,
    this.padding, this.height,
  });

  @override
  State<WhizButton> createState() => _WhizButtonState();
}

class _WhizButtonState extends State<WhizButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = true; // Toggle state
        });
        Timer(const Duration(milliseconds: 350), () {
          setState(() {
            isPressed = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height ?? 50.h,
        padding: widget.padding ??  EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isPressed
              ? widget.bgColor ?? ColorConstant().primary
              : ColorConstant().darkBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.txtColor ?? Colors.white,
            fontSize: widget.fontSize ?? 14.sp,
          ),
        ),
      ),
    );
  }
}
