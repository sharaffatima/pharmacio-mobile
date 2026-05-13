import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/states/proposals_state.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/proposals_list.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/proposals_stats_header.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/selection_action_bar.dart';

class ProposalsTab extends StatelessWidget {
  const ProposalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProposalsCubit>();
    return BlocConsumer<ProposalsCubit, ProposalsState>(
      listener: (context, state) {
        state.maybeWhen(
          pdfSuccess: (filePath) {
            cubit.exitProposalSelectionMode();
            showAppSnackBar(context, message: AppStrings.pdfDownloadSuccess);
            OpenFilex.open(filePath);
          },
          error: (message) {
            if (cubit.isProposalSelectionMode.value) {
              showAppSnackBar(
                context,
                message: message,
                backgroundColor: AppColors.redError,
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return ValueListenableBuilder<bool>(
          valueListenable: cubit.isProposalSelectionMode,
          builder: (context, isSelectionMode, _) {
            return ValueListenableBuilder<Set<int>>(
              valueListenable: cubit.selectedProposalIds,
              builder: (context, selectedIds, _) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProposalsStatsHeader(),
                            Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Row(
                                children: [
                                  Expanded(child: InventoryFilter()),
                                  if (!isSelectionMode)
                                    ColoredBox(
                                      color: AppColors.bluePrimary.withAlpha(
                                        30,
                                      ),

                                      child: GestureDetector(
                                        onTap: () =>
                                            cubit.enterProposalSelectionMode(),
                                        child: Container(
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                            color: AppColors.bluePrimary
                                                .withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.download,
                                            color: AppColors.bluePrimary,
                                            size: 40.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ProposalsList(
                              state: state,
                              cubit: cubit,
                              isSelectionMode: isSelectionMode,
                              selectedIds: selectedIds,
                            ),
                            verticalSpace(20),
                          ],
                        ),
                      ),
                    ),
                    if (isSelectionMode)
                      SelectionActionBar(
                        cubit: cubit,
                        selectedCount: selectedIds.length,
                        isPdfLoading: state.maybeWhen(
                          pdfLoading: () => true,
                          orElse: () => false,
                        ),
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
