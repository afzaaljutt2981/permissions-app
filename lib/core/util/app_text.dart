// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_text_style.dart';


class AppText extends StatelessWidget {
  AppText(
    this.text,
    this.fontSize,
    this.fontWeight, {
    super.key,
    this.textAlign,
    this.decoration,
    this.color = AppColors.black,
  });
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color? color;
  TextAlign? textAlign;
  TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: AppTextStyles.poppins(
          style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: color,
              decoration: decoration ?? TextDecoration.none,
              decorationColor: Color(0xFF0962A9))),
    );
  }
}
