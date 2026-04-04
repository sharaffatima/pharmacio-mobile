// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesResponseModel _$SalesResponseModelFromJson(Map<String, dynamic> json) =>
    SalesResponseModel(
      id: (json['id'] as num).toInt(),
      productName: json['product_name'] as String,
      strength: json['strength'] as String,
      quantitySold: (json['quantity_sold'] as num).toInt(),
      unitPrice: json['unit_price'] as String,
      soldAt: json['sold_at'] as String,
      inventoryId: (json['inventory_id'] as num).toInt(),
      remainingQuantity: (json['remaining_quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SalesResponseModelToJson(SalesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'strength': instance.strength,
      'quantity_sold': instance.quantitySold,
      'unit_price': instance.unitPrice,
      'sold_at': instance.soldAt,
      'inventory_id': instance.inventoryId,
      'remaining_quantity': instance.remainingQuantity,
    };
