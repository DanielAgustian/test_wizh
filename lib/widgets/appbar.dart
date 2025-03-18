import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/utils/logic_utils.dart';

class WhizAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  final bool isCenterTitle;

  const WhizAppBar(
      {super.key,
      required this.title,
      this.hasBackButton = false,
      this.isCenterTitle = true});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton
          ? InkWell(
            onTap: () => LogicUtils().popHandler(context),
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: ColorConstant().black,
                  size: 15.sp,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
