import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/service/services.dart';
import 'package:test_wizh/screen/details/components/bottom_sheet.dart';
import 'package:test_wizh/screen/details/components/info_detail_screen.dart';
import 'package:test_wizh/screen/details/components/tab_bar.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/images.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final TripsModel model;
  const DetailScreen({
    super.key,
    required this.model,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  List<String> srcImages = [];
  late ScrollController _scrollController;
  Map<String, GlobalKey> widgetKeys = {
    "title": GlobalKey(),
    "itinerary": GlobalKey(),
    "tnc": GlobalKey(),
    "description": GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    refresh();
    srcImages.add(widget.model.src);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {}

  void refresh() {
    ref.refresh(getItinerariesProvider(widget.model.id));
  }

  void onTapTab(String name) {
    final context = widgetKeys[name]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
      onRefresh: () async {
        refresh();
      },
      appbar: WhizAppBar(
        hasBackButton: true,
        titleWidget: WhizAppbarTitle(
          title: widget.model.title,
        ),
      ),
      body: _body(context),
      bottomSheet: DetailBottomSheet(
        price: widget.model.price,
      ),
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: size.width <= 500 ? 300 : 350,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
              background:
                  WhizImage(isRemoteImage: true, src: widget.model.src)),
        ),
        ScrollTabBar(
          onTapTab: onTapTab,
        ),
        InfoDetailScreen(
          data: widget.model,
          widgetKeys: widgetKeys,
        ),
      ],
    );
  }
}
