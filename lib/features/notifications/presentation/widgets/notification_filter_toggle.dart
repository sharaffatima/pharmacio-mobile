import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class NotificationFilterToggle extends StatelessWidget {
  final bool unreadOnly;
  final ValueChanged<bool> onChanged;

  const NotificationFilterToggle({
    super.key,
    required this.unreadOnly,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FilterChip(
            label: AppStrings.unread,
            selected: unreadOnly,
            onTap: () => onChanged(true),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _FilterChip(
            label: AppStrings.all,
            selected: !unreadOnly,
            onTap: () => onChanged(false),
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.forestGreen : AppColors.surface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.s12w400.copyWith(
              color: selected ? AppColors.white : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
