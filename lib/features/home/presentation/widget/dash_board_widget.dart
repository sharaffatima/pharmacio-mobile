import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/home/data/models/dashboard_stats_response.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_dash_board.dart';

class DashBourdWidget extends StatelessWidget {
  const DashBourdWidget({
    super.key,
    required this.dashboardStats,
    required this.isLoading,
  });

  final DashboardStatsResponse? dashboardStats;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final lowStockValue = dashboardStats?.lowStock ?? 0;
    final activityAlertsValue = dashboardStats?.activityAlerts ?? 0;
    final proposalsValue = dashboardStats?.proposals ?? 0;
    final inventoryValue = dashboardStats?.inventory ?? 0;

    return Column(
      children: [
        if (isLoading) ...[
          const LinearProgressIndicator(minHeight: 2),
          verticalSpace(10.h),
        ],
        Row(
          children: [
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.alert,
                title: AppStrings.lowStockLabel,
                value: lowStockValue,
              ),
            ),
            horizontalSpace(12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.stock,
                title: AppStrings.activityAlerts,
                value: activityAlertsValue,
              ),
            ),
          ],
        ),
        verticalSpace(12.h),
        Row(
          children: [
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.proposal,
                title: AppStrings.proposalTitle,
                value: proposalsValue,
              ),
            ),
            horizontalSpace(12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.inventory,
                title: AppStrings.inventoryTitle,
                value: inventoryValue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
