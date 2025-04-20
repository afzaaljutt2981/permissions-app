import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';

class UserHeaderCard extends StatelessWidget {
  const UserHeaderCard({
    required this.column
  });

  final Column column;

  @override
  Widget build(BuildContext context) {
    return Card(
         color: AppColors.whiteColor, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp),  ),
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: column
      ),
    );
  }
}
