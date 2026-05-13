import 'package:json_annotation/json_annotation.dart';

part 'pos_transaction_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PosTransactionModel {
  final int id;
  @JsonKey(name: 'receipt_number')
  final String receiptNumber;
  final int cashier;
  @JsonKey(name: 'cashier_name')
  final String cashierName;
  final String status;
  @JsonKey(name: 'discount_percentage')
  final String discountPercentage;
  final String subtotal;
  @JsonKey(name: 'total_amount')
  final String totalAmount;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<PosTransactionItem> items;
  final List<PosPaymentDetail> payments;

  PosTransactionModel({
    required this.id,
    required this.receiptNumber,
    required this.cashier,
    required this.cashierName,
    required this.status,
    required this.discountPercentage,
    required this.subtotal,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
    required this.payments,
  });

  factory PosTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$PosTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PosTransactionModelToJson(this);
}

@JsonSerializable()
class PosTransactionItem {
  final int id;
  @JsonKey(name: 'inventory_item')
  final int inventoryItem;
  @JsonKey(name: 'product_name')
  final String productName;
  final String strength;
  final int quantity;
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @JsonKey(name: 'discount_percentage')
  final String discountPercentage;
  @JsonKey(name: 'total_price')
  final String totalPrice;

  PosTransactionItem({
    required this.id,
    required this.inventoryItem,
    required this.productName,
    required this.strength,
    required this.quantity,
    required this.unitPrice,
    required this.discountPercentage,
    required this.totalPrice,
  });

  factory PosTransactionItem.fromJson(Map<String, dynamic> json) =>
      _$PosTransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$PosTransactionItemToJson(this);
}

@JsonSerializable()
class PosPaymentDetail {
  final int id;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'amount_paid')
  final String amountPaid;

  PosPaymentDetail({
    required this.id,
    required this.paymentMethod,
    required this.amountPaid,
  });

  factory PosPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PosPaymentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PosPaymentDetailToJson(this);
}
