import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
        appbar: const WhizAppBar(title: ""), body: _body(context));
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: size.width <= 500 ? 250 : 300,
        floating: false,
        pinned: false,
        flexibleSpace: FlexibleSpaceBar(background: _carrouselPart()),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          _listPart(),
        ),
      ),
    ]);
  }

  Widget _carrouselPart() {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }

  List<Widget> _listPart() {
    return [];
  }
}
