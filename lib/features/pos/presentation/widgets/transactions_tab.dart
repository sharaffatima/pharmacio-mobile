import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_transactions_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/states/pos_transactions_state.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/pos_transaction_card.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosTransactionsCubit, PosTransactionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingWidget(),
          loaded: (transactions) {
            if (transactions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 64,
                      color: AppColors.textSecondary,
                    ),
                    verticalSpace(12),
                    Text(
                      AppStrings.noTransactions,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              color: AppColors.appBarBackground,
              onRefresh: () =>
                  context.read<PosTransactionsCubit>().getTransactions(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return PosTransactionCard(
                    transaction: tx,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.posTransactionDetailScreen,
                      arguments: tx.id,
                    ),
                  );
                },
              ),
            );
          },
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
                  onPressed: () =>
                      context.read<PosTransactionsCubit>().getTransactions(),
                ),
              ],
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
