import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/states/proposals_state.dart';

class AvailableOffersTab extends StatelessWidget {
  const AvailableOffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProposalsCubit>();

    return BlocConsumer<ProposalsCubit, ProposalsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.redError,
              ),
            );
          },
          generateSuccess: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Proposal generated successfully!'),
                backgroundColor: AppColors.greenSuccess,
              ),
            );
            cubit.clearSelection();
          },
          compareSuccess: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Comparison successful!'),
                backgroundColor: AppColors.greenSuccess,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          availableOffersLoading: () =>
              const Center(child: CircularProgressIndicator()),
          actionLoading: () => const Center(child: CircularProgressIndicator()),
          availableOffersSuccess: (response) {
            final offers = response.results;
            if (offers.isEmpty) {
              return const Center(child: Text('No available offers.'));
            }
            return ValueListenableBuilder<Set<int>>(
              valueListenable: cubit.selectedOfferIds,
              builder: (context, selectedOfferIds, _) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          final offer = offers[index];
                          final isSelected = selectedOfferIds.contains(
                            offer.id,
                          );
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: CheckboxListTile(
                              activeColor: AppColors.bluePrimary,
                              title: Text(
                                offer.originalFilename,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Items: \${offer.itemsCount} | Score: \${offer.confidenceScore}',
                              ),
                              value: isSelected,
                              onChanged: (val) => cubit.toggleOfferSelection(
                                offer.id,
                                val ?? false,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    _buildActionButtons(selectedOfferIds, cubit),
                  ],
                );
              },
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildActionButtons(Set<int> selectedOfferIds, ProposalsCubit cubit) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppPrimaryButton(
              label: 'Compare',
              backgroundColor: AppColors.orangeWarning,
              onPressed: selectedOfferIds.length >= 2
                  ? () => cubit.compareOffers(selectedOfferIds.toList())
                  : null,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: AppPrimaryButton(
              label: 'Generate Proposal',
              backgroundColor: AppColors.bluePrimary,
              onPressed: selectedOfferIds.isNotEmpty
                  ? () => cubit.generateProposal(selectedOfferIds.toList())
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
