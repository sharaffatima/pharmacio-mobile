import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/row_action_widget.dart';

class RecentActivityShowWidget extends StatelessWidget {
  const RecentActivityShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 242.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.recentActivity, style: AppTextStyles.s14w400),
          verticalSpace(12.h),
          Column(
            children: [
              RowActionWidget(
                title: AppStrings.newProposalGenerated,
                dataTime: AppStrings.twelveHour,
                type: EnumTypeAction.proposal,
              ),
              RowActionWidget(
                title: AppStrings.newProposalGenerated,
                dataTime: AppStrings.twelveHour,
                type: EnumTypeAction.alert,
              ),
              RowActionWidget(
                title: AppStrings.newProposalGenerated,
                dataTime: AppStrings.twelveHour,
                type: EnumTypeAction.inventory,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
