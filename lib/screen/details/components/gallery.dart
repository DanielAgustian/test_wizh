import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/widgets/images.dart';

class GalleryPart extends StatefulWidget {
  final List<String> srcImages;

  const GalleryPart({super.key, required this.srcImages});
  @override
  State<StatefulWidget> createState() => _GalleryPartState();
}

class _GalleryPartState extends State<GalleryPart> {
  late List<String> srcImages;
  int currData = 0;
  @override
  void initState() {
    srcImages = widget.srcImages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (srcImages.isEmpty) {
      return Container();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 10,
          child: WhizImage(
            isRemoteImage: true,
            src: srcImages[0],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Wrap(
          children: _clickerWidgets(),
        ),
      ],
    );
  }

  List<Widget> _clickerWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < srcImages.length; i++) {
      widgets.add(
        _ImageClicker(
          onClick: _onClickPicture(i),
          isChosen: currData == i,
          src: srcImages[i],
        ),
      );
    }
    return widgets;
  }

  _onClickPicture(int idx) {
    if (idx == currData) {
      return;
    }
    setState(() {
      currData = idx;
    });
  }
}

class _ImageClicker extends StatelessWidget {
  final Function() onClick;
  final bool isChosen;
  final String src;

  const _ImageClicker(
      {super.key,
      required this.onClick,
      required this.isChosen,
      required this.src});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: FractionallySizedBox(
        widthFactor: 0.25,
        child: Container(
          margin: EdgeInsets.only(right: 4.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstant().tertiary,
            ),
          ),
          child: WhizImage(
            src: src,
            isRemoteImage: true,
          ),
        ),
      ),
    );
  }
}
