import 'package:json_annotation/json_annotation.dart';

part 'inventory_create_request_body.g.dart';

@JsonSerializable()
class InventoryCreateRequestBody {
  @JsonKey(name: 'product_name')
  final String productName;

  final String strength;

  @JsonKey(name: 'quantity_on_hand')
  final int quantityOnHand;

  @JsonKey(name: 'min_threshold')
  final int minThreshold;

  InventoryCreateRequestBody({
    required this.productName,
    required this.strength,
    required this.quantityOnHand,
    required this.minThreshold,
  });

  factory InventoryCreateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$InventoryCreateRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryCreateRequestBodyToJson(this);
}
