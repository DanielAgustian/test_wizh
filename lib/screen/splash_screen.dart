import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/others_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _gotoNextPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: _bgDecoration(),
        child: _logo(),
      ),
    );
  }

  BoxDecoration _bgDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          ColorConstant().primary,
          Colors.blue,
          Colors.blue.withOpacity(0.8),
          Colors.blue.withOpacity(0.5),
          Colors.white
        ],
      ),
    );
  }

  Widget _logo() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: TextConstant().logoHalf1,
          style: TextStyle(
            color: ColorConstant().white,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
          children: <TextSpan>[
            TextSpan(
              text: TextConstant().logoHalf2,
              style: TextStyle(color: ColorConstant().darkBlue),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoNextPage(){
    Timer(Duration(milliseconds:OthersConstant().splashScreenWait ), (){
      context.go("/list");
    });
  }
}
