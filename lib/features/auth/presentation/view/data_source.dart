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
import 'package:permissions_app/features/auth/presentation/view/privacy_policy.dart';
import 'package:permissions_app/features/auth/presentation/view/summery_screen.dart';
import 'package:permissions_app/features/widgets/animated_radio_button.dart';
import 'package:permissions_app/features/widgets/app_primary_button.dart';
import 'package:provider/provider.dart';
import 'package:permissions_app/features/widgets/custom_app_bar.dart';

class DataSourcesScreen extends StatelessWidget {
  const DataSourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataSourceController>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(title: LocaleKeys.selectDataSourceTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            AppText(
              LocaleKeys.choosePreferredDataSource,
              20.sp,
              FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            15.verticalSpace,
            ...DataSourceEnum.values.map(
              (source) => AnimatedRadioButton(
                label: source.label,
                iconPath: source.iconPath,
                isSelected: controller.isSelected(source),
                onTap: () => controller.selectSource(source),
              ),
            ),
            const Spacer(),
            AppPrimaryButton(
              () async {


                if(controller.selectedSource != null ){
    AppRoutes.push(context, PageTransitionType.rightToLeft,
                      PrivacyPolicyScreen());
                }
                else{
            Utils.showToast(
                   LocaleKeys.selectDataSourceWarning,
                      color: Colors.red,
                    );
                }


                // final ds = controller.selectedSource;
                // if (ds == DataSourceEnum.mediaAccess) {
                //   final ok = await controller.requestGalleryPermission();
                //   if (!ok) {
                //     Utils.showToast(
                //       'Please allow photo access in Settings',
                //       color: Colors.red,
                //     );
                //     return;
                //   }
                //   await controller.loadAllImages();
                //   AppRoutes.push(context, PageTransitionType.rightToLeft,
                //       PrivacyPolicyScreen());
                // }

              },
              AppText(
                LocaleKeys.continueText,
                20.sp,
                FontWeight.w600,
                color: AppColors.whiteColor,
              ),
            ),
            35.verticalSpace,
          ],
        ),
      ),
    );
  }
}
