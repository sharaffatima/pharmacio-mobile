import 'package:json_annotation/json_annotation.dart';

part 'inventory_create_response.g.dart';

@JsonSerializable()
class InventoryCreateResponse {
  final String product;
  final int quantity;
  final String status;

  InventoryCreateResponse({
    required this.product,
    required this.quantity,
    required this.status,
  });

  factory InventoryCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryCreateResponseToJson(this);
}
