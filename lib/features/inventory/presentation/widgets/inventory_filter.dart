import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class InventoryFilter extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;

  const InventoryFilter({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['allItems', 'inStock', 'low', 'out'];

    return Padding(
      padding: EdgeInsets.only(left: 22.w),
      child: Row(
        children: [
          Icon(Icons.filter_alt_outlined, color: Colors.grey, size: 24),
          Container(
            height: 34.h,
            width: 153.w,
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            decoration: BoxDecoration(
              color: AppColors.whiteLaight,
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                dropdownColor: AppColors.whiteLaight,
                icon: Icon(Icons.keyboard_arrow_down, color: AppColors.gray),
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
