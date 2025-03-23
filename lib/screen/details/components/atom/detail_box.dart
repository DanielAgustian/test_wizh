import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class DetailBox extends StatelessWidget {
  final Widget child;
  final double? height;
  const DetailBox({super.key, required this.child,  this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: ColorConstant().white,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      child: child,
    );
  }
}
