import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';

class SelectionActionBar extends StatelessWidget {
  final ProposalsCubit cubit;
  final int selectedCount;
  final bool isPdfLoading;

  const SelectionActionBar({
    super.key,
    required this.cubit,
    required this.selectedCount,
    required this.isPdfLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            TextButton(
              onPressed: () => cubit.exitProposalSelectionMode(),
              child: Text(
                AppStrings.cancel,
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            horizontalSpace(8.w),
            Expanded(
              child: Text(
                '$selectedCount ${AppStrings.selectedCountSuffix}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            horizontalSpace(8.w),
            if (isPdfLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              ElevatedButton.icon(
                onPressed: selectedCount == 0
                    ? null
                    : () => cubit.exportPdfProposals(
                        cubit.selectedProposalIds.value.toList(),
                      ),
                icon: Icon(Icons.download_outlined, size: 16.sp),
                label: Text(AppStrings.downloadPdf),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bluePrimary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: AppColors.bluePrimary.withValues(
                    alpha: 0.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
