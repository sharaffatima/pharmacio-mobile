import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_dash_board.dart';

class DashBourdWidget extends StatelessWidget {
  const DashBourdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.alert,
                title: AppStrings.lowStockLabel,
                value: 12,
              ),
            ),
            horizontalSpace(12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.stock,
                title: AppStrings.activityAlerts,
                value: 3,
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
                value: 5,
              ),
            ),
            horizontalSpace(12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.inventory,
                title: AppStrings.inventoryTitle,
                value: 1247,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
