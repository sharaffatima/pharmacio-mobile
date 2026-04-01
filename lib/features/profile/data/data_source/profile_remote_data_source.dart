import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiServicesImpl _apiServices;

  ProfileRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _apiServices.get(
      AppLinkUrl.profile,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzc1MTI1MzE5LCJpYXQiOjE3NzUwMzg5MTksImp0aSI6Ijc5MjYyYWNlYmRlZjQ2ZWRiN2RjOTBhNjJkYTZjYzFlIiwidXNlcl9pZCI6IjEifQ.jTuZa9lFWAQs0HWeSaJblpOZshEvwS6YCn5hSp8K-sA',
    );
    return ProfileModel.fromJson(response);
  }
}
