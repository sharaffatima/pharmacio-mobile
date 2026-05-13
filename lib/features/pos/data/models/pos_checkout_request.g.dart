// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosCheckoutRequest _$PosCheckoutRequestFromJson(Map<String, dynamic> json) =>
    PosCheckoutRequest(
      items: (json['items'] as List<dynamic>)
          .map((e) => PosCheckoutItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      discountPercentage: json['discount_percentage'] as String,
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PosPaymentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PosCheckoutRequestToJson(PosCheckoutRequest instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'discount_percentage': instance.discountPercentage,
      'payments': instance.payments.map((e) => e.toJson()).toList(),
    };

PosCheckoutItem _$PosCheckoutItemFromJson(Map<String, dynamic> json) =>
    PosCheckoutItem(
      inventoryItem: (json['inventory_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      discountPercentage: json['discount_percentage'] as String,
    );

Map<String, dynamic> _$PosCheckoutItemToJson(PosCheckoutItem instance) =>
    <String, dynamic>{
      'inventory_id': instance.inventoryItem,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'discount_percentage': instance.discountPercentage,
    };

PosPaymentRequest _$PosPaymentRequestFromJson(Map<String, dynamic> json) =>
    PosPaymentRequest(
      paymentMethod: json['payment_method'] as String,
      amountPaid: json['amount_paid'] as String,
    );

Map<String, dynamic> _$PosPaymentRequestToJson(PosPaymentRequest instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'amount_paid': instance.amountPaid,
    };
