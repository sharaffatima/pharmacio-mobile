// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalModel _$ProposalModelFromJson(Map<String, dynamic> json) =>
    ProposalModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      totalCost: json['total_cost'] as String,
      createdBy: json['created_by'] as String,
      approvedBy: json['approved_by'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ProposalItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProposalModelToJson(ProposalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'total_cost': instance.totalCost,
      'created_by': instance.createdBy,
      'approved_by': instance.approvedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'items': instance.items,
    };
