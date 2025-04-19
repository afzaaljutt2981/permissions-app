import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_text.dart';

class AnimatedRadioButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const AnimatedRadioButton({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.grey.shade100,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.lightTextBlack,
          width: isSelected ? 1.5.sp : 1.sp,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.lightTextBlack,
            ),
            12.horizontalSpace,
            Image.asset(iconPath, width: 30.sp, height: 24),
            12.horizontalSpace,
            Expanded(
                child: AppText(
              label,
              16.sp,
              isSelected ? FontWeight.w500 : FontWeight.normal,
              color: isSelected ? AppColors.primaryColor : Colors.black87,
            )),
          ],
        ),
      ),
    );
  }
}
