part of '../cubits/profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(ProfileModel profile) = _Success;
  const factory ProfileState.failure(String errMessage) = _Failure;
}
