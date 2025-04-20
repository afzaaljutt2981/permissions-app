import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permissions_app/core/util/app_colors.dart';

class Utils {
  static double screenFullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenFullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void showToast(String message,
      {ToastGravity gravity = ToastGravity.BOTTOM,  Color color =  AppColors.primaryColor, }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
