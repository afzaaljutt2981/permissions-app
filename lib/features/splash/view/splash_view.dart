import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_images.dart';
import 'package:permissions_app/features/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SplashController>(context, listen: false)
          .startSplashTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Center(
        child: Image.asset(
          AppImages.appIcon,
          width: 200.sp,
        ),
      ),
    );
  }
}
