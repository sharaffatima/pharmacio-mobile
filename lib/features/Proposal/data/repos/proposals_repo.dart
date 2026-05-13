import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';

import '../datasources/proposals_remote_data_source.dart';
import '../models/available_offers_response.dart';
import '../models/proposal_placeholders.dart';

class ProposalsRepo {
  final ProposalsRemoteDataSource proposalsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProposalsRepo({
    required this.proposalsRemoteDataSource,
    required this.networkInfo,
  });

  Future<AvailableOffersResponse> getAvailableOffers() async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getAvailableOffers();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<CompareResponse> compareOffers({
    required List<int> ocrResultIds,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.compareOffers(
          ocrResultIds: ocrResultIds,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<GenerateProposalResponse> generateProposal({
    required List<int> ocrResultIds,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.generateProposal(
          ocrResultIds: ocrResultIds,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalListResponse> getProposals() async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposals();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalDetailResponse> getProposalDetail({
    required int proposalId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalDetail(
          proposalId: proposalId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalActionResponse> approveProposal({
    required int proposalId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.approveProposal(
          proposalId: proposalId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalActionResponse> rejectProposal({
    required int proposalId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.rejectProposal(
          proposalId: proposalId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalStatusResponse> getProposalStatus({
    required int proposalId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalStatus(
          proposalId: proposalId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<String> exportPdf(List<int> ids) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.exportPdf(ids);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
