// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRequestModel _$SalesRequestModelFromJson(Map<String, dynamic> json) =>
    SalesRequestModel(
      inventoryId: (json['inventory_id'] as num).toInt(),
      quantitySold: (json['quantity_sold'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      soldAt: json['sold_at'] as String,
    );

Map<String, dynamic> _$SalesRequestModelToJson(SalesRequestModel instance) =>
    <String, dynamic>{
      'inventory_id': instance.inventoryId,
      'quantity_sold': instance.quantitySold,
      'unit_price': instance.unitPrice,
      'sold_at': instance.soldAt,
    };
