import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';

import 'compare_results_screen.dart';

class AvailableOffersTab extends StatelessWidget {
  const AvailableOffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProposalsCubit>();

    return BlocConsumer<ProposalsCubit, ProposalsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            showAppSnackBar(
              context,
              message: message,
              backgroundColor: AppColors.redError,
              textStyle: const TextStyle(color: AppColors.white),
            );
          },
          generateSuccess: (response) {
            showAppSnackBar(
              context,
              message: AppStrings.proposalGeneratedSuccess,
              backgroundColor: AppColors.greenSuccess,
            );
            cubit.clearSelection();
          },
          compareSuccess: (response) {
            final selectedIds = List<int>.from(cubit.selectedOfferIds.value);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: CompareResultsScreen(
                    compareResponse: response,
                    ocrResultIds: selectedIds,
                  ),
                ),
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final response = state.maybeWhen(
          availableOffersSuccess: (response) => response,
          orElse: () => cubit.cachedAvailableOffers,
        );

        if (response != null) {
          final offers = response.results ?? const [];
          if (offers.isEmpty) {
            return Center(child: Text(AppStrings.noAvailableOffers));
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
                        final offerId = offer.id;
                        final isSelected =
                            offerId != null &&
                            selectedOfferIds.contains(offerId);
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          color: AppColors.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: AppColors.border),
                          ),
                          child: CheckboxListTile(
                            activeColor: AppColors.bluePrimary,
                            title: Text(
                              offer.originalFilename ?? AppStrings.notAvailable,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              AppStrings.itemsAndScoreLabel
                                  .replaceAll(
                                    '{items}',
                                    (offer.itemsCount ?? 0).toString(),
                                  )
                                  .replaceAll(
                                    '{score}',
                                    (offer.confidenceScore ?? 0)
                                        .toStringAsFixed(2),
                                  ),
                            ),
                            value: isSelected,
                            onChanged: offerId == null
                                ? null
                                : (val) => cubit.toggleOfferSelection(
                                    offerId,
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
        }

        return state.maybeWhen(
          availableOffersLoading: () => const LoadingWidget(),
          actionLoading: () => const LoadingWidget(),
          orElse: () => const LoadingWidget(),
        );
      },
    );
  }

  Widget _buildActionButtons(Set<int> selectedOfferIds, ProposalsCubit cubit) {
    final comparedIds = cubit.lastComparedOfferIds;
    final canGenerateForComparedIds =
        comparedIds.isNotEmpty &&
        setEquals(selectedOfferIds, comparedIds.toSet());

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppPrimaryButton(
              label: AppStrings.extraction,
              backgroundColor: AppColors.orangeWarning,
              onPressed: selectedOfferIds.length >= 1
                  ? () => cubit.compareOffers(selectedOfferIds.toList())
                  : null,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: AppPrimaryButton(
              label: AppStrings.generateProposal,
              backgroundColor: AppColors.bluePrimary,
              onPressed: canGenerateForComparedIds
                  ? () => cubit.generateProposal(comparedIds)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
