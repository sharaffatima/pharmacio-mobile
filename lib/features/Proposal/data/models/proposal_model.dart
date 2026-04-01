import 'package:json_annotation/json_annotation.dart';
import 'proposal_item_model.dart';

part 'proposal_model.g.dart';

@JsonSerializable()
class ProposalModel {
  final int id;
  final String status;

  @JsonKey(name: 'total_cost')
  final String totalCost;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'approved_by')
  final String? approvedBy;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final List<ProposalItemModel> items;

  const ProposalModel({
    required this.id,
    required this.status,
    required this.totalCost,
    required this.createdBy,
    this.approvedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalModelToJson(this);
}
