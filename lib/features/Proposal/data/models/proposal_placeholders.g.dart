// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_placeholders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareResponse _$CompareResponseFromJson(Map<String, dynamic> json) =>
    CompareResponse(message: json['message'] as String?);

Map<String, dynamic> _$CompareResponseToJson(CompareResponse instance) =>
    <String, dynamic>{'message': instance.message};

GenerateProposalResponse _$GenerateProposalResponseFromJson(
  Map<String, dynamic> json,
) => GenerateProposalResponse(message: json['message'] as String?);

Map<String, dynamic> _$GenerateProposalResponseToJson(
  GenerateProposalResponse instance,
) => <String, dynamic>{'message': instance.message};

ProposalModel _$ProposalModelFromJson(Map<String, dynamic> json) =>
    ProposalModel(id: (json['id'] as num).toInt());

Map<String, dynamic> _$ProposalModelToJson(ProposalModel instance) =>
    <String, dynamic>{'id': instance.id};

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
) => ProposalDetailResponse(id: (json['id'] as num?)?.toInt());

Map<String, dynamic> _$ProposalDetailResponseToJson(
  ProposalDetailResponse instance,
) => <String, dynamic>{'id': instance.id};

ProposalActionResponse _$ProposalActionResponseFromJson(
  Map<String, dynamic> json,
) => ProposalActionResponse(
  message: json['message'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$ProposalActionResponseToJson(
  ProposalActionResponse instance,
) => <String, dynamic>{'message': instance.message, 'status': instance.status};

ProposalStatusResponse _$ProposalStatusResponseFromJson(
  Map<String, dynamic> json,
) => ProposalStatusResponse(
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ProposalStatusResponseToJson(
  ProposalStatusResponse instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
