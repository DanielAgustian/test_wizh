import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class LogicUtils {
  void popHandler(
    BuildContext context, {
    Function? customFunc,
  }) {
    {
      if (kDebugMode) {
        print("Back Here! ${context.canPop()}");
      }
      if (context.canPop()) {
        context.pop();
      } else {
        if (customFunc != null) {
          customFunc();
        }
      }
    }
  }

  String toRupiah(int money) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(money);
  }

  String toReadableDate(String date) {
    DateTime dataDate = DateTime.parse(date);
    return DateFormat("EEEE, d MMM y").format(dataDate);
  }

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
