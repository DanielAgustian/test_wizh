import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wizh/constant/color_constant.dart';

class WhizDialog extends StatelessWidget {
  final Widget child;
  final BuildContext context;
  final Function? onClose;

  const WhizDialog({
    super.key,
    required this.context,
    this.onClose,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: ColorConstant().white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: IntrinsicHeight(
            child: Stack(
             
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      if (onClose != null) {
                        onClose!();
                      }
                      GoRouter.of(context).pop();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
                      color: Colors.red,
                      size: 24.sp,
                    ),
                  ),
                ),
                
                child
              ],
            ),
          ),
        ));
  }

  static void show(BuildContext context,
      {required Widget child, Function()? onClose, bool? isDismissable}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissable ?? true,
      builder: (context) => WhizDialog(
        onClose: onClose,
        context: context,
        child: child,
      ),
    );
  }
}
