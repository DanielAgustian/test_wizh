import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/screen/list/component/rating.dart';
import 'package:test_wizh/utils/logic_utils.dart';
import 'package:test_wizh/widgets/images.dart';

class TripsItem extends StatelessWidget {
  final String title;
  final String src;
  final int price;
  final double rating;

  const TripsItem({super.key, required this.title, required this.src, required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: WhizImage(isRemoteImage: true, src: src),
          ),
         
          Padding(
            padding:  EdgeInsets.fromLTRB(10.w, 12.h, 8.w, 12.h),
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
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                RatingBar(rating: rating, limit: 5, size: 16.sp, textSize: 13.sp,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
