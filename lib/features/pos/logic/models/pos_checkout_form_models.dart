import 'package:flutter/material.dart';

class PaymentRowData {
  String paymentMethod;
  final TextEditingController amountController;

  PaymentRowData({this.paymentMethod = 'cash', required this.amountController});
}

class PosCheckoutSummary {
  final double subtotal;
  final double total;
  final double totalPaid;

  const PosCheckoutSummary({
    this.subtotal = 0.0,
    this.total = 0.0,
    this.totalPaid = 0.0,
  });
}
