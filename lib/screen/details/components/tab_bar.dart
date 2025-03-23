import 'package:flutter/material.dart';

class ScrollTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollTabBarState();
  }
}

class _ScrollTabBarState extends State<ScrollTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> menuTab = ["Title", "Itinerary", "TnC", "Description"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menuTab.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Tab Clicked: ${_tabController.index}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverTabBarDelegate(
        tabBar: TabBar(
          controller: _tabController,
          tabs: [
            ...menuTab.map(
              (item) => Tab(
                text: item,
              ),
            ),
          ],
        ),
      ),
    );
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
