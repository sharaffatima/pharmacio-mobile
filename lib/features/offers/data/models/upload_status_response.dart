import 'package:json_annotation/json_annotation.dart';

part 'upload_status_response.g.dart';

@JsonSerializable()
class UploadStatusResponse {
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

  UploadStatusResponse({
    required this.uploadId,
    required this.originalFilename,
    required this.fileUrl,
    required this.status,
    required this.message,
    required this.createdAt,
  });

  factory UploadStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadStatusResponseToJson(this);
}
