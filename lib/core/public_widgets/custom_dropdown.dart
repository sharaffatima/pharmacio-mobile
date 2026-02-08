import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.hintText,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [BoxShadow(color: AppColors.greyStone, blurRadius: 10.r)],
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        initialValue: value,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: AppColors.white,
        ),
        icon: Icon(Icons.arrow_drop_down_outlined, color: AppColors.greyStone),
        hint: Text(
          hintText,
          style: AppTextStyles.font14GreyMedium,
          overflow: TextOverflow.ellipsis,
        ),
        items: items
            .map(
              (type) => DropdownMenuItem(
                value: type,
                child: Text(type, style: TextStyle(color: AppColors.greyStone)),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
