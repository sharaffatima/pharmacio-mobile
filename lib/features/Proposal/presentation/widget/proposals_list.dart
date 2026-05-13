import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/proposal_card.dart';

class ProposalsList extends StatelessWidget {
  final ProposalsState state;
  final ProposalsCubit cubit;
  final bool isSelectionMode;
  final Set<int> selectedIds;

  const ProposalsList({
    super.key,
    required this.state,
    required this.cubit,
    required this.isSelectionMode,
    required this.selectedIds,
  });

  double _toDouble(String? value) {
    if (value == null) return 0;
    return double.tryParse(value) ?? 0;
  }

  String _localizedStatus(String? status) {
    switch ((status ?? '').toLowerCase()) {
      case 'approved':
        return AppStrings.approved;
      case 'rejected':
        return AppStrings.rejected;
      case 'pending':
      default:
        return AppStrings.pending;
    }
  }

  ({Color text, Color border, Color background}) _statusColors(String? status) {
    switch ((status ?? '').toLowerCase()) {
      case 'approved':
        return (
          text: AppColors.greenSuccess,
          border: AppColors.greenSuccess,
          background: AppColors.greenSuccess.withValues(alpha: 0.1),
        );
      case 'rejected':
        return (
          text: AppColors.redError,
          border: AppColors.redError,
          background: AppColors.redError.withValues(alpha: 0.1),
        );
      case 'pending':
      default:
        return (
          text: AppColors.orangeWarning,
          border: AppColors.orangeWarning,
          background: AppColors.orangeWarning.withValues(alpha: 0.1),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          final id = item.id;
          final localizedStatus = _localizedStatus(item.status);
          final colors = _statusColors(item.status);

          if (isSelectionMode && id != null) {
            final isChecked = selectedIds.contains(id);
            return GestureDetector(
              onTap: () => cubit.toggleProposalSelection(id),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (_) => cubit.toggleProposalSelection(id),
                      activeColor: AppColors.bluePrimary,
                    ),
                  ),
                  Expanded(
                    child: ProposalCard(
                      title: '${AppStrings.proposalPrefix} #$id',
                      date:
                          item.createdAt?.split('T').first ??
                          AppStrings.notAvailable,
                      status: localizedStatus,
                      itemsCount: item.items?.length ?? 0,
                      totalCost: _toDouble(item.totalCost),
                      textColor: colors.text,
                      borderColor: colors.border,
                      backgroundColor: colors.background,
                      margin: EdgeInsets.only(right: 16.w, top: 11.h),
                    ),
                  ),
                ],
              ),
            );
          }

          return GestureDetector(
            onTap: id == null
                ? null
                : () => Navigator.pushNamed(
                    context,
                    Routes.proposalDetailScreen,
                    arguments: id,
                  ),
            child: ProposalCard(
              title:
                  '${AppStrings.proposalPrefix} #${id ?? AppStrings.notAvailable}',
              date: item.createdAt?.split('T').first ?? AppStrings.notAvailable,
              status: localizedStatus,
              itemsCount: item.items?.length ?? 0,
              totalCost: _toDouble(item.totalCost),
              textColor: colors.text,
              borderColor: colors.border,
              backgroundColor: colors.background,
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
  }
}
