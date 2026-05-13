import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../models/pos_checkout_request.dart';
import '../models/pos_transaction_model.dart';

abstract class PosRemoteDataSource {
  Future<PosTransactionModel> checkout(PosCheckoutRequest request);
  Future<List<PosTransactionModel>> getTransactions();
  Future<PosTransactionModel> getReceipt(int id);
  Future<PosTransactionModel> refund(int id);
}

class PosRemoteDataSourceImpl implements PosRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  PosRemoteDataSourceImpl({required this.apiServicesImpl});

  @override
  Future<PosTransactionModel> checkout(PosCheckoutRequest request) async {
    try {
      print("Check Request Body: ${request.toJson()}");
      final response = await apiServicesImpl.post(
        AppLinkUrl.posCheckout,
        body: request.toJson(),
      );
      return PosTransactionModel.fromJson(response as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<PosTransactionModel>> getTransactions() async {
    try {
      final response = await apiServicesImpl.get(AppLinkUrl.posTransactions);
      final list = response as List<dynamic>;
      return list
          .map((e) => PosTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PosTransactionModel> getReceipt(int id) async {
    try {
      final response = await apiServicesImpl.get(
        '${AppLinkUrl.posTransactions}$id/receipt/',
      );
      return PosTransactionModel.fromJson(response as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PosTransactionModel> refund(int id) async {
    try {
      final response = await apiServicesImpl.post(
        '${AppLinkUrl.posTransactions}$id/refund/',
      );
      return PosTransactionModel.fromJson(response as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
