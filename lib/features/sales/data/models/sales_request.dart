import 'package:json_annotation/json_annotation.dart';

part 'sales_request.g.dart';

@JsonSerializable()
class SalesRequestModel {
  @JsonKey(name: 'inventory_id')
  final int inventoryId;
  @JsonKey(name: 'quantity_sold')
  final int quantitySold;
  @JsonKey(name: 'unit_price')
  final String unitPrice;
  @JsonKey(name: 'sold_at')
  final String soldAt;

  SalesRequestModel({
    required this.inventoryId,
    required this.quantitySold,
    required this.unitPrice,
    required this.soldAt,
  });

  factory SalesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SalesRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesRequestModelToJson(this);
}
