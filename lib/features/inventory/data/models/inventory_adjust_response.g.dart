// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_adjust_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryAdjustResponse _$InventoryAdjustResponseFromJson(
  Map<String, dynamic> json,
) => InventoryAdjustResponse(
  id: (json['id'] as num).toInt(),
  product: json['product'] as String,
  previousQuantity: (json['previous_quantity'] as num).toInt(),
  adjustment: (json['adjustment'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$InventoryAdjustResponseToJson(
  InventoryAdjustResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'previous_quantity': instance.previousQuantity,
  'adjustment': instance.adjustment,
  'quantity': instance.quantity,
};
