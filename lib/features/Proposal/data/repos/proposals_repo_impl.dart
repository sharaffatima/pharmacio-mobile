import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../../../core/networking/network_info.dart';
import '../data_source/proposals_remote_data_source.dart';
import '../models/proposals_response_model.dart';
import 'proposals_repo.dart';

class ProposalsRepoImpl implements ProposalsRepo {
  final ProposalsRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ProposalsRepoImpl({
    required ProposalsRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _remoteDataSource = remoteDataSource,
       _networkInfo = networkInfo;

  @override
  Future<ProposalsResponseModel> getProposals({required String token}) async {
    if (!await _networkInfo.isConnected) {
      throw NetworkExceptions.noInternetConnection();
    }

    try {
      return await _remoteDataSource.getProposals(token: token);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
