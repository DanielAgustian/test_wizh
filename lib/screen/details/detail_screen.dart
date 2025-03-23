import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_wizh/data/model/trips_model.dart';
import 'package:test_wizh/data/service/services.dart';
import 'package:test_wizh/screen/details/components/bottom_sheet.dart';
import 'package:test_wizh/screen/details/components/info_detail_screen.dart';
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
  @override
  void initState() {
    super.initState();
    ref.refresh(getItinerariesProvider(widget.model.id));
    srcImages.add(widget.model.src);
  }

  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
      onRefresh: () async {},
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
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: size.width <= 500 ? 300 : 350,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
              background: WhizImage(isRemoteImage: true, src: widget.model.src)),
        ),
        InfoDetailScreen(data: widget.model),
       
      ],
    );
  }
}
