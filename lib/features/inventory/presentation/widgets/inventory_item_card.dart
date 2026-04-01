import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

class InventoryItemCard extends StatelessWidget {
  final String product;
  final int quantity;
  final String status;

  // final int minStock;
  // final int lastUpdated;
  // final String timeUnit;

  const InventoryItemCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.status,
    // this.minStock = 30,
    // this.lastUpdated = 2,
    // this.timeUnit = 'hours',
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor;
    final String statusLabel;
    final Widget statusIcon;

    switch (status) {
      case 'out':
        statusColor = Colors.red;
        statusLabel = 'out';
        statusIcon = Icon(Icons.warning_amber, color: statusColor, size: 18.sp);
        break;
      case 'low':
        statusColor = Colors.orange;
        statusLabel = 'low';
        statusIcon = Icon(Icons.trending_down, color: statusColor, size: 18.sp);
        break;
      default: // 'ok'
        statusColor = Colors.green;
        statusLabel = 'inStock';
        statusIcon = SvgPicture.asset(
          'assets/icons/inventory.svg',
          colorFilter: ColorFilter.mode(statusColor, BlendMode.srcIn),
          width: 18.w,
        );
    }

    // double progress = quantity / (minStock > 0 ? minStock : 1);
    // if (progress > 1.0) progress = 1.0;
    int progress = quantity;
    if (progress > 1) progress = 1;
    return Container(
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
              Expanded(
                child: Text(
                  product,
                  style: AppTextStyles.inventoryItem,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildStatusBadge(
                label: statusLabel.tr(),
                color: statusColor,
                iconWidget: statusIcon,
              ),
            ],
          ),

          verticalSpace(3),

          // Text(
          //   "${'minStock'.tr()} $minStock ${'boxes'.tr()}",
          //   style: AppTextStyles.minStock,
          // ),
          verticalSpace(10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('currentStock'.tr(), style: AppTextStyles.currentStock),
              Text(
                "$quantity ${'boxes'.tr()}",
                style: AppTextStyles.currentStockCount(statusColor),
              ),
            ],
          ),

          verticalSpace(5),

          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress.toDouble(),
              minHeight: 8.h,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),

          verticalSpace(7),

          // Text(
          //   "${'lastUpdated'.tr()} $lastUpdated $timeUnit",
          //   style: AppTextStyles.lastUpdate,
          // ),
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
