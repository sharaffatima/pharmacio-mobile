// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosTransactionModel _$PosTransactionModelFromJson(Map<String, dynamic> json) =>
    PosTransactionModel(
      id: (json['id'] as num).toInt(),
      receiptNumber: json['receipt_number'] as String,
      cashier: (json['cashier'] as num).toInt(),
      cashierName: json['cashier_name'] as String,
      status: json['status'] as String,
      discountPercentage: json['discount_percentage'] as String,
      subtotal: json['subtotal'] as String,
      totalAmount: json['total_amount'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PosTransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PosPaymentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PosTransactionModelToJson(
  PosTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'receipt_number': instance.receiptNumber,
  'cashier': instance.cashier,
  'cashier_name': instance.cashierName,
  'status': instance.status,
  'discount_percentage': instance.discountPercentage,
  'subtotal': instance.subtotal,
  'total_amount': instance.totalAmount,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'payments': instance.payments.map((e) => e.toJson()).toList(),
};

PosTransactionItem _$PosTransactionItemFromJson(Map<String, dynamic> json) =>
    PosTransactionItem(
      id: (json['id'] as num).toInt(),
      inventoryItem: (json['inventory_item'] as num).toInt(),
      productName: json['product_name'] as String,
      strength: json['strength'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      discountPercentage: json['discount_percentage'] as String,
      totalPrice: json['total_price'] as String,
    );

Map<String, dynamic> _$PosTransactionItemToJson(PosTransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inventory_item': instance.inventoryItem,
      'product_name': instance.productName,
      'strength': instance.strength,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'discount_percentage': instance.discountPercentage,
      'total_price': instance.totalPrice,
    };

PosPaymentDetail _$PosPaymentDetailFromJson(Map<String, dynamic> json) =>
    PosPaymentDetail(
      id: (json['id'] as num).toInt(),
      paymentMethod: json['payment_method'] as String,
      amountPaid: json['amount_paid'] as String,
    );

Map<String, dynamic> _$PosPaymentDetailToJson(PosPaymentDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_method': instance.paymentMethod,
      'amount_paid': instance.amountPaid,
    };
