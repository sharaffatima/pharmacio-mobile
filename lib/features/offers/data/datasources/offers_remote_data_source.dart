import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/upload_offer_response.dart';
import '../models/upload_status_response.dart';

abstract class OffersRemoteDataSource {
  Future<UploadOfferResponse> uploadOfferFile({
    required String filePath,
    required String fileName,
    required String wareHouseName,
  });

  Future<UploadStatusResponse> getUploadStatus(String uploadId);
}

class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  OffersRemoteDataSourceImpl({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<UploadOfferResponse> uploadOfferFile({
    required String filePath,
    required String fileName,
    required String wareHouseName,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        'ware_house_name': wareHouseName,
      });

      final request = await apiServicesImpl.post(
        AppLinkUrl.offersUpload,
        formData: formData,
        token: _accessToken,
      );
      return UploadOfferResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<UploadStatusResponse> getUploadStatus(String uploadId) async {
    try {
      final request = await apiServicesImpl.get(
        '${AppLinkUrl.offersUploads}$uploadId/status/',
        token: _accessToken,
      );
      return UploadStatusResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
