part of '../cubits/proposals_cubit.dart';

@freezed
class ProposalsState with _$ProposalsState {
  const factory ProposalsState.initial() = _Initial;
  const factory ProposalsState.loading() = _Loading;
  const factory ProposalsState.success(ProposalsResponseModel proposals) =
      _Success;
  const factory ProposalsState.error(String message) = _Error;
}
