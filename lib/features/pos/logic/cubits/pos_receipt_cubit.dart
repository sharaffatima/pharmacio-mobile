import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../data/repos/pos_repo.dart';
import '../states/pos_receipt_state.dart';

class PosReceiptCubit extends Cubit<PosReceiptState> {
  final PosRepo posRepo;

  PosReceiptCubit(this.posRepo) : super(const PosReceiptState.initial());

  Future<void> getReceipt(int id) async {
    emit(const PosReceiptState.loading());
    try {
      final result = await posRepo.getReceipt(id);
      emit(PosReceiptState.loaded(result));
    } catch (e) {
      final ex = NetworkExceptions.getException(e);
      emit(PosReceiptState.error(NetworkExceptions.getErrorMessage(ex)));
    }
  }

  Future<void> refund(int id) async {
    emit(const PosReceiptState.refunding());
    try {
      final result = await posRepo.refund(id);
      emit(PosReceiptState.refunded(result));
    } catch (e) {
      final ex = NetworkExceptions.getException(e);
      emit(PosReceiptState.error(NetworkExceptions.getErrorMessage(ex)));
    }
  }
}
