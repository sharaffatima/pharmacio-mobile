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
  final String product;
  final int quantity;
  final String status;

  InventoryItem({
    required this.product,
    required this.quantity,
    required this.status,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}
