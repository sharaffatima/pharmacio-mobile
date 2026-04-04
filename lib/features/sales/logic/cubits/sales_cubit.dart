import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/sales_request.dart';
import '../../data/repos/sales_repo.dart';
import '../states/sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepo salesRepo;

  SalesCubit(this.salesRepo)
    : formKey = GlobalKey<FormState>(),
      quantityController = TextEditingController(),
      priceController = TextEditingController(),
      dateController = TextEditingController(
        text: '${DateTime.now().toIso8601String().split('.')[0]}Z',
      ),
      selectedInventoryId = ValueNotifier<int?>(null),
      super(const SalesState.initial());

  final GlobalKey<FormState> formKey;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final TextEditingController dateController;
  final ValueNotifier<int?> selectedInventoryId;

  void setSelectedInventoryId(int? id) {
    selectedInventoryId.value = id;
  }

  SalesRequestModel? buildRequestIfValid() {
    if (!formKey.currentState!.validate() ||
        selectedInventoryId.value == null) {
      return null;
    }
    return SalesRequestModel(
      inventoryId: selectedInventoryId.value!,
      quantitySold: int.parse(quantityController.text),
      unitPrice: priceController.text,
      soldAt: dateController.text,
    );
  }

  Future<void> recordSale(SalesRequestModel request) async {
    emit(const SalesState.loading());
    try {
      final response = await salesRepo.recordSale(request);
      emit(SalesState.success(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(SalesState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  @override
  Future<void> close() {
    quantityController.dispose();
    priceController.dispose();
    dateController.dispose();
    selectedInventoryId.dispose();
    return super.close();
  }
}
