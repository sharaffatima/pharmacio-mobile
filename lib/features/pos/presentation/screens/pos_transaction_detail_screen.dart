import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/date_time_formatter.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/pos/data/models/pos_transaction_model.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_receipt_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/states/pos_receipt_state.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/pos_status_chip.dart';

class PosTransactionDetailScreen extends StatelessWidget {
  const PosTransactionDetailScreen({super.key, required this.transactionId});

  final int transactionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosReceiptCubit>(
      create: (_) => getIt<PosReceiptCubit>()..getReceipt(transactionId),
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        appBar: CustomAppBar(
          title: AppStrings.transactionDetails,
          subtitle: AppStrings.posSubtitle,
        ),
        body: BlocConsumer<PosReceiptCubit, PosReceiptState>(
          listener: (context, state) {
            state.maybeWhen(
              refunded: (_) {
                showAppSnackBar(
                  context,
                  message: AppStrings.refundSuccess,
                  backgroundColor: AppColors.greenSuccess,
                );
              },
              error: (message) {
                showAppSnackBar(
                  context,
                  message: message,
                  backgroundColor: AppColors.redError,
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingWidget(),
              refunding: () => const LoadingWidget(),
              loaded: (receipt) => _ReceiptBody(receipt: receipt),
              refunded: (receipt) => _ReceiptBody(receipt: receipt),
              error: (message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: AppColors.redError),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(16),
                    RetryWidget(
                      onPressed: () => context
                          .read<PosReceiptCubit>()
                          .getReceipt(transactionId),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

class _ReceiptBody extends StatelessWidget {
  const _ReceiptBody({required this.receipt});

  final PosTransactionModel receipt;

  @override
  Widget build(BuildContext context) {
    final isRefunded = receipt.status == 'refunded';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${AppStrings.receiptNumber}${receipt.receiptNumber}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  PosStatusChip(status: receipt.status),
                ],
              ),
              verticalSpace(12),
              _InfoRow(
                label: AppStrings.cashierLabel,
                value: receipt.cashierName,
              ),
              verticalSpace(6),
              _InfoRow(
                label: AppStrings.posSubtotalLabel,
                value: receipt.subtotal,
              ),
              verticalSpace(6),
              _InfoRow(
                label: AppStrings.discountPercentage,
                value: '${receipt.discountPercentage}%',
              ),
              verticalSpace(6),
              _InfoRow(
                label: AppStrings.posTotalLabel,
                value: receipt.totalAmount,
                isBold: true,
              ),
              verticalSpace(6),
              _InfoRow(
                label: AppStrings.soldAtIso,
                value: formatTransactionDate(receipt.createdAt),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        _SectionHeader(title: AppStrings.itemsSection),
        verticalSpace(8),
        ...receipt.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        item.totalPrice,
                        style: TextStyle(
                          color: AppColors.forestGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Text(
                    '${AppStrings.strength}: ${item.strength}',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${AppStrings.qtyShort}: ${item.quantity} × ${item.unitPrice}',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        verticalSpace(16),
        _SectionHeader(title: AppStrings.paymentsSection),
        verticalSpace(8),
        ...receipt.payments.map(
          (payment) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _SectionCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _localizeMethod(payment.paymentMethod),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    payment.amountPaid,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        verticalSpace(24),
        if (!isRefunded)
          AppPrimaryButton(
            label: AppStrings.refund,
            backgroundColor: AppColors.redError,
            onPressed: () => _showRefundDialog(context),
          )
        else
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.orangeWarning.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.orangeWarning,
                  size: 20,
                ),
                horizontalSpace(8),
                Text(
                  AppStrings.alreadyRefunded,
                  style: TextStyle(color: AppColors.orangeWarning),
                ),
              ],
            ),
          ),
        verticalSpace(16),
      ],
    );
  }

  void _showRefundDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AppStrings.refundConfirmTitle),
        content: Text(AppStrings.refundConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<PosReceiptCubit>().refund(receipt.id);
            },
            child: Text(
              AppStrings.refund,
              style: const TextStyle(color: AppColors.redError),
            ),
          ),
        ],
      ),
    );
  }

  String _localizeMethod(String method) {
    if (method == 'cash') return AppStrings.cash;
    if (method == 'card') return AppStrings.card;
    if (method == 'insurance') return AppStrings.insuranceMethod;
    return method;
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  final String label;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: AppColors.textSecondary)),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
