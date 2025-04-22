import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Future push(context, transition, Widget page) async {
    return await Navigator.push(
        context, PageTransition(type: transition, child: page));
  }

  static void pop(context) {
    Navigator.of(context).pop();
  }

  static void pushAndRemoveUntil(context, transition,Widget page) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: transition,
            child: page),
            (route) => false);
  }


  static void popAndPush(context, transition, Widget page) {
    Navigator.popAndPushNamed(context, PageTransition(type: transition, child: page).toString());
  }

}