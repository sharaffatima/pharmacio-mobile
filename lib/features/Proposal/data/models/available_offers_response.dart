import 'package:json_annotation/json_annotation.dart';

part 'available_offers_response.g.dart';

@JsonSerializable()
class AvailableOffersResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<AvailableOfferModel> results;

  AvailableOffersResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory AvailableOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOffersResponseToJson(this);
}

@JsonSerializable()
class AvailableOfferModel {
  final int id;
  @JsonKey(name: 'file_id')
  final String fileId;
  @JsonKey(name: 'original_filename')
  final String originalFilename;
  @JsonKey(name: 'ware_house_name')
  final String wareHouseName;
  final String status;
  @JsonKey(name: 'confidence_score')
  final double confidenceScore;
  @JsonKey(name: 'review_required')
  final bool reviewRequired;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'items_count')
  final int itemsCount;

  AvailableOfferModel({
    required this.id,
    required this.fileId,
    required this.originalFilename,
    required this.wareHouseName,
    required this.status,
    required this.confidenceScore,
    required this.reviewRequired,
    required this.createdAt,
    required this.itemsCount,
  });

  factory AvailableOfferModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOfferModelToJson(this);
}
