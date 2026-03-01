import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/helpers/space_helpers.dart';

class ProposalCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final int itemsCount;
  final double totalCost;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22.w, right: 16.w, top: 11.h),
      padding: EdgeInsets.all(11.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
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
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.description_rounded,
                  color: Colors.blue,
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
          Divider(height: 32.h, thickness: 0.8, color: Colors.grey.shade200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn("Items", "$itemsCount items"),
              _buildInfoColumn(
                "Total cost",
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
            status == "Pending"
                ? Icons.access_time
                : status == "Approved"
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
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ],
    );
  }
}
