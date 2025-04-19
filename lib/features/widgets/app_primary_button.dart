

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
class AppPrimaryButton extends StatelessWidget {
  double? height;
  final VoidCallback onTap;
  Widget buttonText;
  double? fontSize;
  double? width;
  Color? color;
  double? radius;
  AppPrimaryButton(this.onTap, this.buttonText,
      {this.height,
      Key? key,
      this.width,
      this.fontSize = 14,
      this.color,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 65.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 40.r),
            color: color ?? AppColors.primaryColor),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: buttonText,
        ));
  }
}
