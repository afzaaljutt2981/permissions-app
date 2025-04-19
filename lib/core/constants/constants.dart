import 'package:flutter/cupertino.dart';

class Constants {
  static double screenFullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenFullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
