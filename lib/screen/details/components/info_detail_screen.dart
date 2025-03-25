import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_wizh/constant/color_constant.dart';
import 'package:test_wizh/constant/text_constant.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/service/services.dart';
import 'package:test_wizh/screen/details/components/atom/detail_box.dart';
import 'package:test_wizh/screen/details/components/atom/term_box.dart';
import 'package:test_wizh/screen/details/components/itenerary_day_box.dart';
import 'package:test_wizh/screen/list/component/rating.dart';
import 'package:test_wizh/widgets/button.dart';

class InfoDetailScreen extends ConsumerStatefulWidget {
  final TripsModel data;
  final Map<String, GlobalKey> widgetKeys;
  const InfoDetailScreen({
    super.key,
    required this.data,
    required this.widgetKeys,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InfoDetailScreenState();
}

class _InfoDetailScreenState extends ConsumerState<InfoDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _titlePart(),
          _divider(context),
          _iteneraries(),
          _divider(context),
          _termAndCondition(),
          _divider(context),
          _description(),
          _divider(context),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom + 80.h,
          ),
        ],
      ),
    );
  }

  Widget _titlePart() {
    return DetailBox(
      key: widget.widgetKeys["title"],
      child: Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: ColorConstant().primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RatingBar(
                    rating: widget.data.rating,
                    limit: 5,
                    size: 11.sp,
                    textSize: 13.sp,
                  )
                ],
              ),
            ),
            WhizButton(
              height: 50.h,
              width: 100.w,
              title: TextConstant().followUs,
              onClick: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _iteneraries() {
    final dataAsync = ref.watch(getItinerariesProvider(widget.data.id));
    return DetailBox(
      key: widget.widgetKeys["itinerary"],
      child: dataAsync.when(
          data: (data) => Wrap(
                children: [
                  ...data.map((item) => IteneraryDayBox(
                        data: item,
                      ))
                ],
              ),
          error: (error, trace) => Container(
                width: 200,
                color: ColorConstant().colorLightGray,
                padding: EdgeInsets.all(10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleExclamation,
                      size: 20.sp,
                      color: ColorConstant().colorDarkGray,
                    ),
                    Text(
                      TextConstant().failedToLoad,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          loading: () => Skeletonizer(child: Container())),
    );
  }

  Widget _termAndCondition() {
    return DetailBox(
        key: widget.widgetKeys["tnc"],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstant().aboutTrip,
              style: TextStyle(
                  color: ColorConstant().primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.h,
            ),
            const TermBox(
              icons: FontAwesomeIcons.paw,
              iconColor: Colors.red,
              text: 'Please make sure you take care of your own pet',
              weightText: FontWeight.bold,
            ),
            const TermBox(
              icons: FontAwesomeIcons.notesMedical,
              iconColor: Colors.green,
              text:
                  'Make sure to notes your groups about your medical condition.',
              weightText: FontWeight.bold,
            ),
            const TermBox(
              icons: FontAwesomeIcons.scaleBalanced,
              iconColor: Colors.blue,
              text: 'Follow the law in the country you visited.',
              weightText: FontWeight.bold,
            ),
          ],
        ));
  }

  Widget _description() {
    return DetailBox(
      key: widget.widgetKeys["description"],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextConstant().aboutTrip,
            style: TextStyle(
                color: ColorConstant().primary,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(
              color: ColorConstant().colorGray,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 12.h,
      color: ColorConstant().colorLightGray.withOpacity(0.3),
    );
  }
}
