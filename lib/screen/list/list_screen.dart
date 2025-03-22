import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';
import 'package:test_wizh/screen/list/component/carrousel_part.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/input.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> pictures = [
    'https://images.unsplash.com/photo-1707343848552-893e05dba6ac?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=2021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WhizScaffold(
      appbar: WhizAppBar(
        titleWidget: SizedBox(
          width: 0.6.sw,
          child: WhizInput(
            borderColor: ColorConstant().white,
            placeholder: TextConstant().search,
          ),
        ),
        bgColor: null,
        rightIcons: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.w, 5.h, 8.w, 5.h),
              child: FaIcon(
                FontAwesomeIcons.circleQuestion,
                size: 24.sp,
                color: ColorConstant().white,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: size.width <= 500 ? 300 : 350,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: CarouselPart(
              pictures: pictures,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            _listPart(),
          ),
        ),
      ]),
    );
  }

  List<Widget> _listPart() {
    return [];
  }
}
