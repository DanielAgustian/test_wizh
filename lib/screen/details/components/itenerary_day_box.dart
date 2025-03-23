import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/data/model/itinerary_model.dart';
import 'package:test_wizh/screen/details/components/atom/itenerary_box.dart';
import 'package:test_wizh/utils/logic_utils.dart';

class IteneraryDayBox extends StatelessWidget {
  final ItineraryModel data;

  const IteneraryDayBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5.h, 10.w, 10.h),
      child: SizedBox(
        width: size.width <= 500 ? size.width : 500,
        child: Column(
          children: [
            _title(),
            SizedBox(
              height: 12.h,
            ),
            ...data.details.map((item) => IteneraryBox(
                  data: item,
                ))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        Text(
          LogicUtils().toReadableDate(data.date),
          style: TextStyle(
            fontSize: 15.sp,
            color: ColorConstant().primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: Container(
          height: 1,
          width: double.infinity,
          color: ColorConstant().primary,
        ))
      ],
    );
  }
}
