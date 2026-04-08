// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableOffersResponse _$AvailableOffersResponseFromJson(
  Map<String, dynamic> json,
) => AvailableOffersResponse(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => AvailableOfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AvailableOffersResponseToJson(
  AvailableOffersResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

AvailableOfferModel _$AvailableOfferModelFromJson(Map<String, dynamic> json) =>
    AvailableOfferModel(
      id: (json['id'] as num?)?.toInt(),
      fileId: json['file_id'] as String?,
      originalFilename: json['original_filename'] as String?,
      wareHouseName: json['ware_house_name'] as String?,
      status: json['status'] as String?,
      confidenceScore: (json['confidence_score'] as num?)?.toDouble(),
      reviewRequired: json['review_required'] as bool?,
      createdAt: json['created_at'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AvailableOfferModelToJson(
  AvailableOfferModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_id': instance.fileId,
  'original_filename': instance.originalFilename,
  'ware_house_name': instance.wareHouseName,
  'status': instance.status,
  'confidence_score': instance.confidenceScore,
  'review_required': instance.reviewRequired,
  'created_at': instance.createdAt,
  'items_count': instance.itemsCount,
};
