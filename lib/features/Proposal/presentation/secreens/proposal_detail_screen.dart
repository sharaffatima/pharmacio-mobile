import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';

class ProposalDetailScreen extends StatelessWidget {
  final int proposalId;

  const ProposalDetailScreen({super.key, required this.proposalId});

  void _approveProposal(BuildContext context) {
    context.read<ProposalsCubit>().approveProposal(proposalId);
  }

  void _rejectProposal(BuildContext context) {
    context.read<ProposalsCubit>().rejectProposal(proposalId);
  }

  double _toDouble(String? value) {
    if (value == null) return 0;
    return double.tryParse(value) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.proposalDetails,
        subtitle: '${AppStrings.idPrefix}$proposalId',
      ),
      body: BlocConsumer<ProposalsCubit, ProposalsState>(
        listener: (context, state) {
          state.maybeWhen(
            approveSuccess: (response) {
              showAppSnackBar(
                context,
                message:
                    '${AppStrings.proposalApprovedPrefix}${response.status ?? AppStrings.approved}',
                backgroundColor: AppColors.greenSuccess,
              );
              Navigator.pop(context);
            },
            rejectSuccess: (response) {
              showAppSnackBar(
                context,
                message:
                    '${AppStrings.proposalRejectedPrefix}${response.status ?? AppStrings.rejected}',
                backgroundColor: AppColors.orangeWarning,
              );
              Navigator.pop(context);
            },
            error: (message) {
              showAppSnackBar(
                context,
                message: message,
                backgroundColor: AppColors.redError,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            proposalDetailLoading: () => const LoadingWidget(),
            actionLoading: () => const LoadingWidget(),
            proposalDetailSuccess: (response) {
              final items = response.items ?? const [];
              final currentStatus = (response.status ?? '').toLowerCase();
              final canTakeAction = currentStatus == 'pending';

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppStrings.proposalId}: ${response.id ?? AppStrings.notAvailable}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(8),
                            Text(
                              '${AppStrings.statusPrefix}${response.status ?? AppStrings.notAvailable}',
                            ),
                            verticalSpace(6),
                            Text(
                              '${AppStrings.totalCost}: ${response.totalCost ?? AppStrings.notAvailable}',
                            ),
                            verticalSpace(6),
                            Text(
                              '${AppStrings.items}: ${items.length} ${AppStrings.itemsSuffix}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(12),
                    Expanded(
                      child: items.isEmpty
                          ? Center(child: Text(AppStrings.noProposalDetailsYet))
                          : ListView.separated(
                              itemCount: items.length,
                              separatorBuilder: (_, __) => verticalSpace(8),
                              itemBuilder: (context, index) {
                                final item = items[index];
                                final quantity = item.proposedQuantity ?? 0;
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                      item.productName ??
                                          AppStrings.notAvailable,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${item.company ?? ''} | Qty: $quantity',
                                    ),
                                    trailing: Text(
                                      '\$${_toDouble(item.lineTotal).toStringAsFixed(2)}',
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    if (canTakeAction)
                      Row(
                        children: [
                          Expanded(
                            child: AppPrimaryButton(
                              label: AppStrings.reject,
                              backgroundColor: AppColors.redError,
                              onPressed: () => _rejectProposal(context),
                            ),
                          ),
                          horizontalSpace(16),
                          Expanded(
                            child: AppPrimaryButton(
                              label: AppStrings.approve,
                              backgroundColor: AppColors.greenSuccess,
                              onPressed: () => _approveProposal(context),
                            ),
                          ),
                        ],
                      ),
                    verticalSpace(24),
                  ],
                ),
              );
            },
            orElse: () => const LoadingWidget(),
          );
        },
      ),
    );
  }
}
