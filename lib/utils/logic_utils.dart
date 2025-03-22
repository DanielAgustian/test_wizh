import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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

  String toRupiah(int money){
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(money);
  }
}
