import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/states/proposals_state.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/presentation/widget/proposal_card.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/state_card.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.proposalTitle,
        subtitle: AppStrings.proposalSubTitle,
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
                    child: buildStatCard("0", "Total", AppColors.bluePrimary), // Example updates
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard(
                      "0",
                      "Pending",
                      AppColors.orangeWarning,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard(
                      "0",
                      "Approved",
                      AppColors.greenSuccess,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: buildStatCard("0", "Rejected", AppColors.redError),
                  ),
                ],
              ),
            ),
            InventoryFilter(),

            BlocBuilder<ProposalsCubit, ProposalsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  proposalsLoading: () => const Center(child: CircularProgressIndicator()),
                  proposalsSuccess: (response) {
                    final proposals = response.results ?? [];
                    if (proposals.isEmpty) {
                      return const Center(child: Text('No proposals found.'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: proposals.length,
                      itemBuilder: (context, index) {
                        final item = proposals[index];
                        // Placeholder mapping for UI
                        return ProposalCard(
                          title: 'Proposal #${item.id}',
                          date: 'N/A', // Update with actual fields
                          status: 'Pending',
                          itemsCount: 0,
                          totalCost: 0.0,
                          textColor: AppColors.orangeWarning,
                          borderColor: AppColors.orangeWarning,
                          backgroundColor: AppColors.orangeWarning.withValues(alpha: 0.1),
                        );
                      },
                    );
                  },
                  error: (message) => Center(child: Text(message, style: TextStyle(color: AppColors.redError))),
                  orElse: () => const Center(child: Text('Please wait...')),
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
