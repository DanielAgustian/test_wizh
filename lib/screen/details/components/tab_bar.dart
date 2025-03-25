import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_wizh/constant/color_constant.dart';

class ScrollTabBar extends StatefulWidget {
  final Function(String) onTapTab;
  const ScrollTabBar({
    super.key,
    required this.onTapTab,
  });
  @override
  State<StatefulWidget> createState() {
    return _ScrollTabBarState();
  }
}

class _ScrollTabBarState extends State<ScrollTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> menuTab = ["Title", "Itinerary", "TnC", "Description"];
  int _currIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menuTab.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverTabBarDelegate(
        tabBar: TabBar(
          isScrollable: true,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.all(0),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 3.0, color: ColorConstant().darkBlue),
              insets: const EdgeInsets.symmetric(horizontal: 16.0)),
          controller: _tabController,
          onTap: onClickTab,
          tabs: _generateTab(),
        ),
      ),
    );
  }

  void onClickTab(int index) {
    String idxName = menuTab[index].toLowerCase();
    widget.onTapTab(idxName);
  }

  List<Tab> _generateTab() {
    List<Tab> tabs = [];
    for (var i = 0; i < menuTab.length; i++) {
      tabs.add(Tab(
        child: SizedBox(
          width: 115.w,
          child: Center(
            child: Text(
              menuTab[i],
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight:
                      _currIndex == i ? FontWeight.bold : FontWeight.normal,
                  color: _currIndex == i
                      ? ColorConstant().darkBlue
                      : ColorConstant().colorGray),
            ),
          ),
        ),
      ));
    }
    return tabs;
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate({required this.tabBar});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}
