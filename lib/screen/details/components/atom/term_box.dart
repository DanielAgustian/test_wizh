import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_wizh/constant/color_constant.dart';

class TermBox extends StatelessWidget {
  final IconData icons;
  final Color iconColor;
  final String text;
  final FontWeight weightText;

  const TermBox({
    super.key,
    required this.icons,
    required this.iconColor,
    required this.text,
    required this.weightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: 25.w,
            child: Center(
              child: FaIcon(
                icons,
                color: iconColor,
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(
                fontWeight: weightText,
                color: ColorConstant().black,
                fontSize: 13.sp),
          ))
        ],
      ),
    );
  }
}
