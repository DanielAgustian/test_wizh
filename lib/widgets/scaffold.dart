import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_wizh/utils/logic_utils.dart';

class WhizScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  final Function? backFunction;
  final Future<void> Function() onRefresh;
  final Widget? bottomSheet;
  const WhizScaffold({
    super.key,
    required this.body,
    this.appbar,
    this.backFunction,
    required this.onRefresh,
    this.bottomSheet,
  });
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print(didPop);
        if (!didPop) {
          LogicUtils().popHandler(context, customFunc: backFunction);
        }
      },
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Scaffold(
            appBar: appbar,
            body: body,
            bottomSheet: bottomSheet,
          ),
        ),
      ),
    );
  }
}
