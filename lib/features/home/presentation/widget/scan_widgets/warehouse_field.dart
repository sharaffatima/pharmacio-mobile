import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';

class WarehouseField extends StatelessWidget {
  final TextEditingController controller;
  const WarehouseField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Warehouse Name',
            style: AppTextStyles.s12w400.copyWith(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter warehouse name',
              border: InputBorder.none,
              hintStyle: AppTextStyles.s12w400.copyWith(color: AppColors.gray),
            ),
            style: AppTextStyles.s14w400,
          ),
        ],
      ),
    );
  }
}
