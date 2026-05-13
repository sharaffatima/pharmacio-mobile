import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/date_time_formatter.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/features/pos/data/models/pos_transaction_model.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/pos_status_chip.dart';

class PosTransactionCard extends StatelessWidget {
  const PosTransactionCard({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  final PosTransactionModel transaction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${AppStrings.receiptNumber}${transaction.receiptNumber}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  horizontalSpace(8),
                  PosStatusChip(status: transaction.status),
                ],
              ),
              verticalSpace(8),
              if (transaction.items.isNotEmpty)
                Text(
                  transaction.items.map((i) => i.productName).join(', '),
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              verticalSpace(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.cashierLabel}: ${transaction.cashierName}',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${AppStrings.posTotalLabel}: ${transaction.totalAmount}',
                    style: TextStyle(
                      color: AppColors.forestGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              verticalSpace(4),
              Text(
                formatTransactionDate(transaction.createdAt),
                style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
