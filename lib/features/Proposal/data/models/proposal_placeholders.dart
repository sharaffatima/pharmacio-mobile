import 'package:json_annotation/json_annotation.dart';

part 'proposal_placeholders.g.dart';

// ---------------------------------------------------------
// Placeholder Responses
// ---------------------------------------------------------

@JsonSerializable()
class CompareResponse {
  final String? message;

  CompareResponse({this.message});

  factory CompareResponse.fromJson(Map<String, dynamic> json) =>
      _$CompareResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompareResponseToJson(this);
}

@JsonSerializable()
class GenerateProposalResponse {
  final String? message;

  GenerateProposalResponse({this.message});

  factory GenerateProposalResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateProposalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateProposalResponseToJson(this);
}

@JsonSerializable()
class ProposalModel {
  final int id;
  // TODO: Add actual fields here once the backend returns the proposal list.
  
  ProposalModel({required this.id});

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

  ProposalListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ProposalListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalListResponseToJson(this);
}

@JsonSerializable()
class ProposalDetailResponse {
  final int? id;
  // TODO: Add detailed fields here

  ProposalDetailResponse({this.id});

  factory ProposalDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalDetailResponseToJson(this);
}

@JsonSerializable()
class ProposalActionResponse {
  final String? message;
  final String? status;

  ProposalActionResponse({this.message, this.status});

  factory ProposalActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalActionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalActionResponseToJson(this);
}

@JsonSerializable()
class ProposalStatusResponse {
  final String? status;
  final String? message;

  ProposalStatusResponse({this.status, this.message});

  factory ProposalStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalStatusResponseToJson(this);
}
