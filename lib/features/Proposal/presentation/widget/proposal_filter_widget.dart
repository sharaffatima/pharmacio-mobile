import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class ProposalFilterWidget extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;

  const ProposalFilterWidget({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['total', 'pending', 'approved', 'rejected'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        spacing: 5.w,
        children: [
          Icon(Icons.filter_alt_outlined, color: AppColors.gray, size: 24.sp),
          SizedBox(width: 5.w),
          Container(
            height: 34.h,
            width: 153.w,
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            decoration: BoxDecoration(
              color: AppColors.whiteLaight,
              borderRadius: BorderRadius.circular(7.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                dropdownColor: AppColors.whiteLaight,
                icon: Icon(Icons.keyboard_arrow_down, color: AppColors.gray),
                isExpanded: true,
                style: AppTextStyles.filter,
                onChanged: (String? newValue) {
                  if (newValue != null) onChanged(newValue);
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.tr()),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
