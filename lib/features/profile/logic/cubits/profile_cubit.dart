import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/models/profile_model.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/repos/profile_repo.dart';

part '../states/profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  Future<void> getProfile({required String token}) async {
    emit(const ProfileState.loading());
    try {
      final profile = await _profileRepo.getProfile(token: token);
      emit(ProfileState.success(profile));
    } catch (e) {
      emit(ProfileState.failure(e.toString()));
    }
  }
}
