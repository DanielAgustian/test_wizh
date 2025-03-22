import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';
import 'package:test_wizh/widgets/button.dart';
import 'package:test_wizh/widgets/images.dart';

class CarouselPart extends StatelessWidget {
  final List<String> pictures;

  const CarouselPart({super.key, required this.pictures});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.width <= 500 ? 300 : 350,
        enlargeFactor: 1.5,
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 8),
      ),
      items: pictures.map((item) {
        return _carrouselChild(item, context);
      }).toList(),
    );
  }

  Widget _carrouselChild(String src, BuildContext context) {
    Color colorFilter = ColorConstant().black;
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      WhizImage(
        width: double.infinity,
        height: double.infinity,
        isRemoteImage: true,
        src: src,
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            colorFilter.withOpacity(0.15),
            colorFilter.withOpacity(0.25),
            colorFilter.withOpacity(0.35),
            colorFilter.withOpacity(0.55),
            colorFilter.withOpacity(0.75),
            colorFilter.withOpacity(0.85),
            colorFilter.withOpacity(0.95),
          ],
        )),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            child: Wrap(
              children: [
                Text(
                  "Maldives Trip Rp. 2 Mio",
                  style: TextStyle(
                      color: ColorConstant().tertiary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: ColorConstant().white,
                        fontSize: 11.sp),
                  ),
                ),
              
                Padding(
                  padding:  EdgeInsets.only(top: 16.h),
                  child: WhizButton(
                    onClick: () {},
                    title: TextConstant().buttonDetails,
                    width: 140.w,
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    fontSize: 13.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
