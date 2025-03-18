import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogicUtils {
  void popHandler(
    BuildContext context, {
    Function? customFunc,
  }) {
    {
      if (context.canPop()) {
        context.pop();
      } else {
        if (customFunc != null) {
          customFunc();
        }
      }
    }
  }
}
