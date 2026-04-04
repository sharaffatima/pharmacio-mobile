import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_create_response.dart';
import '../models/inventory_list_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryListResponse> getInventoryList();
  Future<InventoryCreateResponse> createInventory(
    InventoryCreateRequestBody requestBody,
  );
  Future<InventoryAdjustResponse> adjustInventory(
    int inventoryId,
    InventoryAdjustRequestBody requestBody,
  );
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  InventoryRemoteDataSourceImpl({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<InventoryListResponse> getInventoryList() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.inventory,
        token: _accessToken,
      );
      return InventoryListResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryCreateResponse> createInventory(
    InventoryCreateRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.inventory,
        body: {
          'product_name': requestBody.productName,
          'strength': requestBody.strength,
          'quantity_on_hand': requestBody.quantityOnHand,
          'min_threshold': requestBody.minThreshold,
        },
        token: _accessToken,
      );
      return InventoryCreateResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryAdjustResponse> adjustInventory(
    int inventoryId,
    InventoryAdjustRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.inventory}$inventoryId/adjust/',
        body: {
          'adjustment': requestBody.adjustment,
          'reason': requestBody.reason,
        },
        token: _accessToken,
      );
      return InventoryAdjustResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
