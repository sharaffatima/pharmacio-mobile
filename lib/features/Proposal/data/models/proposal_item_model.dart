import 'package:json_annotation/json_annotation.dart';

part 'proposal_item_model.g.dart';

@JsonSerializable()
class ProposalItemModel {
  final int id;

  @JsonKey(name: 'product_name')
  final String productName;

  final String strength;
  final String company;

  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;

  @JsonKey(name: 'proposed_quantity')
  final int proposedQuantity;

  @JsonKey(name: 'unit_price')
  final String unitPrice;

  @JsonKey(name: 'line_total')
  final String lineTotal;

  const ProposalItemModel({
    required this.id,
    required this.productName,
    required this.strength,
    required this.company,
    this.wareHouseName,
    required this.proposedQuantity,
    required this.unitPrice,
    required this.lineTotal,
  });

  factory ProposalItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalItemModelToJson(this);
}
