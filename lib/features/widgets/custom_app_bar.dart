import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/core/util/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.scaffoldBgColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => AppRoutes.pop(context),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor.withOpacity(.6),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: Icon(
                    Icons.navigate_before,
                    color: AppColors.whiteColor,
                    size: 35.sp,
                  ),
                ),
              ),
            ),
          ),
          AppText(title, 22.sp, FontWeight.w500),
          SizedBox(width: 40.sp)  // Empty space for alignment consistency
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Size of the AppBar
}
