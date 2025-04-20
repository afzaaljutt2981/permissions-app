// lib/features/auth/presentation/view/gallery_screen.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/features/auth/presentation/provider/privacy_policy_provider.dart';
import 'package:permissions_app/features/auth/presentation/provider/user_info_controller.dart.dart';
import 'package:permissions_app/features/widgets/user_header_card.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_strings.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/features/widgets/custom_app_bar.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';

class UserSummaryScreen extends StatelessWidget {
  const UserSummaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dataSourceController = context.watch<DataSourceController>();
    final privacyPolicyProvider = context.watch<PrivacyPolicyProvider>();
    final userInfoController = context.watch<UserInfoController>();
    final images = dataSourceController.images;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: const CustomAppBar(title: LocaleKeys.summaryTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: AppText(
                LocaleKeys.userInfoHeader,
                16,
                FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            )),
            SliverToBoxAdapter(
              child: UserHeaderCard(
                column: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textForm(LocaleKeys.emailLabel,
                        userInfoController.emailController.text),
                    _textForm(LocaleKeys.nameLabel,
                        userInfoController.nameController.text),
                    _textForm(LocaleKeys.dobLabel,
                        userInfoController.dobController.text),
                    _textForm(
                        LocaleKeys.genderLabel, userInfoController.gender),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: AppText(
                LocaleKeys.privacyPolicyHeader,
                16,
                FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            )),
            SliverToBoxAdapter(
              child: UserHeaderCard(
                column: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textForm(LocaleKeys.statusLabel,
                        privacyPolicyProvider.agreed ? "Accepted" : "Rejected"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
              child: AppText(
                LocaleKeys.dataSourceHeader,
                16,
                FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            )),
            SliverToBoxAdapter(
              child: UserHeaderCard(
                column: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textForm(LocaleKeys.sourceLabel,
                        dataSourceController.selectedSource.toString()),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            images.isEmpty
                ? SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: AppText(
                        LocaleKeys.noImages,
                        15,
                        FontWeight.normal,
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.all(4.sp),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 6.sp,
                        crossAxisSpacing: 6.sp,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          final asset = images[index];
                          return FutureBuilder<Uint8List?>(
                            future: asset.thumbnailDataWithSize(
                              const ThumbnailSize(200, 200),
                            ),
                            builder: (c, snap) {
                              if (snap.connectionState ==
                                      ConnectionState.done &&
                                  snap.hasData) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  child: Image.memory(
                                    snap.data!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                              return Container(color: Colors.grey.shade300);
                            },
                          );
                        },
                        childCount: images.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _textForm(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title, 14, FontWeight.w400),
              AppText(value, 16, FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }
}
