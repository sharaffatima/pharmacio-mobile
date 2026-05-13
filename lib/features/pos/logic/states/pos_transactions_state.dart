import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/pos_transaction_model.dart';

part 'pos_transactions_state.freezed.dart';

@freezed
class PosTransactionsState with _$PosTransactionsState {
  const factory PosTransactionsState.initial() = _PosTransactionsInitial;
  const factory PosTransactionsState.loading() = PosTransactionsLoading;
  const factory PosTransactionsState.loaded(
    List<PosTransactionModel> transactions,
  ) = PosTransactionsLoaded;
  const factory PosTransactionsState.error(String message) =
      PosTransactionsError;
}
