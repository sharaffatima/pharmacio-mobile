import '../models/proposals_response_model.dart';

abstract class ProposalsRemoteDataSource {
  Future<ProposalsResponseModel> getProposals({required String token});
}
