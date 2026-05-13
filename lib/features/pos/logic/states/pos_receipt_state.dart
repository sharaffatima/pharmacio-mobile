import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/pos_transaction_model.dart';

part 'pos_receipt_state.freezed.dart';

@freezed
class PosReceiptState with _$PosReceiptState {
  const factory PosReceiptState.initial() = _PosReceiptInitial;
  const factory PosReceiptState.loading() = PosReceiptLoading;
  const factory PosReceiptState.loaded(PosTransactionModel receipt) =
      PosReceiptLoaded;
  const factory PosReceiptState.refunding() = PosReceiptRefunding;
  const factory PosReceiptState.refunded(PosTransactionModel receipt) =
      PosReceiptRefunded;
  const factory PosReceiptState.error(String message) = PosReceiptError;
}
