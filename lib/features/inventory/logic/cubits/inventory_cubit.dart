import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/inventory_adjust_request_body.dart';
import '../../data/models/inventory_adjust_response.dart';
import '../../data/models/inventory_create_request_body.dart';
import '../../data/models/inventory_create_response.dart';
import '../../data/models/inventory_list_response.dart';
import '../../data/repos/inventory_repo.dart';

part '../states/inventory_state.dart';
part 'inventory_cubit.freezed.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;
  InventoryCubit(this._inventoryRepo) : super(InventoryState.initial());

  // Controllers for create form
  TextEditingController productNameController = TextEditingController();
  TextEditingController strengthController = TextEditingController();
  TextEditingController quantityOnHandController = TextEditingController();
  TextEditingController minThresholdController = TextEditingController();

  // Controllers for adjust form
  TextEditingController adjustmentController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  GlobalKey<FormState> createFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> adjustFormKey = GlobalKey<FormState>();

  Future<void> getInventoryList() async {
    emit(InventoryState.loading());
    try {
      final response = await _inventoryRepo.getInventoryList();
      emit(InventoryState.successList(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  Future<void> createInventory() async {
    emit(InventoryState.loading());
    try {
      final request = InventoryCreateRequestBody(
        productName: productNameController.text,
        strength: strengthController.text,
        quantityOnHand: int.tryParse(quantityOnHandController.text) ?? 0,
        minThreshold: int.tryParse(minThresholdController.text) ?? 0,
      );
      final response = await _inventoryRepo.createInventory(request);
      emit(InventoryState.successCreate(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  Future<void> adjustInventory(int inventoryId) async {
    emit(InventoryState.loading());
    try {
      final request = InventoryAdjustRequestBody(
        adjustment: int.tryParse(adjustmentController.text) ?? 0,
        reason: reasonController.text,
      );
      final response = await _inventoryRepo.adjustInventory(
        inventoryId,
        request,
      );
      emit(InventoryState.successAdjust(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  void clearCreateForm() {
    productNameController.clear();
    strengthController.clear();
    quantityOnHandController.clear();
    minThresholdController.clear();
  }

  void clearAdjustForm() {
    adjustmentController.clear();
    reasonController.clear();
  }

  @override
  Future<void> close() {
    productNameController.dispose();
    strengthController.dispose();
    quantityOnHandController.dispose();
    minThresholdController.dispose();
    adjustmentController.dispose();
    reasonController.dispose();
    return super.close();
  }
}
