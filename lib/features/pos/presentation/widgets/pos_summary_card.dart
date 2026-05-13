import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_checkout_cubit.dart';

class PosSummaryCard extends StatelessWidget {
  const PosSummaryCard({super.key, required this.checkoutCubit});

  final PosCheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PosCheckoutSummary>(
      valueListenable: checkoutCubit.summary,
      builder: (context, s, _) {
        final paidMatchesTotal = (s.totalPaid - s.total).abs() < 0.01;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceSoft,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _SummaryRow(
                label: AppStrings.posSubtotalLabel,
                value: s.subtotal.toStringAsFixed(2),
              ),
              verticalSpace(8),
              _SummaryRow(
                label: AppStrings.posTotalLabel,
                value: s.total.toStringAsFixed(2),
                isBold: true,
              ),
              verticalSpace(8),
              _SummaryRow(
                label: AppStrings.posTotalPaid,
                value: s.totalPaid.toStringAsFixed(2),
                valueColor: paidMatchesTotal
                    ? AppColors.greenSuccess
                    : AppColors.redError,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.textPrimary,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 16 : 14,
          ),
        ),
      ],
    );
  }
}
