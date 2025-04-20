import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissions_app/core/enums/data_source_enum.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/core/util/app_strings.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/core/util/utils.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';
import 'package:permissions_app/features/auth/presentation/view/summery_screen.dart';
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
                        LocaleKeys.fullPrivacyPolicyText,
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
                          LocaleKeys.ok,
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
      appBar: const CustomAppBar(title: LocaleKeys.privacyPolicyTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              LocaleKeys.privacyPolicyAgreement,
              20.sp,
              FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            16.verticalSpace,
            AppText(
              LocaleKeys.reviewAndAgreePolicy,
              16.sp,
              FontWeight.w400,
              color: AppColors.black,
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
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AppText(LocaleKeys.agreeWith, 12.sp, FontWeight.normal),
                      GestureDetector(
                        onTap: () => _showFullPolicyPopup(context),
                        child: AppText(
                          LocaleKeys.privacyPolicy,
                          12.sp,
                          FontWeight.w600,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      AppText(' & ', 13.sp, FontWeight.normal),
                      GestureDetector(
                        onTap: () => _showFullPolicyPopup(context),
                        child: AppText(
                          LocaleKeys.termsAndConditions,
                          12.sp,
                          FontWeight.w600,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppPrimaryButton(
              () async {
                if (provider.agreed) {
                  final controller = Provider.of<DataSourceController>(context, listen: false);
                     final ds = controller.selectedSource;
                if (ds == DataSourceEnum.mediaAccess) {
                  final ok = await controller.requestGalleryPermission();
                  if (!ok) {
                    Utils.showToast(
                   LocaleKeys.permissionDenied,  
                      color: Colors.red,
                    );
                    return;
                  }
                  await controller.loadAllImages();
                  AppRoutes.push(context, PageTransitionType.rightToLeft,
                      UserSummaryScreen());
                }
                } else {
                  Utils.showToast(LocaleKeys.acceptPrivacyPolicyWarning,
                      color: Colors.red);
                }
              },
              AppText(
                LocaleKeys.generateSummary,
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
