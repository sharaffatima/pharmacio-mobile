import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/states/proposals_state.dart';

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
        title: 'Proposal Details',
        subtitle: 'ID: $proposalId',
      ),
      body: BlocConsumer<ProposalsCubit, ProposalsState>(
        listener: (context, state) {
          state.maybeWhen(
            approveSuccess: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Proposal Approved: \${response.message ?? ""}'), backgroundColor: AppColors.greenSuccess),
              );
              Navigator.pop(context);
            },
            rejectSuccess: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Proposal Rejected: \${response.message ?? ""}'), backgroundColor: AppColors.orangeWarning),
              );
              Navigator.pop(context);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: AppColors.redError),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            proposalDetailLoading: () => const Center(child: CircularProgressIndicator()),
            actionLoading: () => const Center(child: CircularProgressIndicator()),
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
                            Text('Proposal ID: \${response.id}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            verticalSpace(8),
                            const Text('No further details available yet.'),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.redError,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () => _rejectProposal(context),
                            child: const Text('Reject', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        horizontalSpace(16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenSuccess,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () => _approveProposal(context),
                            child: const Text('Approve', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                  ],
                ),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
