import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../data/models/pos_checkout_request.dart';
import '../../data/repos/pos_repo.dart';
import '../models/pos_checkout_form_models.dart';
import '../states/pos_checkout_state.dart';

export '../models/pos_checkout_form_models.dart';

class PosCheckoutCubit extends Cubit<PosCheckoutState> {
  final PosRepo posRepo;

  PosCheckoutCubit(this.posRepo)
    : formKey = GlobalKey<FormState>(),
      quantityController = TextEditingController(),
      priceController = TextEditingController(),
      discountController = TextEditingController(text: '0.00'),
      selectedInventoryId = ValueNotifier<int?>(null),
      summary = ValueNotifier(const PosCheckoutSummary()),
      paymentRowsNotifier = ValueNotifier([]),
      super(const PosCheckoutState.initial()) {
    final initialRow = PaymentRowData(
      paymentMethod: 'cash',
      amountController: TextEditingController(),
    );
    initialRow.amountController.addListener(_recalculate);
    paymentRowsNotifier.value = [initialRow];

    quantityController.addListener(_recalculate);
    priceController.addListener(_recalculate);
    discountController.addListener(_recalculate);
  }

  final GlobalKey<FormState> formKey;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final TextEditingController discountController;
  final ValueNotifier<int?> selectedInventoryId;
  final ValueNotifier<PosCheckoutSummary> summary;
  final ValueNotifier<List<PaymentRowData>> paymentRowsNotifier;

  void _recalculate() {
    final qty = double.tryParse(quantityController.text) ?? 0;
    final price = double.tryParse(priceController.text) ?? 0;
    final discount = double.tryParse(discountController.text) ?? 0;
    final sub = qty * price;
    final total = sub * (1 - discount / 100);
    final paid = paymentRowsNotifier.value.fold<double>(
      0.0,
      (sum, r) => sum + (double.tryParse(r.amountController.text) ?? 0),
    );
    summary.value = PosCheckoutSummary(
      subtotal: sub,
      total: total,
      totalPaid: paid,
    );
  }

  void setSelectedInventoryId(int? id) {
    selectedInventoryId.value = id;
  }

  void addPaymentRow() {
    final row = PaymentRowData(
      paymentMethod: 'cash',
      amountController: TextEditingController(),
    );
    row.amountController.addListener(_recalculate);
    paymentRowsNotifier.value = [...paymentRowsNotifier.value, row];
  }

  void removePaymentRow(int index) {
    if (paymentRowsNotifier.value.length <= 1) return;
    final rows = List<PaymentRowData>.from(paymentRowsNotifier.value);
    rows[index].amountController.removeListener(_recalculate);
    rows[index].amountController.dispose();
    rows.removeAt(index);
    paymentRowsNotifier.value = rows;
    _recalculate();
  }

  void setPaymentMethod(int index, String method) {
    final rows = List<PaymentRowData>.from(paymentRowsNotifier.value);
    rows[index].paymentMethod = method;
    paymentRowsNotifier.value = rows;
  }

  String? validatePayments() {
    final paid = summary.value.totalPaid;
    final total = summary.value.total;
    if (paid <= 0) return AppStrings.paymentAmountRequired;
    if ((paid - total).abs() > 0.01) return AppStrings.paymentMismatch;
    return null;
  }

  PosCheckoutRequest? buildRequestIfValid() {
    if (!formKey.currentState!.validate() ||
        selectedInventoryId.value == null) {
      return null;
    }
    final payments = paymentRowsNotifier.value
        .map(
          (row) => PosPaymentRequest(
            paymentMethod: row.paymentMethod,
            amountPaid: row.amountController.text,
          ),
        )
        .toList();

    final discount = discountController.text.isEmpty
        ? '0.00'
        : discountController.text;
    return PosCheckoutRequest(
      items: [
        PosCheckoutItem(
          inventoryItem: selectedInventoryId.value!,
          quantity: int.parse(quantityController.text),
          unitPrice: priceController.text,
          discountPercentage: discount,
        ),
      ],
      discountPercentage: discount,
      payments: payments,
    );
  }

  Future<void> checkout(PosCheckoutRequest request) async {
    emit(const PosCheckoutState.loading());
    try {
      final result = await posRepo.checkout(request);
      emit(PosCheckoutState.success(result));
    } catch (e) {
      final ex = NetworkExceptions.getException(e);
      emit(PosCheckoutState.error(NetworkExceptions.getErrorMessage(ex)));
    }
  }

  void resetForm() {
    quantityController.clear();
    priceController.clear();
    discountController.text = '0.00';
    selectedInventoryId.value = null;
    for (final row in paymentRowsNotifier.value) {
      row.amountController.removeListener(_recalculate);
      row.amountController.dispose();
    }
    final initialRow = PaymentRowData(
      paymentMethod: 'cash',
      amountController: TextEditingController(),
    );
    initialRow.amountController.addListener(_recalculate);
    paymentRowsNotifier.value = [initialRow];
    _recalculate();
    emit(const PosCheckoutState.initial());
  }

  @override
  Future<void> close() {
    quantityController.removeListener(_recalculate);
    priceController.removeListener(_recalculate);
    discountController.removeListener(_recalculate);
    quantityController.dispose();
    priceController.dispose();
    discountController.dispose();
    selectedInventoryId.dispose();
    summary.dispose();
    for (final row in paymentRowsNotifier.value) {
      row.amountController.removeListener(_recalculate);
      row.amountController.dispose();
    }
    paymentRowsNotifier.dispose();
    return super.close();
  }
}
