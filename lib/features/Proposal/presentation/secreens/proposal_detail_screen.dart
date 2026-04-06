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
                    '${AppStrings.proposalApprovedPrefix}${response.message ?? ""}',
                backgroundColor: AppColors.greenSuccess,
              );
              Navigator.pop(context);
            },
            rejectSuccess: (response) {
              showAppSnackBar(
                context,
                message:
                    '${AppStrings.proposalRejectedPrefix}${response.message ?? ""}',
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
                              '${AppStrings.proposalId}: \${response.id}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(8),
                            Text(AppStrings.noProposalDetailsYet),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
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
