import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/inventory_response.dart';
import '../../data/repos/inventory_repo.dart';

part '../states/inventory_state.dart';
part 'inventory_cubit.freezed.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;

  InventoryCubit(this._inventoryRepo) : super(InventoryState.initial());

  Future<void> getInventory() async {
    emit(InventoryState.loading());
    try {
      final response = await _inventoryRepo.getInventory();
      emit(InventoryState.success(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }
}
