import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/core/util/app_colors.dart';
import 'package:permissions_app/core/util/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool editable;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon,
    this.editable = true,        
    this.onTap,                   
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: !editable, 
        style: AppTextStyles.poppins(
          style: TextStyle(
            color: AppColors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          hintText: label,
          errorStyle: AppTextStyles.poppins(
            style: TextStyle(
              color: Colors.red,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          hintStyle: AppTextStyles.poppins(
            style: TextStyle(
              color: AppColors.hintTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.sp),
            borderSide: BorderSide(color: AppColors.lightTextBlack),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.sp),
            borderSide: BorderSide(color: AppColors.lightTextBlack),
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
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.sp),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
