import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/input_validator.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';

class WarehouseFields extends StatelessWidget {
  final TextEditingController controller;
  const WarehouseFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
       String? notNullValidation(String? str) =>
      (str == null || str == '') ? 'This_field_is_required' : null;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.warehouseName,
            style: AppTextStyles.s12w400.copyWith(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: controller,
            validator: (value) => notNullValidation(value),
            decoration: InputDecoration(
              hintText: AppStrings.enterWarehouseName,
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
