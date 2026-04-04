import 'package:json_annotation/json_annotation.dart';

part 'sales_response.g.dart';

@JsonSerializable()
class SalesResponseModel {
  final int id;
  @JsonKey(name: 'product_name')
  final String productName;
  final String strength;
  @JsonKey(name: 'quantity_sold')
  final int quantitySold;
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @JsonKey(name: 'sold_at')
  final String soldAt;
  @JsonKey(name: 'inventory_id')
  final int inventoryId;
  @JsonKey(name: 'remaining_quantity')
  final int remainingQuantity;

  SalesResponseModel({
    required this.id,
    required this.productName,
    required this.strength,
    required this.quantitySold,
    required this.unitPrice,
    required this.soldAt,
    required this.inventoryId,
    required this.remainingQuantity,
  });

  factory SalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesResponseModelToJson(this);
}
