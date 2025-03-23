import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/widget_constant.dart';

class WhizBottomSheet extends StatelessWidget {
  final Widget child;

  const WhizBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: WidgetConstant.paddingStandard, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: ColorConstant().white,
          boxShadow: [
            BoxShadow(
              color: ColorConstant().colorLightGray,
              offset: const Offset(0, -5),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            )
          ]),
      child: child,
    );
  }
}
