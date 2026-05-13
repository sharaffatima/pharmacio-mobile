import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/pos_remote_data_source.dart';
import '../models/pos_checkout_request.dart';
import '../models/pos_transaction_model.dart';

class PosRepo {
  final NetworkInfo networkInfo;
  final PosRemoteDataSource posRemoteDataSource;

  PosRepo({required this.networkInfo, required this.posRemoteDataSource});

  Future<PosTransactionModel> checkout(PosCheckoutRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.checkout(request);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<PosTransactionModel>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.getTransactions();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PosTransactionModel> getReceipt(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.getReceipt(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PosTransactionModel> refund(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.refund(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
