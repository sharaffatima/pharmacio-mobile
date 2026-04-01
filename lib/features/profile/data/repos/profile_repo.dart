import 'package:pharmacio_flutter_mobile/features/profile/data/models/profile_model.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile({required String token});
}
