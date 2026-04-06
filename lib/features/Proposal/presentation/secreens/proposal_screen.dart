import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/proposal_card.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/stat_card.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/secreens/available_offers_screen.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        appBar: CustomAppBar(
          title: AppStrings.proposalTitle,
          subtitle: AppStrings.proposalSubTitle,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.backGroundBody,
              child: TabBar(
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.textPrimary,
                tabs: [
                  Tab(text: AppStrings.availableOffers),
                  Tab(text: AppStrings.proposals),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [AvailableOffersTab(), _ProposalsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProposalsTab extends StatelessWidget {
  const _ProposalsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  child: buildStatCard(
                    "0",
                    AppStrings.rejected,
                    AppColors.redError,
                  ),
                ),
              ],
            ),
          ),
          InventoryFilter(),
          BlocBuilder<ProposalsCubit, ProposalsState>(
            builder: (context, state) {
              final cubit = context.read<ProposalsCubit>();
              final response = state.maybeWhen(
                proposalsSuccess: (response) => response,
                orElse: () => cubit.cachedProposals,
              );

              if (response != null) {
                final proposals = response.results ?? [];
                if (proposals.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(AppStrings.noProposalsFound),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: proposals.length,
                  itemBuilder: (context, index) {
                    final item = proposals[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.proposalDetailScreen,
                          arguments: item.id,
                        );
                      },
                      child: ProposalCard(
                        title: '${AppStrings.proposalPrefix} #${item.id}',
                        date: AppStrings.notAvailable,
                        status: AppStrings.pending,
                        itemsCount: 0,
                        totalCost: 0.0,
                        textColor: AppColors.orangeWarning,
                        borderColor: AppColors.orangeWarning,
                        backgroundColor: AppColors.orangeWarning.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    );
                  },
                );
              }

              return state.maybeWhen(
                proposalsLoading: () => const LoadingWidget(),
                error: (message) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(color: AppColors.redError),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(12.h),
                        RetryWidget(onPressed: () => cubit.getProposals()),
                      ],
                    ),
                  ),
                ),
                orElse: () => const LoadingWidget(),
              );
            },
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
