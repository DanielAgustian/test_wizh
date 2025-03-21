import 'package:flutter/material.dart';
import 'package:test_wizh/screen/component/gallery.dart';
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
        appbar: const WhizAppBar(title: ""), body: _body(context));
  } 

  Widget _body(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          GalleryPart(srcImages: srcImages),
          
        ],
      ),
    );
  }
  
}
