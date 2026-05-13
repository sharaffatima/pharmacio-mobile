import 'package:json_annotation/json_annotation.dart';

part 'pos_checkout_request.g.dart';

@JsonSerializable(explicitToJson: true)
class PosCheckoutRequest {
  final List<PosCheckoutItem> items;
  @JsonKey(name: 'discount_percentage')
  final String discountPercentage;
  final List<PosPaymentRequest> payments;

  PosCheckoutRequest({
    required this.items,
    required this.discountPercentage,
    required this.payments,
  });

  factory PosCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$PosCheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PosCheckoutRequestToJson(this);
}

@JsonSerializable()
class PosCheckoutItem {
  @JsonKey(name: 'inventory_id')
  final int inventoryItem;
  final int quantity;
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @JsonKey(name: 'discount_percentage')
  final String discountPercentage;

  PosCheckoutItem({
    required this.inventoryItem,
    required this.quantity,
    required this.unitPrice,
    required this.discountPercentage,
  });

  factory PosCheckoutItem.fromJson(Map<String, dynamic> json) =>
      _$PosCheckoutItemFromJson(json);

  Map<String, dynamic> toJson() => _$PosCheckoutItemToJson(this);
}

@JsonSerializable()
class PosPaymentRequest {
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'amount_paid')
  final String amountPaid;

  PosPaymentRequest({required this.paymentMethod, required this.amountPaid});

  factory PosPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PosPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PosPaymentRequestToJson(this);
}
