import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';

class WhizImage extends StatelessWidget {
  final bool isRemoteImage;
  final String src;
  final double? height;
  final double? width;

  const WhizImage({
    super.key,
    required this.isRemoteImage,
    required this.src,
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    if (isRemoteImage) {
      return Image.network(
        src,
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return Skeletonizer(child: child);
        },
        errorBuilder: (context, error, stackTrace) {
          return _errorImage();
        },
      );
    }
    return Image.asset(
      src,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _errorImage() {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 300,
      color: ColorConstant().colorLightGray,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.circleExclamation,
              size: 24.sp,
              color: ColorConstant().colorGray,
            ),
            Text(
              TextConstant().failedToLoad,
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorConstant().colorGray,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
