import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/widget_constant.dart';
import 'package:test_wizh/screen/list/component/rating.dart';
import 'package:test_wizh/utils/logic_utils.dart';
import 'package:test_wizh/widgets/images.dart';

class TripsItem extends StatelessWidget {
  final String title;
  final String src;
  final int price;
  final double rating;
  final void Function() onClick;
  const TripsItem({
    super.key,
    required this.title,
    required this.src,
    required this.price,
    required this.rating,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.fromLTRB(6.w, 12.h, 6.w, 0.h),
        width: 1.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              WidgetConstant.whizShadow,
            ],
            color: ColorConstant().white),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: WhizImage(
                isRemoteImage: true,
                src: src,
                width: 120.w,
                height: 120.w,
              ),
            ),
            Container(
              height: 120.w,
              padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: ColorConstant().primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        LogicUtils().toRupiah(price),
                        style: TextStyle(
                          color: ColorConstant().secondary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  RatingBar(
                    rating: rating,
                    limit: 5,
                    size: 16.sp,
                    textSize: 13.sp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
