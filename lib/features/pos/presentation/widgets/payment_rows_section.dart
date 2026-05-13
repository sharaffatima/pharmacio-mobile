import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_checkout_cubit.dart';

class PaymentRowsSection extends StatelessWidget {
  const PaymentRowsSection({super.key, required this.checkoutCubit});

  final PosCheckoutCubit checkoutCubit;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<PaymentRowData>>(
      valueListenable: checkoutCubit.paymentRowsNotifier,
      builder: (context, rows, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.paymentsSection,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            verticalSpace(12),
            ...rows.asMap().entries.map((entry) {
              final index = entry.key;
              final row = entry.value;
              return _PaymentRowItem(
                key: ValueKey('payment_$index'),
                index: index,
                row: row,
                checkoutCubit: checkoutCubit,
                canRemove: rows.length > 1,
              );
            }),
            verticalSpace(8),
            AppPrimaryButton(
              label: AppStrings.addPayment,
              backgroundColor: AppColors.bluePrimary,
              onPressed: checkoutCubit.addPaymentRow,
            ),
          ],
        );
      },
    );
  }
}

class _PaymentRowItem extends StatelessWidget {
  const _PaymentRowItem({
    super.key,
    required this.index,
    required this.row,
    required this.checkoutCubit,
    required this.canRemove,
  });

  final int index;
  final PaymentRowData row;
  final PosCheckoutCubit checkoutCubit;
  final bool canRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              initialValue: row.paymentMethod,
              decoration: InputDecoration(
                labelText: AppStrings.paymentMethod,
                border: const OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              items: [
                DropdownMenuItem(value: 'cash', child: Text(AppStrings.cash)),
                DropdownMenuItem(value: 'card', child: Text(AppStrings.card)),
                DropdownMenuItem(
                  value: 'insurance',
                  child: Text(AppStrings.insuranceMethod),
                ),
              ],
              onChanged: (val) {
                if (val != null) checkoutCubit.setPaymentMethod(index, val);
              },
            ),
          ),
          horizontalSpace(8),
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: row.amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: AppStrings.amountPaidLabel,
                border: const OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) return AppStrings.requiredField;
                if ((double.tryParse(val) ?? 0) <= 0) {
                  return AppStrings.paymentAmountRequired;
                }
                return null;
              },
            ),
          ),
          if (canRemove) ...[
            horizontalSpace(4),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: IconButton(
                onPressed: () => checkoutCubit.removePaymentRow(index),
                icon: const Icon(Icons.remove_circle_outline),
                color: AppColors.redError,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
