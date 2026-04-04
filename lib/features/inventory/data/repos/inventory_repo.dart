import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../dataSources/inventory_remote_data_source.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_create_response.dart';
import '../models/inventory_list_response.dart';

class InventoryRepo {
  final InventoryRemoteDataSource inventoryRemoteDataSource;
  final NetworkInfo networkInfo;

  InventoryRepo({
    required this.inventoryRemoteDataSource,
    required this.networkInfo,
  });

  Future<InventoryListResponse> getInventoryList() async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.getInventoryList();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryCreateResponse> createInventory(
    InventoryCreateRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.createInventory(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryAdjustResponse> adjustInventory(
    int inventoryId,
    InventoryAdjustRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.adjustInventory(
          inventoryId,
          requestBody,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
