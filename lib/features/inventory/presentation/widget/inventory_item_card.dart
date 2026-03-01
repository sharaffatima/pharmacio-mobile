import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/space_helpers.dart';

class InventoryItemCard extends StatelessWidget {
  final String name;
  final int minStock;
  final int currentStock;
  final String lastUpdated;

  const InventoryItemCard({
    super.key,
    required this.name,
    required this.minStock,
    required this.currentStock,
    required this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor;
    final String statusLabel;
    final Widget statusIcon;

    if (currentStock == 0) {
      statusColor = Colors.red;
      statusLabel = "Out of Stock";
      statusIcon = Icon(Icons.warning_amber, color: statusColor, size: 18.sp);
    } else if (currentStock < minStock) {
      statusColor = Colors.orange;
      statusLabel = "Low Stock";
      statusIcon = Icon(Icons.trending_down, color: statusColor, size: 18.sp);
    } else {
      statusColor = Colors.green;
      statusLabel = "In Stock";
      statusIcon = SvgPicture.asset(
        "assets/icons/inventory.svg",
        colorFilter: ColorFilter.mode(statusColor, BlendMode.srcIn),
        width: 18.w,
      );
    }

    double progress = currentStock / (minStock > 0 ? minStock : 1);
    if (progress > 1.0) progress = 1.0;

    return Container(
      height: 127.h,
      width: 355.w,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteLaight,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: AppTextStyles.inventoryItem),
              _buildStatusBadge(
                label: statusLabel,
                color: statusColor,
                iconWidget: statusIcon,
              ),
            ],
          ),
          verticalSpace(3),
          Text(
            "${AppStrings.minStock} $minStock boxes",
            style: AppTextStyles.minStock,
          ),
          verticalSpace(10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.currentStock, style: AppTextStyles.currentStock),
              Text(
                "$currentStock boxes",
                style: AppTextStyles.currentStockCount(statusColor),
              ),
            ],
          ),
          verticalSpace(5),

          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress,

              minHeight: 8.h,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),
          verticalSpace(7),

          Text(
            "${AppStrings.lastUpdated} $lastUpdated",
            style: AppTextStyles.lastUpdate,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge({
    required String label,
    required Color color,
    required Widget iconWidget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          horizontalSpace(4),
          Text(
            label,
            style: AppTextStyles.inventoryItem.copyWith(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
