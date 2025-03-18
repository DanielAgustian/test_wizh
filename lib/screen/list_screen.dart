import 'package:flutter/material.dart';
import 'package:test_wizh/widgets/appbar.dart';
import 'package:test_wizh/widgets/scaffold.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return WhizScaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container();
  }
}
