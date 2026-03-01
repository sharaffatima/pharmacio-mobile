import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/Task/core/helpers/space_helpers.dart';
import 'package:pharmacio_flutter_mobile/Task/features/Proposal/data/mock_data.dart';
import 'package:pharmacio_flutter_mobile/Task/features/Proposal/data/mock_data.dart'
    as ProposalMockData;
import 'package:pharmacio_flutter_mobile/Task/features/Proposal/presentation/widget/proposal_card.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/state_card.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: AppBar(
        toolbarHeight: 132.h,
        backgroundColor: AppColors.backGroundAppBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.proposal, style: AppTextStyles.appBar),
              verticalSpace(4),
              Text(
                AppStrings.renewAndManage,
                style: AppTextStyles.descriptionAppbar,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                left: 22.w,
                right: 16.w,
                bottom: 28.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: buildStatCard("10", "Total", AppColors.bluePrimary),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard(
                      "5",
                      "Pending",
                      AppColors.orangeWarning,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard(
                      "3",
                      "Approved",
                      AppColors.greenSuccess,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard("2", "Rejected", AppColors.redError),
                  ),
                ],
              ),
            ),
            InventoryFilter(),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProposalMockData.proposals.length,
              itemBuilder: (context, index) {
                final item = proposals[index];
                return ProposalCard(
                  title: item.title,
                  date: item.date,
                  status: item.status,
                  itemsCount: item.itemsCount,
                  totalCost: item.totalCost,
                  textColor: item.textColor,
                  borderColor: item.borderColor,
                  backgroundColor: item.backgroundColor,
                );
              },
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
