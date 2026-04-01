import 'package:json_annotation/json_annotation.dart';
import 'inventory_item_model.dart';

part 'inventory_response.g.dart';

@JsonSerializable()
class InventoryResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<InventoryItemModel> results;

  const InventoryResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory InventoryResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryResponseToJson(this);
}
