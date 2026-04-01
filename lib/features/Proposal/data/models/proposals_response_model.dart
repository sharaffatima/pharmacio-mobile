import 'package:json_annotation/json_annotation.dart';
import 'proposal_model.dart';

part 'proposals_response_model.g.dart';

@JsonSerializable()
class ProposalsResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<ProposalModel> results;

  const ProposalsResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ProposalsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalsResponseModelToJson(this);
}
