import 'package:json_annotation/json_annotation.dart';

part 'available_offers_response.g.dart';

@JsonSerializable()
class AvailableOffersResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<AvailableOfferModel>? results;

  AvailableOffersResponse({this.count, this.next, this.previous, this.results});

  factory AvailableOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOffersResponseToJson(this);
}

@JsonSerializable()
class AvailableOfferModel {
  final int? id;
  @JsonKey(name: 'file_id')
  final String? fileId;
  @JsonKey(name: 'original_filename')
  final String? originalFilename;
  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;
  final String? status;
  @JsonKey(name: 'confidence_score')
  final double? confidenceScore;
  @JsonKey(name: 'review_required')
  final bool? reviewRequired;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'items_count')
  final int? itemsCount;

  AvailableOfferModel({
    this.id,
    this.fileId,
    this.originalFilename,
    this.wareHouseName,
    this.status,
    this.confidenceScore,
    this.reviewRequired,
    this.createdAt,
    this.itemsCount,
  });

  factory AvailableOfferModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOfferModelToJson(this);
}
