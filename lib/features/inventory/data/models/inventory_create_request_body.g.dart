// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_create_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryCreateRequestBody _$InventoryCreateRequestBodyFromJson(
  Map<String, dynamic> json,
) => InventoryCreateRequestBody(
  productName: json['product_name'] as String,
  strength: json['strength'] as String,
  quantityOnHand: (json['quantity_on_hand'] as num).toInt(),
  minThreshold: (json['min_threshold'] as num).toInt(),
);

Map<String, dynamic> _$InventoryCreateRequestBodyToJson(
  InventoryCreateRequestBody instance,
) => <String, dynamic>{
  'product_name': instance.productName,
  'strength': instance.strength,
  'quantity_on_hand': instance.quantityOnHand,
  'min_threshold': instance.minThreshold,
};
