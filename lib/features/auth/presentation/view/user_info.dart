import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_images.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/core/util/app_strings.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:permissions_app/core/util/app_text_style.dart';
import 'package:permissions_app/core/util/utils.dart';
import 'package:permissions_app/features/auth/presentation/provider/user_info_controller.dart.dart';
import 'package:permissions_app/features/auth/presentation/view/data_source.dart';
import 'package:permissions_app/features/widgets/app_primary_button.dart';
import 'package:permissions_app/features/widgets/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: SafeArea(
        child: Consumer<UserInfoController>(
          builder: (context, userInfo, _) {
            return Padding(
              padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 10.h),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 45.r,
                                backgroundImage: AssetImage(AppImages.appIcon),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            15.verticalSpace,
                            Center(
                              child: AppText(
                                LocaleKeys.welcomeBack,
                                22.sp,
                                FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            5.verticalSpace,
                            Center(
                              child: AppText(
                                LocaleKeys.completeProfile,
                                16.sp,
                                FontWeight.w400,
                                color: AppColors.hintTextColor,
                              ),
                            ),
                            25.verticalSpace,
                            _buildLabel(LocaleKeys.fullName),
                            CustomTextFormField(
                              label: LocaleKeys.fullName,
                              controller: userInfo.nameController,
                              validator: (val) => val == null || val.isEmpty
                                  ? LocaleKeys.fullNameRequired
                                  : null,
                            ),
                            10.verticalSpace,
                            _buildLabel(LocaleKeys.emailAddress),
                            CustomTextFormField(
                              label: LocaleKeys.emailAddress,
                              controller: userInfo.emailController,
                              validator: userInfo.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            10.verticalSpace,
                            _buildLabel(LocaleKeys.phoneNumber),
                            CustomTextFormField(
                              label: LocaleKeys.phoneNumber,
                              controller: userInfo.phoneController,
                              validator: userInfo.validatePhone,
                              keyboardType: TextInputType.phone,
                            ),
                            10.verticalSpace,
                            _buildLabel(LocaleKeys.dateOfBirth),
                            CustomTextFormField(
                              editable: false,
                              onTap: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (picked != null) {
                                  String formattedDOB =
                                      "${picked.year}/${picked.month}/${picked.day}";
                                  userInfo.setDOB(formattedDOB);
                                }
                              },
                              label: LocaleKeys.dateOfBirth,
                              controller: userInfo.dobController,
                              validator: (val) => val == null || val.isEmpty
                                  ? LocaleKeys.dobRequired
                                  : null,
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: AppColors.iconLightBlack,
                              ),
                            ),
                            10.verticalSpace,
                            _buildLabel(LocaleKeys.gender),
                            SizedBox(
                              height: 85.h,
                              child: DropdownButtonFormField<String>(
                                value: userInfo.gender,
                                validator: (val) => val == null || val.isEmpty
                                    ? LocaleKeys.genderRequired
                                    : null,
                                style: AppTextStyles.poppins(
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 20.h),
                                  hintText: LocaleKeys.gender,
                                  hintStyle: AppTextStyles.poppins(
                                    style: TextStyle(
                                      color: AppColors.hintTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  errorStyle: AppTextStyles.poppins(
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    borderSide: BorderSide(
                                        color: AppColors.lightTextBlack),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    borderSide: BorderSide(
                                        color: AppColors.lightTextBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    borderSide: BorderSide(
                                      color: AppColors.lightTextBlack,
                                      width: 1.5,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.sp),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                dropdownColor: Colors.white,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text(
                                      'Male',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text(
                                      'Female',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: Text(
                                      'Other',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: userInfo.setGender,
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppPrimaryButton(
                    () {
                      if (userInfo.validateFields(_formKey)) {
                        Utils.showToast(LocaleKeys.userInfoSaved);
                        AppRoutes.push(context, PageTransitionType.rightToLeft, DataSourcesScreen());
                      }
                    },
                    AppText(
                      LocaleKeys.continueText,
                      20.sp,
                      FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        children: [
          AppText(title, 19.sp, FontWeight.w500),
          AppText(' *', 19.sp, FontWeight.w500, color: Colors.red),
        ],
      ),
    );
  }
}
