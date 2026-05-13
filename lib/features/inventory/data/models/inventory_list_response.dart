import 'package:json_annotation/json_annotation.dart';

part 'inventory_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InventoryListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<InventoryItem> results;

  InventoryListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory InventoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryListResponseToJson(this);
}

@JsonSerializable()
class InventoryItem {
  final int id;
  final String product;
  final String? strength;
  final int quantity;
  final String status;
  final String? barcode;

  InventoryItem({
    required this.id,
    required this.product,
    this.strength,
    required this.quantity,
    required this.status,
    this.barcode,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}
