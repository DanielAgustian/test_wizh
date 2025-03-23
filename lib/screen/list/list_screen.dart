// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';
import 'package:test_wizh/constant/widget_constant.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/service/services.dart';
import 'package:test_wizh/screen/list/component/carrousel_part.dart';
import 'package:test_wizh/screen/list/component/trips_item.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/input.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  List<String> pictures = [
    'https://images.unsplash.com/photo-1707343848552-893e05dba6ac?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=2021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tripsAsync = ref.watch(getTripsProvider);

    return WhizScaffold(
      onRefresh: () async {
        ref.refresh(getTripsProvider);
      },
      appbar: WhizAppBar(
        titleWidget: SizedBox(
          width: 0.7.sw,
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
        _titleList(),
        tripsAsync.when(
          data: (data) => SliverList(
            delegate: SliverChildListDelegate(
              _listPart(data),
            ),
          ),
          error: (Object error, StackTrace stackTrace) => _errorList(),
          loading: () => _loadingList(),
        ),
      ]),
    );
  }

  Widget _titleList() {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: WidgetConstant.paddingStandard,
          vertical: 8.h,
        ),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstant().titleList,
              style: TextStyle(
                  color: ColorConstant().tertiary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              TextConstant().descList,
              style: TextStyle(
                color: ColorConstant().colorDarkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _listPart(List<TripsModel> data) {
    return [
      ...data.map(
        (item) => TripsItem(
          title: item.title,
          src: item.src,
          price: item.price,
          rating: item.rating,
          onClick: () {
            context.push('/list/detail', extra: item);
          },
        ),
      ),
      SizedBox(
        height: 16.h,
      )
    ];
  }

  Widget _loadingList() {
    List<Widget> loader = [];
    for (var i = 0; i < 2; i++) {
      loader.add(TripsItem(
        title: "LoremIpsum",
        src: "afdasfasfafafa",
        price: -1000000,
        rating: 1,
        onClick: () {},
      ));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Skeletonizer(child: loader[index]),
        childCount: loader.length,
      ),
    );
  }

  Widget _errorList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: ColorConstant().colorLightGray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.circleXmark,
                color: ColorConstant().colorDarkGray,
                size: 20.sp,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Error Fetching List",
                style: TextStyle(
                  color: ColorConstant().colorDarkGray,
                  fontSize: 18.sp,
                ),
              )
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }
}
