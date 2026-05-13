import 'package:json_annotation/json_annotation.dart';

part 'inventory_adjust_request_body.g.dart';

@JsonSerializable()
class InventoryAdjustRequestBody {
  final int adjustment;
  final String reason;

  InventoryAdjustRequestBody({required this.adjustment, required this.reason});

  factory InventoryAdjustRequestBody.fromJson(Map<String, dynamic> json) =>
      _$InventoryAdjustRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryAdjustRequestBodyToJson(this);
}
