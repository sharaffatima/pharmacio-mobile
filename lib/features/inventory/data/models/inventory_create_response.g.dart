// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryCreateResponse _$InventoryCreateResponseFromJson(
  Map<String, dynamic> json,
) => InventoryCreateResponse(
  product: json['product'] as String,
  quantity: (json['quantity'] as num).toInt(),
  status: json['status'] as String,
);

Map<String, dynamic> _$InventoryCreateResponseToJson(
  InventoryCreateResponse instance,
) => <String, dynamic>{
  'product': instance.product,
  'quantity': instance.quantity,
  'status': instance.status,
};
