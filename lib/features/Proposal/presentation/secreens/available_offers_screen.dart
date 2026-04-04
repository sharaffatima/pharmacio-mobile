import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/states/proposals_state.dart';

class AvailableOffersScreen extends StatefulWidget {
  const AvailableOffersScreen({super.key});

  @override
  State<AvailableOffersScreen> createState() => _AvailableOffersScreenState();
}

class _AvailableOffersScreenState extends State<AvailableOffersScreen> {
  final Set<int> _selectedOfferIds = {};

  void _onOfferToggled(int id, bool? selected) {
    setState(() {
      if (selected == true) {
        _selectedOfferIds.add(id);
      } else {
        _selectedOfferIds.remove(id);
      }
    });
  }

  void _generateProposal() {
    context.read<ProposalsCubit>().generateProposal(_selectedOfferIds.toList());
  }

  void _compareOffers() {
    context.read<ProposalsCubit>().compareOffers(_selectedOfferIds.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.proposalTitle,
        subtitle: 'Available Offers',
      ),
      body: BlocConsumer<ProposalsCubit, ProposalsState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: AppColors.redError),
              );
            },
            generateSuccess: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Proposal generated successfully!'), backgroundColor: AppColors.greenSuccess),
              );
              // reset selection
              setState(() => _selectedOfferIds.clear());
            },
            compareSuccess: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Comparison successful!'), backgroundColor: AppColors.greenSuccess),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            availableOffersLoading: () => const Center(child: CircularProgressIndicator()),
            actionLoading: () => const Center(child: CircularProgressIndicator()),
            availableOffersSuccess: (response) {
              final offers = response.results;
              if (offers.isEmpty) {
                return const Center(child: Text('No available offers.'));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        final isSelected = _selectedOfferIds.contains(offer.id);
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: CheckboxListTile(
                            activeColor: AppColors.bluePrimary,
                            title: Text(offer.originalFilename, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Items: \${offer.itemsCount} | Score: \${offer.confidenceScore}'),
                            value: isSelected,
                            onChanged: (val) => _onOfferToggled(offer.id, val),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildActionButtons(),
                ],
              );
            },
            orElse: () {
              // Retrieve state again if we are displaying something else, or show loading
              // Actually when Action is loading, state = actionLoading, so we handle it above
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _selectedOfferIds.length >= 2 ? _compareOffers : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeWarning,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Compare'),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: ElevatedButton(
              onPressed: _selectedOfferIds.isNotEmpty ? _generateProposal : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bluePrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Generate Proposal'),
            ),
          ),
        ],
      ),
    );
  }
}
