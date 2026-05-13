import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/pos_transaction_model.dart';

part 'pos_checkout_state.freezed.dart';

@freezed
class PosCheckoutState with _$PosCheckoutState {
  const factory PosCheckoutState.initial() = _PosCheckoutInitial;
  const factory PosCheckoutState.loading() = PosCheckoutLoading;
  const factory PosCheckoutState.success(PosTransactionModel transaction) =
      PosCheckoutSuccess;
  const factory PosCheckoutState.error(String message) = PosCheckoutError;
}
