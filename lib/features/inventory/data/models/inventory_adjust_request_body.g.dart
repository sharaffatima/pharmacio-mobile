// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_adjust_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryAdjustRequestBody _$InventoryAdjustRequestBodyFromJson(
  Map<String, dynamic> json,
) => InventoryAdjustRequestBody(
  adjustment: (json['adjustment'] as num).toInt(),
  reason: json['reason'] as String,
);

Map<String, dynamic> _$InventoryAdjustRequestBodyToJson(
  InventoryAdjustRequestBody instance,
) => <String, dynamic>{
  'adjustment': instance.adjustment,
  'reason': instance.reason,
};
