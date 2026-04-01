import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';

import '../../../../core/networking/api_services_impl.dart';
import '../models/proposals_response_model.dart';
import 'proposals_remote_data_source.dart';

class ProposalsRemoteDataSourceImpl implements ProposalsRemoteDataSource {
  final ApiServicesImpl _apiServices;

  ProposalsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ProposalsResponseModel> getProposals({required String token}) async {
    final response = await _apiServices.get(
      AppLinkUrl.purchaseProposals,
      token: token,
    );

    return ProposalsResponseModel.fromJson(response);
  }
}
