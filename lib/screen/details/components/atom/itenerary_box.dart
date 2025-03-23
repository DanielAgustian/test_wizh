import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/data/model/itinerary_model.dart';

class IteneraryBox extends StatelessWidget {
  final ItineraryDetailModel data;

  const IteneraryBox({
    super.key,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110.w,
          child: Text(
            data.hour,
            style: TextStyle(
                color: ColorConstant().secondary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.placeName,
              style: TextStyle(
                  color: ColorConstant().black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            ..._descriptionPart(),
            SizedBox(
              height: 10.w,
            ),
          ],
        ))
      ],
    );
  }

  List<Widget> _descriptionPart() {
    if (data.placeDescription == null) {
      return [];
    }
    return [
      SizedBox(
        width: 2.w,
      ),
      Text(
        data.placeDescription!,
        style: TextStyle(color: ColorConstant().colorDarkGray, fontSize: 12.sp),
      ),
    ];
  }
}
