import 'package:json_annotation/json_annotation.dart';

part 'upload_offer_response.g.dart';

@JsonSerializable()
class UploadOfferResponse {
  @JsonKey(name: 'upload_id')
  final String uploadId;

  @JsonKey(name: 'original_filename')
  final String originalFilename;

  @JsonKey(name: 'file_url')
  final String fileUrl;

  final String status;
  final String message;

  @JsonKey(name: 'created_at')
  final String createdAt;

  UploadOfferResponse({
    required this.uploadId,
    required this.originalFilename,
    required this.fileUrl,
    required this.status,
    required this.message,
    required this.createdAt,
  });

  factory UploadOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadOfferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadOfferResponseToJson(this);
}
