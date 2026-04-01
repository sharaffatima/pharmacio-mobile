import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/data/repos/proposals_repo.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/presentation/widget/proposal_card.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/presentation/widget/proposal_filter_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widgets/state_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({super.key});

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  String selectedValue = 'total';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProposalsCubit(getIt<ProposalsRepo>())
        ..getProposals(
          token:
              getIt<SharedPreferences>().getString('token') ??
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzc1MTE1MzMyLCJpYXQiOjE3NzUwMjg5MzIsImp0aSI6IjQ2YTVkNTVkNDdmZTQ3ZjY5ZTFhNTRiZGEyNDM1MWVmIiwidXNlcl9pZCI6IjEifQ.E9eREpzsbV_-idgaqXDdJn8X9Q2bEzgIwibh_Lla0kk',
        ),
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        appBar: CustomAppBar(
          title: AppStrings.proposalTitle,
          subtitle: AppStrings.proposalSubTitle,
        ),
        body: BlocBuilder<ProposalsCubit, ProposalsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    SizedBox(height: 12.h),
                    Text(message, textAlign: TextAlign.center),
                    SizedBox(height: 16.h),
                    ElevatedButton.icon(
                      onPressed: () =>
                          context.read<ProposalsCubit>().getProposals(
                            token:
                                getIt<SharedPreferences>().getString('token') ??
                                '',
                          ),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              success: (response) {
                final proposals = response.results;

                final filtered = selectedValue == 'total'
                    ? proposals
                    : proposals
                          .where((p) => p.status == selectedValue)
                          .toList();

                final total = proposals.length;
                final pending = proposals
                    .where((p) => p.status == 'pending')
                    .length;
                final approved = proposals
                    .where((p) => p.status == 'approved')
                    .length;
                final rejected = proposals
                    .where((p) => p.status == 'rejected')
                    .length;

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
                                '$total',
                                'Total',
                                AppColors.bluePrimary,
                              ),
                            ),
                            SizedBox(width: 7.w),
                            Expanded(
                              child: buildStatCard(
                                '$pending',
                                'Pending',
                                AppColors.orangeWarning,
                              ),
                            ),
                            SizedBox(width: 7.w),
                            Expanded(
                              child: buildStatCard(
                                '$approved',
                                'Approved',
                                AppColors.greenSuccess,
                              ),
                            ),
                            SizedBox(width: 7.w),
                            Expanded(
                              child: buildStatCard(
                                '$rejected',
                                'Rejected',
                                AppColors.redError,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProposalFilterWidget(
                        selectedValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      if (filtered.isEmpty)
                        SizedBox(
                          height: 400.h,
                          child: const Center(
                            child: Text(
                              'No proposals found.',
                              style: TextStyle(
                                color: AppColors.gray,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            final statusColors = _resolveStatusColors(
                              item.status,
                            );

                            return ProposalCard(
                              title: 'Proposal #${item.id}',
                              date: item.createdAt.substring(0, 10),
                              status: item.status,
                              itemsCount: item.items.length,
                              totalCost: double.tryParse(item.totalCost) ?? 0.0,
                              textColor: statusColors.text,
                              borderColor: statusColors.border,
                              backgroundColor: statusColors.background,
                            );
                          },
                        ),
                      verticalSpace(20),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  _StatusColors _resolveStatusColors(String status) {
    return switch (status.toLowerCase()) {
      'pending' => _StatusColors(
        text: AppColors.orangeWarning,
        border: AppColors.orangeWarning,
        background: AppColors.orangeWarning.withOpacity(0.1),
      ),
      'approved' => _StatusColors(
        text: AppColors.greenSuccess,
        border: AppColors.greenSuccess,
        background: AppColors.greenSuccess.withOpacity(0.1),
      ),
      'rejected' => _StatusColors(
        text: AppColors.redError,
        border: AppColors.redError,
        background: AppColors.redError.withOpacity(0.1),
      ),
      _ => _StatusColors(
        text: AppColors.bluePrimary,
        border: AppColors.bluePrimary,
        background: AppColors.bluePrimary.withOpacity(0.1),
      ),
    };
  }
}

class _StatusColors {
  final Color text;
  final Color border;
  final Color background;

  const _StatusColors({
    required this.text,
    required this.border,
    required this.background,
  });
}
