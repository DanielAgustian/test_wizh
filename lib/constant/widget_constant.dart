import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class WidgetConstant {
  static BoxShadow whizShadow = BoxShadow(
    color: ColorConstant().colorLightGray,
    offset: const Offset(
      5.0,
      5.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 2.0,
  );

  static double paddingStandard = 8.w;
}
