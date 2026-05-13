import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/sales_remote_data_source.dart';
import '../models/sales_request.dart';
import '../models/sales_response.dart';

class SalesRepo {
  final NetworkInfo networkInfo;
  final SalesRemoteDataSource salesRemoteDataSource;

  SalesRepo({required this.networkInfo, required this.salesRemoteDataSource});

  Future<SalesResponseModel> recordSale(SalesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await salesRemoteDataSource.recordSale(request);
        return response;
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
