
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_dash_board.dart';

class dashBourdWidget extends StatelessWidget {
  const dashBourdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.alert,
                title: 'low stock',
                value: 12,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.stock,
                title: 'Activity Alerts',
                value: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.proposal,
                title: 'Proposal',
                value: 5,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CardDashBourdWidget(
                type: EnumTypeAction.inventory,
                title: 'Inventory',
                value: 1247,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
