import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/data/models/proposal_placeholders.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';

class CompareResultsScreen extends StatelessWidget {
  const CompareResultsScreen({
    super.key,
    required this.compareResponse,
    required this.ocrResultIds,
  });

  final CompareResponse compareResponse;
  final List<int> ocrResultIds;

  @override
  Widget build(BuildContext context) {
    final entries = compareResponse.entries ?? const [];

    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.extraction,//ToDo 
        subtitle: AppStrings.comparisonSuccess,
      ),
      body: BlocListener<ProposalsCubit, ProposalsState>(
        listener: (context, state) {
          state.maybeWhen(
            generateSuccess: (_) {
              Navigator.of(context).pop();
            },
            orElse: () {},
          );
        },
        child: Column(
          children: [
            Expanded(
              child: entries.isEmpty
                  ? Center(child: Text(AppStrings.noAvailableOffers))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        final alternatives = entry.alternatives ?? const [];
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.drugName ?? AppStrings.notAvailable,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              verticalSpace(6),
                              Text(
                                '${AppStrings.statusPrefix}${entry.status ?? AppStrings.notAvailable}',
                              ),
                              if ((entry.company ?? '').isNotEmpty) ...[
                                verticalSpace(4),
                                Text('Company: ${entry.company}'),
                              ],
                              verticalSpace(8),
                              _PriceTile(
                                title: 'Best',
                                offer: entry.best,
                                highlight: true,
                              ),
                              if (alternatives.isNotEmpty) ...[
                                verticalSpace(8),
                                ...alternatives.map(
                                  (alternative) => Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: _PriceTile(
                                      title: 'Alternative',
                                      offer: alternative,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => verticalSpace(10),
                      itemCount: entries.length,
                    ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: BlocBuilder<ProposalsCubit, ProposalsState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      actionLoading: () => true,
                      orElse: () => false,
                    );
                    return AppPrimaryButton(
                      label: AppStrings.generateProposal,
                      backgroundColor: AppColors.bluePrimary,
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () => context
                                .read<ProposalsCubit>()
                                .generateProposal(ocrResultIds),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceTile extends StatelessWidget {
  const _PriceTile({
    required this.title,
    required this.offer,
    this.highlight = false,
  });

  final String title;
  final ProposalOfferPrice? offer;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final currentOffer = offer;
    if (currentOffer == null) {
      return Text('$title: ${AppStrings.notAvailable}');
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: highlight
            ? AppColors.greenSuccess.withValues(alpha: 0.08)
            : AppColors.offWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: highlight ? AppColors.greenSuccess : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$title | ${currentOffer.wareHouseName ?? AppStrings.notAvailable}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(currentOffer.price ?? AppStrings.notAvailable),
        ],
      ),
    );
  }
}
