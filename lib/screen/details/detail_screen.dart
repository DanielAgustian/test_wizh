import 'package:flutter/material.dart';
import 'package:test_wizh/screen/details/components/gallery.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> srcImages = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
        onRefresh: () async {
          
        },
        appbar: const WhizAppBar(
          hasBackButton: true,
          titleWidget: WhizAppbarTitle(title: ""),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: size.width <= 500 ? 300 : 350,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
              background: GalleryPart(
            srcImages: srcImages,
          )),
        ),
      ],
    );
  }
}
