// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryListResponse _$InventoryListResponseFromJson(
  Map<String, dynamic> json,
) => InventoryListResponse(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => InventoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InventoryListResponseToJson(
  InventoryListResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results.map((e) => e.toJson()).toList(),
};

InventoryItem _$InventoryItemFromJson(Map<String, dynamic> json) =>
    InventoryItem(
      product: json['product'] as String,
      quantity: (json['quantity'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$InventoryItemToJson(InventoryItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'status': instance.status,
    };
