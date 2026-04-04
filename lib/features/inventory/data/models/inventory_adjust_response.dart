import 'package:json_annotation/json_annotation.dart';

part 'inventory_adjust_response.g.dart';

@JsonSerializable()
class InventoryAdjustResponse {
  final int id;
  final String product;

  @JsonKey(name: 'previous_quantity')
  final int previousQuantity;

  final int adjustment;
  final int quantity;

  InventoryAdjustResponse({
    required this.id,
    required this.product,
    required this.previousQuantity,
    required this.adjustment,
    required this.quantity,
  });

  factory InventoryAdjustResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryAdjustResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryAdjustResponseToJson(this);
}
