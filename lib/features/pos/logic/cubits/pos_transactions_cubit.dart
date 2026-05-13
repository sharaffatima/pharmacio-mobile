import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../data/repos/pos_repo.dart';
import '../states/pos_transactions_state.dart';

class PosTransactionsCubit extends Cubit<PosTransactionsState> {
  final PosRepo posRepo;

  PosTransactionsCubit(this.posRepo)
    : super(const PosTransactionsState.initial());

  Future<void> getTransactions() async {
    emit(const PosTransactionsState.loading());
    try {
      final result = await posRepo.getTransactions();
      emit(PosTransactionsState.loaded(result));
    } catch (e) {
      final ex = NetworkExceptions.getException(e);
      emit(PosTransactionsState.error(NetworkExceptions.getErrorMessage(ex)));
    }
  }
}
