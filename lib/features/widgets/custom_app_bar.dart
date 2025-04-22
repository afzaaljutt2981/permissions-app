import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';
import 'package:permissions_app/features/splash/view/splash_view.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
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
          
          title == 'User Summary' ? 
          GestureDetector(
            onTap: (){
               final controller =
                      Provider.of<DataSourceController>(context, listen: false);
                      controller.logout();
             AppRoutes.pushAndRemoveUntil(context, PageTransitionType.rightToLeft, SplashView());
            },
            child: Icon(Icons.logout_outlined, color: AppColors.iconLightBlack, size: 30.sp,)):
          SizedBox(width: 40.sp)
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); 
}
