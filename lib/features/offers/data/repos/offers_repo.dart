import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/offers_remote_data_source.dart';
import '../models/upload_offer_response.dart';
import '../models/upload_status_response.dart';

class OffersRepo {
  final OffersRemoteDataSource offersRemoteDataSource;
  final NetworkInfo networkInfo;

  OffersRepo({
    required this.offersRemoteDataSource,
    required this.networkInfo,
  });

  Future<UploadOfferResponse> uploadOfferFile({
    required String filePath,
    required String fileName,
    required String wareHouseName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await offersRemoteDataSource.uploadOfferFile(
          filePath: filePath,
          fileName: fileName,
          wareHouseName: wareHouseName,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<UploadStatusResponse> getUploadStatus(String uploadId) async {
    if (await networkInfo.isConnected) {
      try {
        return await offersRemoteDataSource.getUploadStatus(uploadId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
