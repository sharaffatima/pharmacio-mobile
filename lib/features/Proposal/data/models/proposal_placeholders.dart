import 'package:json_annotation/json_annotation.dart';

part 'proposal_placeholders.g.dart';

@JsonSerializable()
class CompareResponse {
  final List<CompareEntry>? entries;

  CompareResponse({this.entries});

  factory CompareResponse.fromDynamic(dynamic json) {
    if (json is List) {
      return CompareResponse(
        entries: json
            .whereType<Map<String, dynamic>>()
            .map(CompareEntry.fromJson)
            .toList(),
      );
    }
    if (json is Map<String, dynamic>) {
      if (json['results'] is List) {
        return CompareResponse(
          entries: (json['results'] as List)
              .whereType<Map<String, dynamic>>()
              .map(CompareEntry.fromJson)
              .toList(),
        );
      }
      return CompareResponse.fromJson(json);
    }
    return CompareResponse(entries: const []);
  }

  factory CompareResponse.fromJson(Map<String, dynamic> json) =>
      _$CompareResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompareResponseToJson(this);
}

@JsonSerializable()
class CompareEntry {
  @JsonKey(name: 'drug_key')
  final String? drugKey;
  @JsonKey(name: 'drug_name')
  final String? drugName;
  final String? company;
  final String? status;
  final ProposalOfferPrice? best;
  final List<ProposalOfferPrice>? alternatives;

  CompareEntry({
    this.drugKey,
    this.drugName,
    this.company,
    this.status,
    this.best,
    this.alternatives,
  });

  factory CompareEntry.fromJson(Map<String, dynamic> json) =>
      _$CompareEntryFromJson(json);

  Map<String, dynamic> toJson() => _$CompareEntryToJson(this);
}

@JsonSerializable()
class ProposalOfferPrice {
  @JsonKey(name: 'offer_id')
  final int? offerId;
  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;
  final String? price;
  @JsonKey(name: 'item_id')
  final int? itemId;

  ProposalOfferPrice({
    this.offerId,
    this.wareHouseName,
    this.price,
    this.itemId,
  });

  factory ProposalOfferPrice.fromJson(Map<String, dynamic> json) =>
      _$ProposalOfferPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalOfferPriceToJson(this);
}

@JsonSerializable()
class GenerateProposalResponse {
  final int? id;
  final String? status;
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<ProposalItem>? items;

  GenerateProposalResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory GenerateProposalResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateProposalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateProposalResponseToJson(this);
}

@JsonSerializable()
class ProposalModel {
  final int? id;
  final String? status;
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<ProposalItem>? items;

  ProposalModel({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalModelToJson(this);
}

@JsonSerializable()
class ProposalListResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<ProposalModel>? results;

  ProposalListResponse({this.count, this.next, this.previous, this.results});

  factory ProposalListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalListResponseToJson(this);
}

@JsonSerializable()
class ProposalDetailResponse {
  final int? id;
  final String? status;
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<ProposalItem>? items;

  ProposalDetailResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory ProposalDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalDetailResponseToJson(this);
}

@JsonSerializable()
class ProposalActionResponse {
  final int? id;
  final String? status;
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<ProposalItem>? items;

  ProposalActionResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory ProposalActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalActionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalActionResponseToJson(this);
}

@JsonSerializable()
class ProposalStatusResponse {
  final int? id;
  final String? status;
  @JsonKey(name: 'total_cost')
  final String? totalCost;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  ProposalStatusResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ProposalStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalStatusResponseToJson(this);
}

@JsonSerializable()
class ProposalItem {
  final int? id;
  @JsonKey(name: 'product_name')
  final String? productName;
  final String? strength;
  final String? company;
  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;
  @JsonKey(name: 'proposed_quantity')
  final int? proposedQuantity;
  @JsonKey(name: 'unit_price')
  final String? unitPrice;
  @JsonKey(name: 'line_total')
  final String? lineTotal;

  ProposalItem({
    this.id,
    this.productName,
    this.strength,
    this.company,
    this.wareHouseName,
    this.proposedQuantity,
    this.unitPrice,
    this.lineTotal,
  });

  factory ProposalItem.fromJson(Map<String, dynamic> json) =>
      _$ProposalItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalItemToJson(this);
}
