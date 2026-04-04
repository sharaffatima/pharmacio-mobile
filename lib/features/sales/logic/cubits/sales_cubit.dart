import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/sales_request.dart';
import '../../data/repos/sales_repo.dart';
import '../states/sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepo salesRepo;

  SalesCubit(this.salesRepo) : super(const SalesState.initial());

  Future<void> recordSale(SalesRequestModel request) async {
    emit(const SalesState.loading());
    try {
      final response = await salesRepo.recordSale(request);
      emit(SalesState.success(response));
    } catch (e) {
      emit(SalesState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }
}
