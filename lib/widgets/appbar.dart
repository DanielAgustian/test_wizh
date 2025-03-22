import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/utils/logic_utils.dart';

class WhizAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final bool hasBackButton;
  final bool isCenterTitle;
  final Color? bgColor;
  final List<Widget>? rightIcons;

  const WhizAppBar({
    super.key,
    required this.titleWidget,
    this.hasBackButton = false,
    this.isCenterTitle = false,
    this.bgColor,
    this.rightIcons,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? ColorConstant().primary,
      leading: hasBackButton
          ? InkWell(
              onTap: () => LogicUtils().popHandler(context),
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: ColorConstant().black,
                  size: 24.sp,
                ),
              ),
            )
          : null,
      title: titleWidget,
      centerTitle: isCenterTitle,
      actions: rightIcons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class WhizAppbarTitle extends StatelessWidget {
  final String title;
  final Color? txtColor;

  const WhizAppbarTitle({
    super.key,
    required this.title,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: txtColor ?? ColorConstant().white,
        fontSize: 16.sp,
      ),
      textAlign: TextAlign.start,
    );
  }
}
