import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class WhizButton extends StatefulWidget {
  final String title;
  final double? width;
  final Color? bgColor;
  final Color? rippleColor;
  final Color? txtColor;
  final double? fontSize;
  final Function onClick;
  const WhizButton({
    super.key,
    required this.title,
    required this.onClick,
    this.bgColor,
    this.txtColor,
    this.width = 250,
    this.rippleColor,
    this.fontSize, 
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
          isPressed = !isPressed; // Toggle state
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: widget.width,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
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
            fontSize: widget.fontSize ?? 16.sp,
          ),
        ),
      ),
    );
  }
}
