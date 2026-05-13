import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import '../../../../core/constants/text_style.dart';
// import '../../../../core/helpers/space_helpers.dart';

class ProposalCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final int itemsCount;
  final double totalCost;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;

  const ProposalCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.itemsCount,
    required this.totalCost,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(left: 22.w, right: 16.w, top: 11.h),
      padding: EdgeInsets.all(11.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.bluePrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.description_rounded,
                  color: AppColors.bluePrimary,
                  size: 22.sp,
                ),
              ),
              horizontalSpace(8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.proposalCardTitle),
                    verticalSpace(4.h),
                    Text(date, style: AppTextStyles.proposalDate),
                  ],
                ),
              ),
              _buildStatusTag(),
            ],
          ),
          Divider(height: 32.h, thickness: 0.8, color: AppColors.border),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(
                AppStrings.items,
                '$itemsCount ${AppStrings.itemsSuffix}',
              ),
              _buildInfoColumn(
                AppStrings.totalCost,
                "\$${totalCost.toStringAsFixed(2)}",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            status == AppStrings.pending
                ? Icons.access_time
                : status == AppStrings.approved
                ? Icons.check_circle_outline
                : Icons.cancel_outlined,
            size: 14.sp,
            color: textColor,
          ),
          horizontalSpace(4),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12.sp),
        ),
        verticalSpace(4.h),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ],
    );
  }
}
