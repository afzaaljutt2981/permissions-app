import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/features/auth/presentation/view/user_info.dart';

class SplashController extends ChangeNotifier {
  

   void startSplashTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
     AppRoutes.pushAndRemoveUntil(context, PageTransitionType.bottomToTop, UserInfoScreen());
    });
  }
}