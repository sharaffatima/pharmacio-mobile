import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
  Future<String> exportPdf(List<int> ids);
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

  @override
  Future<String> exportPdf(List<int> ids) async {
    try {
      final dio = GetIt.I.get<Dio>();
      final response = await dio.get(
        AppLinkUrl.exportPdfProposals,
        queryParameters: {'ids': ids.join(',')},
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'Accept': 'application/pdf'},
        ),
      );
      final bytes = _coerceBytes(response.data);
      final fileName = 'proposals_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final dir = await _resolveDownloadDirectory();
      final filePath = '${dir.path}/$fileName';
      await File(filePath).writeAsBytes(bytes, flush: true);
      return filePath;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}

Future<Directory> _resolveDownloadDirectory() async {
  if (Platform.isAndroid) {
    await Permission.storage.request();
    final commonDownloads = Directory('/storage/emulated/0/Download');
    if (await commonDownloads.exists()) {
      return commonDownloads;
    }
    final externalDir = await getExternalStorageDirectory();
    if (externalDir != null) {
      final fallback = Directory('${externalDir.path}/Download');
      await fallback.create(recursive: true);
      return fallback;
    }
    throw const NetworkExceptions.unableToProcess();
  }

  if (Platform.isIOS) {
    final documentsDir = await getApplicationDocumentsDirectory();
    final downloadsDir = Directory('${documentsDir.path}/Downloads');
    await downloadsDir.create(recursive: true);
    return downloadsDir;
  }

  final dir = Directory('${Directory.systemTemp.path}/pharmacio');
  await dir.create(recursive: true);
  return dir;
}

List<int> _coerceBytes(dynamic data) {
  if (data is List<int>) {
    return data;
  }
  if (data is Uint8List) {
    return data;
  }
  if (data is List<dynamic>) {
    return data.cast<int>();
  }
  throw const NetworkExceptions.unableToProcess();
}
