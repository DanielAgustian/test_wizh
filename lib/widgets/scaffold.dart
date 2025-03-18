import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wizh/utils/logic_utils.dart';

class WhizScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  final Function? backFunction;
  const WhizScaffold({super.key, required this.body, this.appbar, this.backFunction});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          LogicUtils().popHandler(
            context,
            customFunc: backFunction
          );
        }
      },
      child: Scaffold(
        appBar: appbar,
        body: body,
      ),
    );
  }
}
