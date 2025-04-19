import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/features/widgets/app_primary_button.dart';
import 'package:permissions_app/features/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../provider/privacy_policy_provider.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  void _showFullPolicyPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) => Stack(
        children: [
          Center(
            child: Container(
              width: 0.9.sw,
              height: 0.6.sh,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: AppText(
                        '''This app requires access to certain device permissions, such as location, contacts, and storage, to provide a better user experience. These permissions help us enhance functionality like GPS navigation, in-app contact management, and secure file access.

We value your privacy and ensure that any data collected is used solely to improve app performance and deliver personalized services. We do not sell or share your personal information with third parties without your explicit consent.

By using this app, you agree to the collection and use of your information in accordance with this policy. You can revoke permissions at any time via your device settings.

This app requires access to certain device permissions, such as location, contacts, and storage, to provide a better user experience. These permissions help us enhance functionality like GPS navigation, in-app contact management, and secure file access.

We value your privacy and ensure that any data collected is used solely to improve app performance and deliver personalized services. We do not sell or share your personal information with third parties without your explicit consent.

By using this app, you agree to the collection and use of your information in accordance with this policy. You can revoke permissions at any time via your device settings.''',
                        15.sp,
                        FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: AppPrimaryButton(
                        () => AppRoutes.pop(context),
                        AppText(
                          "OK",
                          18.sp,
                          FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                        width: 80.w,
                        radius: 5.sp,
                        height: 48.h,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrivacyPolicyProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: const CustomAppBar(title: 'Privacy Policy'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Privacy Policy Agreement',
              20.sp,
              FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            16.verticalSpace,
            AppText(
              'Please review and agree to our Privacy Policy and Terms of Service.',
              16.sp,
              FontWeight.w400,
              color: AppColors.black,
            ),
            20.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'View our ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => _showFullPolicyPopup(context),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => provider.toggleAgreement(!provider.agreed),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.primaryColor, width: 2.sp),
                      color: provider.agreed
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                    width: 24.sp,
                    height: 24.sp,
                    child: provider.agreed
                        ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                        : null,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: AppText(
                    'I agree to the Privacy Policy and Terms of Service.',
                    14.sp,
                    FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppPrimaryButton(
              () {
                if (provider.agreed) {
                  // Navigator.pushNamed(context, '/summary');
                }
              },
              AppText(
                "Generate Summary",
                18.sp,
                FontWeight.w600,
                color: AppColors.whiteColor,
              ),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
