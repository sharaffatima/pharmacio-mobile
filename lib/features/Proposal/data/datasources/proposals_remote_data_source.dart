import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/available_offers_response.dart';
import '../models/proposal_placeholders.dart';

abstract class ProposalsRemoteDataSource {
  Future<AvailableOffersResponse> getAvailableOffers();
  Future<CompareResponse> compareOffers({required List<int> ocrResultIds});
  Future<GenerateProposalResponse> generateProposal({
    required List<int> ocrResultIds,
  });
  Future<ProposalListResponse> getProposals();
  Future<ProposalDetailResponse> getProposalDetail({required int proposalId});
  Future<ProposalActionResponse> approveProposal({required int proposalId});
  Future<ProposalActionResponse> rejectProposal({required int proposalId});
  Future<ProposalStatusResponse> getProposalStatus({required int proposalId});
}

class ProposalsRemoteDataSourceImpl implements ProposalsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProposalsRemoteDataSourceImpl({required this.apiServicesImpl});

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) throw Exception("Unauthorized");
    return token;
  }

  @override
  Future<AvailableOffersResponse> getAvailableOffers() async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.get(
        AppLinkUrl.availableOffers,
        token: token,
      );
      return AvailableOffersResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<CompareResponse> compareOffers({
    required List<int> ocrResultIds,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.post(
        AppLinkUrl.compareOffers,
        token: token,
        body: {'ocr_result_ids': ocrResultIds},
      );
      return CompareResponse.fromDynamic(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<GenerateProposalResponse> generateProposal({
    required List<int> ocrResultIds,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.post(
        AppLinkUrl.generateProposal,
        token: token,
        body: {'ocr_result_ids': ocrResultIds},
      );
      return GenerateProposalResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalListResponse> getProposals() async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposals,
        token: token,
      );
      return ProposalListResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalDetailResponse> getProposalDetail({
    required int proposalId,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.get(
        '${AppLinkUrl.purchaseProposals}$proposalId/',
        token: token,
      );
      return ProposalDetailResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalActionResponse> approveProposal({
    required int proposalId,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.post(
        '${AppLinkUrl.purchaseProposals}$proposalId/approve/',
        token: token,
      );
      return ProposalActionResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalActionResponse> rejectProposal({
    required int proposalId,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.post(
        '${AppLinkUrl.purchaseProposals}$proposalId/reject/',
        token: token,
      );
      return ProposalActionResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalStatusResponse> getProposalStatus({
    required int proposalId,
  }) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.get(
        '${AppLinkUrl.purchaseProposals}$proposalId/status/',
        token: token,
      );
      return ProposalStatusResponse.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
