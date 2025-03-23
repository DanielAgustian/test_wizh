import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';
import 'package:test_wizh/utils/logic_utils.dart';
import 'package:test_wizh/widgets/bottom_sheet.dart';
import 'package:test_wizh/widgets/button.dart';

class DetailBottomSheet extends StatefulWidget {
  final int price;

  const DetailBottomSheet({super.key, required this.price});
  @override
  State<StatefulWidget> createState() => _DetailBottomSheetState();
}

class _DetailBottomSheetState extends State<DetailBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WhizBottomSheet(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstant().totalPrice,
              style: TextStyle(
                color: ColorConstant().tertiary,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              LogicUtils().toRupiah(widget.price),
              style: TextStyle(
                color: ColorConstant().secondary,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        WhizButton(
          width: size.width <= 500 ? 170 : 220,
          title: TextConstant().order,
          onClick: () {},
        )
      ],
    ));
  }
}
