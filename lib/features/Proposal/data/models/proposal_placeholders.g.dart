// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_placeholders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareResponse _$CompareResponseFromJson(Map<String, dynamic> json) =>
    CompareResponse(
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => CompareEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompareResponseToJson(CompareResponse instance) =>
    <String, dynamic>{'entries': instance.entries};

CompareEntry _$CompareEntryFromJson(Map<String, dynamic> json) => CompareEntry(
  drugKey: json['drug_key'] as String?,
  drugName: json['drug_name'] as String?,
  company: json['company'] as String?,
  status: json['status'] as String?,
  best: json['best'] == null
      ? null
      : ProposalOfferPrice.fromJson(json['best'] as Map<String, dynamic>),
  alternatives: (json['alternatives'] as List<dynamic>?)
      ?.map((e) => ProposalOfferPrice.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompareEntryToJson(CompareEntry instance) =>
    <String, dynamic>{
      'drug_key': instance.drugKey,
      'drug_name': instance.drugName,
      'company': instance.company,
      'status': instance.status,
      'best': instance.best,
      'alternatives': instance.alternatives,
    };

ProposalOfferPrice _$ProposalOfferPriceFromJson(Map<String, dynamic> json) =>
    ProposalOfferPrice(
      offerId: (json['offer_id'] as num?)?.toInt(),
      wareHouseName: json['ware_house_name'] as String?,
      price: json['price'] as String?,
      itemId: (json['item_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProposalOfferPriceToJson(ProposalOfferPrice instance) =>
    <String, dynamic>{
      'offer_id': instance.offerId,
      'ware_house_name': instance.wareHouseName,
      'price': instance.price,
      'item_id': instance.itemId,
    };

GenerateProposalResponse _$GenerateProposalResponseFromJson(
  Map<String, dynamic> json,
) => GenerateProposalResponse(
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalCost: json['total_cost'] as String?,
  createdBy: json['created_by'] as String?,
  approvedBy: json['approved_by'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProposalItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GenerateProposalResponseToJson(
  GenerateProposalResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items,
};

ProposalModel _$ProposalModelFromJson(Map<String, dynamic> json) =>
    ProposalModel(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      totalCost: json['total_cost'] as String?,
      createdBy: json['created_by'] as String?,
      approvedBy: json['approved_by'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProposalItem.fromJson(e as Map<String, dynamic>))
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

ProposalListResponse _$ProposalListResponseFromJson(
  Map<String, dynamic> json,
) => ProposalListResponse(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => ProposalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProposalListResponseToJson(
  ProposalListResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

ProposalDetailResponse _$ProposalDetailResponseFromJson(
  Map<String, dynamic> json,
) => ProposalDetailResponse(
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalCost: json['total_cost'] as String?,
  createdBy: json['created_by'] as String?,
  approvedBy: json['approved_by'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProposalItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProposalDetailResponseToJson(
  ProposalDetailResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items,
};

ProposalActionResponse _$ProposalActionResponseFromJson(
  Map<String, dynamic> json,
) => ProposalActionResponse(
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalCost: json['total_cost'] as String?,
  createdBy: json['created_by'] as String?,
  approvedBy: json['approved_by'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProposalItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProposalActionResponseToJson(
  ProposalActionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items,
};

ProposalStatusResponse _$ProposalStatusResponseFromJson(
  Map<String, dynamic> json,
) => ProposalStatusResponse(
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalCost: json['total_cost'] as String?,
  createdBy: json['created_by'] as String?,
  approvedBy: json['approved_by'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ProposalStatusResponseToJson(
  ProposalStatusResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

ProposalItem _$ProposalItemFromJson(Map<String, dynamic> json) => ProposalItem(
  id: (json['id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  strength: json['strength'] as String?,
  company: json['company'] as String?,
  wareHouseName: json['ware_house_name'] as String?,
  proposedQuantity: (json['proposed_quantity'] as num?)?.toInt(),
  unitPrice: json['unit_price'] as String?,
  lineTotal: json['line_total'] as String?,
);

Map<String, dynamic> _$ProposalItemToJson(ProposalItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'strength': instance.strength,
      'company': instance.company,
      'ware_house_name': instance.wareHouseName,
      'proposed_quantity': instance.proposedQuantity,
      'unit_price': instance.unitPrice,
      'line_total': instance.lineTotal,
    };
