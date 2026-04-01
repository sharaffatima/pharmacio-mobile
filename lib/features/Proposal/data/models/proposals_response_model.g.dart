// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposals_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalsResponseModel _$ProposalsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProposalsResponseModel(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ProposalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProposalsResponseModelToJson(
  ProposalsResponseModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
