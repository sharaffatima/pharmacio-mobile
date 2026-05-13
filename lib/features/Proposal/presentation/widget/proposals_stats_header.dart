import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/stat_card.dart';

class ProposalsStatsHeader extends StatelessWidget {
  const ProposalsStatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
        left: 22.w,
        right: 16.w,
        bottom: 28.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: buildStatCard(
              "0",
              AppStrings.proposaltitle,
              AppColors.bluePrimary,
            ),
          ),
          horizontalSpace(7.w),
          Expanded(
            child: buildStatCard(
              "0",
              AppStrings.pending,
              AppColors.orangeWarning,
            ),
          ),
          horizontalSpace(7.w),
          Expanded(
            child: buildStatCard(
              "0",
              AppStrings.approved,
              AppColors.greenSuccess,
            ),
          ),
          horizontalSpace(7.w),
          Expanded(
            child: buildStatCard("0", AppStrings.rejected, AppColors.redError),
          ),
        ],
      ),
    );
  }
}
