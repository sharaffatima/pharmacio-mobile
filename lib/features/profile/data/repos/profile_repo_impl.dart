import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/models/profile_model.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ProfileRepoImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<ProfileModel> getProfile({required String token}) async {
    if (!await _networkInfo.isConnected) {
      throw NetworkExceptions.noInternetConnection();
    }
    try {
      return await _remoteDataSource.getProfile();
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
