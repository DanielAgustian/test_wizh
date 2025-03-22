import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_wizh/constant/color_constant.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double limit;
  final double? size;
  final double? textSize;
  const RatingBar({
    super.key,
    required this.rating,
    required this.limit,
    this.size,
    this.textSize,
  
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...generateStars(),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            "($rating/$limit)",
            style: TextStyle(color: ColorConstant().black, fontSize: textSize),
          ),
        ),
      ],
    );
  }

  List<Widget> generateStars() {
    List<Widget> widget = [];
    double normValue = _rateScale5();
    int fullStars = normValue.floor();
    for (var i = 0; i < fullStars; i++) {
      widget.add(stars(StarsEnum.full));
    }
    var residu = normValue - fullStars;
    if (residu <= 0.4) {
      // Add Empty Stars
      widget.add(stars(StarsEnum.empty));
    } else {
      // Add half stars
      widget.add(stars(StarsEnum.half));
    }
    int printedStars = normValue.ceil();

    for (var i = 0; i < 5 - printedStars; i++) {
      widget.add(stars(StarsEnum.empty));
    }

    return widget;
  }

  Widget stars(StarsEnum type) {
    Color colorStar = Colors.yellowAccent;

    switch (type) {
      case StarsEnum.full:
        return FaIcon(FontAwesomeIcons.star, color: colorStar, size: size);
      case StarsEnum.half:
        return FaIcon(FontAwesomeIcons.starHalf, color: colorStar, size: size);
      case StarsEnum.empty:
        return FaIcon(FontAwesomeIcons.star,
            color: ColorConstant().colorGray, size: size);
      default:
        return Container();
    }
  }

  double _rateScale5() {
    return (rating * 5) / limit;
  }
}

enum StarsEnum { full, half, empty }
