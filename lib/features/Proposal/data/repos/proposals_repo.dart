import '../models/proposals_response_model.dart';

abstract class ProposalsRepo {
  Future<ProposalsResponseModel> getProposals({required String token});
}
