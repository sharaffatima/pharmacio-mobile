import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../data_source/inventory_remote_data_source.dart';
import '../models/inventory_response.dart';

class InventoryRepo {
  final InventoryRemoteDataSource inventoryRemoteDataSource;
  final NetworkInfo networkInfo;

  InventoryRepo({
    required this.inventoryRemoteDataSource,
    required this.networkInfo,
  });

  Future<InventoryResponse> getInventory() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await inventoryRemoteDataSource.getInventory();
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
